# Requires
require(sitools);

# Fonts
require(Rcurl);
require(jsonlite);
require(showtext);
font.add.google("Open Sans", "opensans");

f_res = 100;

# Stringify SI values 
label <- function(value, unit = "") f2si(signif(value, 2), unit);

# Parameters
args <- commandArgs(trailingOnly = TRUE);
target <- args[1];

# Time constants to chart
values.r <- 47 * (10 ^ (0:3));
values.c <- sort(c(47, 100) %o% (10 ^ (-9:-8)));
values.rc <- apply(values.c %o% values.r, c(1, 2), function (v) as.double(signif(v, 4)));
τ <- unique(sort(values.rc));

# Axis limits
xlim <- c(20, 20000);
ylim <- c(-16, 0);

# Series labels position
xlabel <- 30;

# Data series
f <- 10 ^ seq(from=log10(xlim[1]), to=log10(xlim[2]), length.out=f_res);
ω <- 2 * pi * f;
a <- 1 / (1 / (ω %o% τ) + 1);
db <- 10 * log10(a);

# Label data-point index
ilabel <- which(f >= xlabel)[1];

# Colour
colours <- rainbow(length(τ));

# Graphics
cairo <- pdf(target, width=297/25.4, height=210/25.4);
showtext.begin();
par(family="Open Sans");
layout(matrix(c(1,2,1,3), 2, 2, byrow=TRUE), c(2, 1), c(1, 1));

# Create plot
plot.freq <- matplot(x=f, y=db, log="x", type="l", lty=1,
	xlim=xlim, ylim=ylim,
	xaxs="i", yaxs="i",
	xaxt="n", yaxt="n",
	col=colours,
	xlab="Frequency (Hz)", ylab="Attenuation (dBV)",
	main="Frequency response for different τ-values");

# Axis labels and ticks
ylabels <- seq(0, ylim[1], -5);
xlabels <- c(20,50,100,200,500,1000,2000,5000,10000,20000);
axis(2, at=ylabels, labels=label(ylabels, "dBV"));
axis(1, at=xlabels, labels=label(xlabels, "Hz"));

# Our flatness criterion
abline(h=-10, lty="dotted");
# Low-E on bass guitar
abline(v=41.2, lty="dotted");
# Low-E on normal guitar
abline(v=82.4, lty="dotted");
# Low end of human vocal range
abline(v=300, lty="dotted");

# Series labels
text(x=f[ilabel], y=db[ilabel,],
	labels=paste("τ", "=", label(τ, "s")),
	pos=1, cex=0.7, srt=30);

# τ plot
grid <- matrix();
grid$x <- values.r;
grid$y <- values.c;
grid$z <- values.rc;

colnames(grid$z) <- label(values.r, "Ω");
rownames(grid$z) <- label(values.c, "F")

grid$c <- apply(grid$z, c(1, 2), function (v) which(τ==v)[1]);
colnames(grid$c) <- colnames(grid$z);
rownames(grid$c) <- rownames(grid$z);

print(grid$c);

image(x=1:length(grid$x), y=1:length(grid$y), z=grid$c, col=colours,
	axes=FALSE,
	main="τ-value map",
	xlab="Capacitor (F)", ylab="Resistor (Ω)",
	xaxs="i", yaxs="i"
);

axis(1, at=1:length(grid$y), labels=rownames(grid$z));
axis(2, at=1:length(grid$x), labels=colnames(grid$z));

text(row(grid$z), col(grid$z),
	labels=label(grid$z, "s"));

image(x=1:length(grid$x), y=1:length(grid$y), z=grid$c, col=colours,
	axes=FALSE,
	main="Corner-frequency map",
	xlab="Capacitor (F)", ylab="Resistor (Ω)",
	xaxs="i", yaxs="i"
);

axis(1, at=1:length(grid$y), labels=rownames(grid$z));
axis(2, at=1:length(grid$x), labels=colnames(grid$z));

text(row(grid$z), col(grid$z),
	labels=label(1 / (2 * pi * grid$z), "Hz"));
