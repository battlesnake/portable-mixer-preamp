#include <malloc.h>
#include "square.h"

static struct GENERATOR_TYPE square_generator_type = {
	.free = (generator_free) square_generator_free,
	.advance = (generator_advance) square_generator_advance
};

struct SQUARE_GENERATOR_STATE *square_generator_init(
	double frequency)
{
	struct SQUARE_GENERATOR_STATE *state;
	state = (struct SQUARE_GENERATOR_STATE *)
		malloc(sizeof(struct SQUARE_GENERATOR_STATE));
	if (!state) {
		return 0;
	}
	state->type = &square_generator_type;
	state->frequency = frequency;
	state->phase = 0;
	return state;
}

void square_generator_free(
	struct SQUARE_GENERATOR_STATE *state)
{
	free(state);
}

double square_generator_advance(
	struct SQUARE_GENERATOR_STATE *state,
	double dt)
{
	char k;
	state->phase += dt * state->frequency;
	state->phase -= (long long) state->phase;
	k = (long long) (state->phase * 2.0) & 1;
	return k ? -1 : +1;
}
