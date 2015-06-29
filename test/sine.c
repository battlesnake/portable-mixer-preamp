#include <malloc.h>
#include <math.h>
#include "sine.h"
#include "const.h"

static struct GENERATOR_TYPE sine_generator_type = {
	.free = (generator_free) sine_generator_free,
	.advance = (generator_advance) sine_generator_advance
};

struct SINE_GENERATOR_STATE *sine_generator_init(
	double frequency)
{
	struct SINE_GENERATOR_STATE *state;
	state = (struct SINE_GENERATOR_STATE *)
		malloc(sizeof(struct SINE_GENERATOR_STATE));
	if (!state) {
		return 0;
	}
	state->type = &sine_generator_type;
	state->omega = PI2 * frequency;
	state->theta = 0;
	return state;
}

void sine_generator_free(
	struct SINE_GENERATOR_STATE *state)
{
	free(state);
}

double sine_generator_advance(
	struct SINE_GENERATOR_STATE *state,
	double dt)
{
	state->theta += state->omega * dt;
	if (state->theta >= PI2) {
		state->theta = fmod(state->theta, PI2);
	}
	return sin(state->theta);
}
