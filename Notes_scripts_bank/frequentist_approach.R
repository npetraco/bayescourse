## Simulate some data:
# mu <- 50
# s  <- 10.341
# samp <-rnorm(1000, mean = mu, sd = s)
# hist(samp)
# dnorm(0, mean = mu, sd = s)
# round(rnorm(10, mean = mu, sd = s), 4)

x <- c(63.7697, 38.8534, 50.6481, 76.8564, 47.5911, 60.6131, 41.1518, 41.7563, 65.3300, 72.0342)

# Frequentist approach: point and interval estimatimation
mean(x)
sd(x)

# CI for the mean will come out in the output:
t.test(x, mu = 50, alternative = "two.sided", conf.level = 0.95)

# CI for standard dev
n <- length(x)
conf <- 0.95
alp <- 1 - conf
# Lower tail
s.lo <- sqrt(((n-1)*var(x))/(qchisq(p = alp/2, df = n-1, lower.tail = F)))
# Upper tail
s.hi <- sqrt(((n-1)*var(x))/(qchisq(p = 1-alp/2, df = n-1, lower.tail = F)))
c(s.lo, s.hi)
