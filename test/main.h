#pragma once
#include "generator.h"

#define APLAY "/usr/bin/aplay"

struct PARAMS {
	unsigned int rate;
	unsigned int freq;
	unsigned char type;
	double amplitude;
};

static int n_waveforms;

static char *waveforms[];

int waveform_index(char *name);

#define SAMPLE float
#define TO_SAMPLE(x) ((SAMPLE) (x))
#define SAMPLE_FORMAT "FLOAT_LE"

#define BUFFER_LEN 1024
#define BUFFER_SIZE (BUFFER_LEN * sizeof(SAMPLE))

int main(int argc, char **argv);

void show_help(char *);

int get_params(int argc, char **argv, struct PARAMS *params);

int alsaPlay(unsigned int rate, int (*callback)(), void *data);

int generator_factory(
	struct PARAMS *params,
	void **instance,
	struct GENERATOR_TYPE **type);

int generate_waveform(struct PARAMS *params);

typedef void (*sighandler_t)(int);

void sigint_handler(int dummy);
