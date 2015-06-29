#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <math.h>
#include "aplay.h"

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
