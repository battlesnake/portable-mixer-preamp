#pragma once
#include "generator.h"

struct SINE_GENERATOR_STATE {
	struct GENERATOR_TYPE *type;
	double omega;
	double theta;
};

struct SINE_GENERATOR_STATE *sine_generator_init(
	double frequency);

void sine_generator_free(
	struct SINE_GENERATOR_STATE *state);

double sine_generator_advance(
	struct SINE_GENERATOR_STATE *state,
	double dt);

static struct GENERATOR_TYPE sine_generator_type;
