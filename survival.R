par(cex=1.6)
time = seq(0, 20, by=0.2)
mu <- 10
cars <- 4

expSurv <- pexp(time, rate=1/mu, lower.tail=FALSE)
gamSurv <- pgamma(time, rate=cars/mu, shape=cars, lower.tail=FALSE)

plot(time, expSurv
	, type="l"
	, xlab = "Time (years)"
	, ylab = "Proportion Surviving"
	, ylim = c(0, 1)
)

plot(time, expSurv
	, type="l"
	, xlab = "Time (years)"
	, ylab = "Proportion Surviving"
	, ylim = c(0, 1)
)
lines(time, gamSurv)
