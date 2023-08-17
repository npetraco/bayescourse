# Mean and median example
samp <- rlnorm(1000, mean = 0, sd=2)
hist(samp)
hist(samp, bre=270, xlim=c(0,12))
mean(samp)
median(samp)


# Quantile example
# First lets get some (fake) data:
samp <- rnorm(1000, mean = 1.52005, sd = 0.00001)
hist(samp, xlab="RI")

# 1% and 99% quantiles of the data
quantile(samp, probs = c(0.01, 0.99))
