out:=out

r:=$(wildcard *.r)

targets:=$(patsubst %, $(out)/%, $(r:%=%.pdf))

.PHONY: default clean kicad-stuff

default: $(targets) kicad-stuff

kicad-stuff:
	@rm -f -- schematic/*.bak
	@if [ -e schematic/schematic.pdf ]; then \
		mv schematic/schematic.pdf out/; \
	else \
		echo "Do you need to re-render schematic.pdf in Kicad?"; \
	fi

clean:
	@rm -rf -- $(targets)

$(out):
	@mkdir -p -- $@

$(out)/%.r.pdf: %.r | $(out)
	@if ! Rscript $< $@; then \
		rm -f -- $@ \
		exit 1 \
	fi
