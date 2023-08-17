library(bayesutils)
library(mlbench)

# Histogram examples

data(Glass)
RI <- Glass[,1]
hist(RI, ylab = "counts")

# Bin counts:
bin.vec <- cut(RI, hist(RI, plot=F)$breaks)
table(bin.vec)


theta <- rweibull(n = 1000, shape = 2, scale = 30)
hist(theta)
hist(theta, probability = T)
table(cut(theta, hist(theta, plot=F)$breaks))/1000


# Box-and-whiskers example
boxplot(RI)
boxplot(RI, horizontal = T, xlab="RI")
boxplot(RI, horizontal = T, range = 0)


