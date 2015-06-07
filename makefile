out:=out

r:=$(wildcard *.r)

targets:=$(r:%=%.pdf)

.PHONY: default clean

default: $(targets:%=$(out)/%)

clean:
	rm -rf -- $(out)

$(out):
	mkdir -p -- $@

$(out)/%.r.pdf: %.r | $(out)
	Rscript $< $@ || rm -f -- $@
