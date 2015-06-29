#pragma once
#include "generator.h"

struct SQUARE_GENERATOR_STATE {
	struct GENERATOR_TYPE *type;
	double frequency;
	double phase;
};

struct SQUARE_GENERATOR_STATE *square_generator_init(
	double frequency);

void square_generator_free(
	struct SQUARE_GENERATOR_STATE *state);

double square_generator_advance(
	struct SQUARE_GENERATOR_STATE *state,
	double dt);

static struct GENERATOR_TYPE square_generator_type;
