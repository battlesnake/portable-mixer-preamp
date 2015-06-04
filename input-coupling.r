args <- commandArgs(trailingOnly = TRUE)
target <- args[1];

# Electronics functions
z <- function(f) 1/(2*pi*f*C);
v <- function(f) R / (R + z(f));
db <- function(f) 10 * log(v(f));

# Trial resistors and capacitors
R_trial <- c(47, 470, 4.7e3, 47e3);
C_trial <- c(47e-9, 1e-6);

# Axis limits
xlim <- c(20, 20000);
ylim <- c(-20, 0);

# Series label x-position
x_label <- 250;

# Point generators
x <- seq(xlim[1], xlim[2], 10);
y <- db;

# Index of x-position for series labels
i_label <- c(which(x >= x_label), 0)[1];

require(sitools);

colors <- rainbow(length(R_trial) * length(C_trial));
series <- c();
styles <- c();
widths <- c();
labelx <- c();
labely <- c();
labelt <- c();
i <- 1;

cairo_pdf(target, width=11, height=7);
plot(1, 1, log="x", type="l", xlim=xlim, ylim=ylim, xaxs="i", yaxs="i", xlab="Frequency (Hz)", ylab="Attenuation (dbV)", main="Frequency response of different R/C combinations for input coupling");

# Our flatness criterion
abline(h=-10, lty="dotted");
# Low-E on bass guitar
abline(v=41.2, lty="dotted");
# Low-E on normal guitar
abline(v=82.4, lty="dotted");
# Low end of human vocal range
abline(v=300, lty="dotted");

# Draw series
for (C in C_trial) {
	for (R in R_trial) {
		label <- paste0("R=", f2si(R, "Ω"), "  C=", f2si(C, "F"));
		width <- which(R_trial == R);
		style <- (which(C_trial == C) - 1) %% 3 + 1;
		# Series
		lines(x, y(x), col=colors[i], lty=style, lwd=width);
		# Series label
		labelx <- c(labelx, x[i_label]);
		labely <- c(labely, y(x[i_label]));
		labelt <- c(labelt, label);
		# Store visual info for legend
		series <- c(series, label);
		styles <- c(styles, style);
		widths <- c(widths, width);
		i <- i + 1;
	}
}

# Labels
text(x=labelx, y=labely, labels=labelt, pos=1);

# Legend
legend("bottomright", legend=series, col=colors, lty=styles, lwd=widths, pch=1);

