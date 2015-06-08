out:=out

r:=$(wildcard *.r)

targets:=$(patsubst %, $(out)/%, $(r:%=%.pdf))

.PHONY: default clean

default: $(targets)

clean:
	rm -rf -- $(targets)

$(out):
	mkdir -p -- $@

$(out)/%.r.pdf: %.r | $(out)
	Rscript $< $@ || rm -f -- $@
