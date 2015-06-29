#include <malloc.h>
#include "triangle.h"

static struct GENERATOR_TYPE triangle_generator_type = {
	.free = (generator_free) triangle_generator_free,
	.advance = (generator_advance) triangle_generator_advance
};

struct TRIANGLE_GENERATOR_STATE *triangle_generator_init(
	double frequency)
{
	struct TRIANGLE_GENERATOR_STATE *state;
	state = (struct TRIANGLE_GENERATOR_STATE *)
		malloc(sizeof(struct TRIANGLE_GENERATOR_STATE));
	if (!state) {
		return 0;
	}
	state->type = &triangle_generator_type;
	state->frequency = frequency;
	state->phase = 0;
	return state;
}

void triangle_generator_free(
	struct TRIANGLE_GENERATOR_STATE *state)
{
	free(state);
}

double triangle_generator_advance(
	struct TRIANGLE_GENERATOR_STATE *state,
	double dt)
{
	char k, f;
	state->phase += dt * state->frequency;
	state->phase -= (long long) state->phase;
	k = (long long) (state->phase * 2.0);
	f = (state->phase * 2.0) - k;
	if (k == 0) {
		return f * 2 - 1;
	} else {
		return 1 - f * 2;
	}
}
