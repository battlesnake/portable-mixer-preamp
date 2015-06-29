.PHONY: default clean debug

default: ./test

./test: *.c
	gcc $^ -O2 -lm -o $@

clean:
	rm -f -- ./test
