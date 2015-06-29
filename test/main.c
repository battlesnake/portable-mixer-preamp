#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>
#include <stdint.h>
#include <math.h>
#include "main.h"
#include "sine.h"
#include "square.h"
#include "triangle.h"
#include "const.h"

static int n_waveforms = 3;

static char *waveforms[] = {
	"sine",
	"square",
	"triangle"
};

static double r_rms[] = {
	SQRT_2,
	1,
	SQRT_3
};

static double r_rms_max = SQRT_3;

int waveform_index(char *name)
{
	for (int i = 0; i < n_waveforms; i++) {
		if (strcmp(name, waveforms[i]) == 0) {
			return i;
		}
	}
	return -1;
}

int main(int argc, char **argv)
{
	struct PARAMS params;
	params.rate = 48000;
	params.freq = 50;
	params.type = 0;
	params.amplitude = 0.3;
	if (get_params(argc, argv, &params) != 0) {
		return 1;
	}
	if (alsaPlay(params.rate, generate_waveform, &params) != 0) {
		fprintf(stderr, "Error: Failed to generate/play waveform\n");
		return 2;
	}
	return 0;
}

int get_params(int argc, char **argv, struct PARAMS *params)
{
	char type_s[12];
	if (argc == 1) {
		fprintf(stderr, "Info: Specify 'help' or '-h' or '--help' parameters for help on how to use this program\n");
	}
	for (int i = 1; i < argc; i++) {
		if (strcmp(argv[i], "help") == 0 ||
			strcmp(argv[i], "-h") == 0 ||
			strcmp(argv[i], "--help") == 0) {
			show_help(argv[0]);
			return 1;
		} else if (sscanf(argv[i], "r=%u", &params->rate) == 1) {
			/* */
		} else if (sscanf(argv[i], "f=%u", &params->freq) == 1) {
			if (params->freq == 0) {
				fprintf(stderr, "Error: Sample rate cannot be zero\n");
				return 1;
			}
		} else if (sscanf(argv[i], "t=%u", &params->type) == 1) {
			if (params->type > 2) {
				fprintf(stderr, "Error: Invalid waveform number: %u\n", params->type);
				return 1;
			}
		} else if (sscanf(argv[i], "t=%12s", type_s) == 1) {
			params->type = waveform_index(type_s);
			if (params->type < 0) {
				fprintf(stderr, "Error: Invalid waveform type: \"%s\"\n", type_s);
				return 1;
			}
		} else if (sscanf(argv[i], "a=%lf", &params->amplitude) == 1) {
			/* */
			if (fabs((float) params->amplitude) > 1) {
				fprintf(stderr, "Warning: Distortion may result from high amplitude %f\n", params->amplitude);
			}
		} else {
			fprintf(stderr, "Error: Unknown parameter \"%s\"\n", argv[i]);
			return 1;
		}
	}
	if (params->freq > params->rate / 2) {
		fprintf(stderr, "Warning: Frequency is above Nyquist limit\n");
	}
	if (params->freq == 0) {
		fprintf(stderr, "Warning: Frequency is zero\n");
	}
	return 0;
}

int alsaPlay(unsigned int rate, int (*callback)(), void *data)
{
	int pipes[2], old_stdout, ret, status;
	pid_t pid;
	char rate_s[11];
	char *argv[] = { APLAY, "-r", rate_s, "-f", SAMPLE_FORMAT, "-N", 0 };
	snprintf(rate_s, 11, "%u", rate);
	if (pipe(pipes) == -1) {
		fprintf(stderr, "Error: Failed to create pipe\n");
		return 1;
	}
	pid = fork();
	if (pid == -1) {
		fprintf(stderr, "Error: Fork failed\n");
		return 1;
	} else if (pid == 0) {
		close(pipes[1]);
		/* Replace child stdin with pipe from parent */
		if (dup2(pipes[0], STDIN_FILENO) == -1) {
			close(pipes[0]);
			fprintf(stderr, "Error: Failed to redirect stdin\n");
			_exit(127);
		}
		close(pipes[0]);
		if (!freopen("/dev/null", "r", stderr)) {
			fprintf(stderr, "Warning: Failed to redirect stderr\n");
		}
		execv(argv[0], argv);
		fprintf(stderr, "Error: Exec failed\n");
		_exit(127);
	}
	close(pipes[0]);
	/* Replace parent stdout with pipe to child stdin */
	old_stdout = dup(STDOUT_FILENO);
	if (dup2(pipes[1], STDOUT_FILENO) == -1) {
		close(old_stdout);
		close(pipes[1]);
		fprintf(stderr, "Error: Failed to redirect stdout\n");
		return 1;
	}
	close(pipes[1]);
	/* Call callback */
	ret = callback(data);
	/* Restore stdout */
	if (dup2(old_stdout, STDOUT_FILENO) == -1) {
		close(old_stdout);
		fprintf(stderr, "Warning: Failed to restore stdout\n");
		return 1;
	}
	/* Kill child */
	kill(pid, SIGINT);
	if (ret != 0) {
		return ret;
	}
	/* Wait for child to terminate */
	if (waitpid(pid, &status, 0) == -1 || status == 127) {
		/* Wait failed or child failed */
		return 1;
	}
	return 0;
}

