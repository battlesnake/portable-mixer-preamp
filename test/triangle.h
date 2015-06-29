#pragma once
#include "generator.h"

struct TRIANGLE_GENERATOR_STATE {
	struct GENERATOR_TYPE *type;
	double frequency;
	double phase;
};

struct TRIANGLE_GENERATOR_STATE *triangle_generator_init(
	double frequency);

void triangle_generator_free(
	struct TRIANGLE_GENERATOR_STATE *state);

double triangle_generator_advance(
	struct TRIANGLE_GENERATOR_STATE *state,
	double dt);

static struct GENERATOR_TYPE triangle_generator_type;
