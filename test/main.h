#pragma once
#include "generator.h"
#include "aplay.h"

struct PARAMS {
	unsigned int rate;
	unsigned int freq;
	unsigned char type;
	double amplitude;
};

static int n_waveforms;

static char *waveforms[];

int waveform_index(char *name);

int main(int argc, char **argv);

void show_help(char *);

int get_params(int argc, char **argv, struct PARAMS *params);

int generator_factory(
	struct PARAMS *params,
	void **instance,
	struct GENERATOR_TYPE **type);

int generate_waveform(struct PARAMS *params);

typedef void (*sighandler_t)(int);

void sigint_handler(int dummy);
