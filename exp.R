par(cex=2, las=1)
curve(exp(-x/3), from=0, to=10,
	xlab = "Days since infection",
	ylab = "Proportion still infected",
)

curve(exp(-x/3), from=0, to=10,
	xlab = "Days since infection",
	ylab = "Proportion still infected",
	log="y"
)
