set.seed(2131)
popSize <- 1e4
cbar <- 1
kap <- 1

c <- rgamma(popSize, shape=1/kap, scale=cbar*kap)
surv <- rexp(popSize, rate=c)
cuts <- quantile(surv, probs=c(0.05, 0.2, 0.5))
mix <- "Effective mixing rate"

popHist <- function(c, title, breaks=NULL, counts=NULL){
	if (!is.null(counts)) counts <- c(0, max(counts))
	if (is.null(breaks)) breaks <- "Sturges"
	h <- hist(c,
		, main=title
		, xlab=mix
		, breaks = breaks
		, ylim = counts
	)
	abline(v=mean(c), col="red", lwd=2)
	return(h)
}

dev.off(); pdf(pdfname, height=6, width=7)

par(mfrow=c(1, 2))

h0 <- popHist(c, "Population")
popHist(c, "Population")

for (q in cuts){
	popHist(c[surv>q], "Susceptible", h0$breaks, h0$counts)
	popHist(c[surv<=q], "Infectious", h0$breaks, h0$counts)
}
