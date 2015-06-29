#pragma once

typedef void (*generator_free)(void *);
typedef double (*generator_advance)(void *, double);

struct GENERATOR_TYPE {
	generator_free free;
	generator_advance advance;
};
