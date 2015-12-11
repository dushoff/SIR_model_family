par(cex=2, las=1)

beta0 <- 0.5
beta1 <- 0.1
beta11 <- 0.4
betaMax <- 1
xlab <- "Population density"
ylab <- "Contacts/day"
ylim <- c(0, 1.5)

curve(beta0 + 0*x, from=0, to=10,
	xlab=xlab, ylab=ylab, ylim=ylim,
	main = "Standard incidence"
)

curve(beta1*x, from=0, to=10,
	xlab=xlab, ylab=ylab, ylim=ylim,
	main = "Mass action"
)

curve(beta0+beta1*x, from=0, to=10,
	xlab=xlab, ylab=ylab, ylim=ylim,
	main = "Linear"
)

curve((beta0+beta11*x)/(1+(beta0+beta11*x/betaMax)), from=0, to=10,
	xlab=xlab, ylab=ylab, ylim=ylim,
	main = "General"
)