static volatile int stopping = 0;

void sigint_handler(int signo)
{
	if (signo != SIGINT) {
		return;
	}
	stopping = 1;
	if (write(STDERR_FILENO, "Stopping...\n", 12) != 12) {
		/* */
	}
}

int generator_factory(
	struct PARAMS *params,
	void **instance,
	struct GENERATOR_TYPE **type)
{
	switch (params->type) {
	case 0:
		*instance = sine_generator_init(params->freq);
		break;
	case 1:
		*instance = square_generator_init(params->freq);
		break;
	case 2:
		*instance = triangle_generator_init(params->freq);
		break;
	}
	if (!*instance) {
		fprintf(stderr, "Error: Failed to construct signal generator\n");
		return 1;
	}
	*type = *(struct GENERATOR_TYPE **) instance;
	return 0;
}

int generate_waveform(struct PARAMS *params)
{
	sighandler_t old_sigint;
	void *instance;
	struct GENERATOR_TYPE *generator;
	double amplitude;
	int ret = 0;
	SAMPLE buffer[BUFFER_LEN];
	/* Get generator */
	generator_factory(params, &instance, &generator);
	if (!instance) {
		fprintf(stderr, "Error: Failed to construct signal generator\n");
		generator->free(instance);
		return 1;
	}
	generator = *(struct GENERATOR_TYPE **) instance;
	/* Calculate amplitude */
	amplitude = params->amplitude * r_rms[params->type] / r_rms_max;
	/* Assign SIGINT */
	old_sigint = signal(SIGINT, sigint_handler);
	if (old_sigint == SIG_ERR) {
		fprintf(stderr, "Error: Failed to install SIGINT handler\n");
		generator->free(instance);
		return 1;
	}
	/* Generate until SIGINT */
	while (!stopping) {
		/* Populate buffer */
		for (int i = 0; i < BUFFER_LEN; i++) {
			double value = generator->advance(instance,
				1.0 / params->rate) * amplitude;
			buffer[i] = TO_SAMPLE(value);
		}
		/* Emit buffer */
		if (write(STDOUT_FILENO, buffer, BUFFER_SIZE) != BUFFER_SIZE) {
			fprintf(stderr, "Error: Write failed / incomplete\n");
			ret = 1;
			break;
		}
	}
	fprintf(stderr, "Stopped!\n");
	/* Free generator */
	generator->free(instance);
	/* Restore SIGINT */
	signal(SIGINT, old_sigint);
	return ret;
}

void show_help(char *argv0)
{
	char syntax[240];
	char *lines[] = {
		"Signal generator",
		"",
		"Mark K Cowan",
		"",
		"Syntax:",
		syntax,
		"",
		"Where:",
		"	\e[32;1mf\e[0m is signal frequency",
		"	\e[32;1ma\e[0m is signal amplitude",
		"	\e[32;1mr\e[0m is sample rate",
		"	\e[32;1mt\e[0m is signal type, as a string or a numerical index:",
		"		\e[33;1m0\e[0m - \e[36;1mSine\e[0m",
		"		\e[33;1m1\e[0m - \e[36;1mSquare\e[0m",
		"		\e[33;1m2\e[0m - \e[36;1mTriangle\e[0m",
		"",
		0
	};
	snprintf(syntax, 240, "\t%s \e[32;1mf\e[0m=\e[35m50\e[0m \e[32;1ma\e[0m=\e[35m0.3\e[0m \e[32;1mr\e[0m=\e[35m48000\e[0m \e[32;1mt\e[0m=\e[36msine\e[0m", argv0);
	for (char **line = lines; *line; line++) {
		if (*line[0] != '\t' && *line[0] != 0) {
			fprintf(stderr, "\e[1m%s\e[0m\n", *line);
		} else {
			fprintf(stderr, "%s\n", *line);
		}
	}
}
