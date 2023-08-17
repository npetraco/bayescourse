library(LaplacesDemon) # can use dst in this to plot non-central T more easily than with just straight up R code

#-------------------------------
# Reasonable priors on the mean
#-------------------------------
# Non-centered student-T using LaplacesDemon
x <- seq(from=0,to=150,length.out=1000)
y <- dst(x, nu=3, mu=50, sigma=20)
plot(x,y, xlab="mu", main="student-T")

# Non-centered student-T using just R
# tmu  <- 50
# tsig <- 20
# xmin <- 0
# xmax <- 150
# txmin <- (xmin - tmu)/tsig
# txmax <- (xmax - tmu)/tsig
# 
# tax  <- seq(from=txmin, to=txmax, length.out=1000)
# yax  <- dt(tax, df = 3)/tsig
# xax  <- tmu + tsig*tax
# plot(xax, yax)

# Uniform distribution
y2 <- dunif(x, min = 0, max = 150)
plot(x,y2, xlab="mu", main="uniform")


#---------------------------------------
# Reasonable priors on the standard dev
#---------------------------------------
x <- seq(from=0,to=50,length.out=1000)

# Student-T (uses LaplacesDemon)
y <- dst(x, nu=3, mu=10, sigma=10)
plot(x,y, xlab="sigma", main="student-T")

# Cauchy
y2 <- dcauchy(x, location = 0, 15)
plot(x,y2, xlab="sigma", main="cauchy")

# Uniform
y3 <- dunif(x, min = 0, max = 50)
plot(x,y3, xlab="sigma", main="uniform")

# Gamma
y4 <- dgamma(x, shape = 1, rate = 1/10)
plot(x,y4, xlab="sigma", main="gamma")
