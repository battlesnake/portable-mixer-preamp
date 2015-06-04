default: input-coupling.pdf

input-coupling.pdf: input-coupling.r
	Rscript $< $@
