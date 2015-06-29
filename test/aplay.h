#pragma once

#define APLAY "/usr/bin/aplay"

#define SAMPLE float
#define TO_SAMPLE(x) ((SAMPLE) (x))
#define SAMPLE_FORMAT "FLOAT_LE"

#define BUFFER_LEN 1024
#define BUFFER_SIZE (BUFFER_LEN * sizeof(SAMPLE))

int alsaPlay(unsigned int rate, int (*callback)(), void *data);

