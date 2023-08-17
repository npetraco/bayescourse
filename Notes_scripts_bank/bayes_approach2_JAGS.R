library(bayesutils)

# Data:
x <- c(63.7697, 38.8534, 50.6481, 76.8564, 47.5911, 60.6131, 41.1518, 41.7563, 65.3300, 72.0342)
dat <- list(
  # The data:
  x         = x,
  n         = length(x),
  # Prior hyper-parameters:
  mu_nu_hyp  = 3,
  mu_mu_hyp  = 50,
  mu_sig_hyp = 20,
  #
  sigma_nu_hyp  = 3,
  sigma_mu_hyp  = 10,
  sigma_sig_hyp = 10
)

# Initalization:
inits <- function (){
  list(mu=10*runif(1), sigma=10*runif(1)) # per examiner
}

fit <- jags(data=dat,
            inits=inits,
            parameters.to.save = c("mu", "sigma"),
            n.iter=20000, n.burnin = 500, n.thin = 10,
            n.chains=4,
            model.file = get.mfp("norm-T_T.bug")) # per examiner
fit

# Check chains:
#params.chains <- extract.params(fit, by.chainQ = T)
#mcmc_trace(params.chains, pars = c("mu", "sigma"))
#plot(fit)

params.mat <- extract.params(fit, as.matrixQ = T)
colnames(params.mat)
mcmc_areas(params.mat, pars = c("mu", "sigma"), prob = 0.95)

# Posterior means/medians:
mean(params.mat$mu)
median(params.mat$mu)
mean(params.mat$sigma)
median(params.mat$sigma)

# Posterior intervals:
parameter.intervals(params.mat$mu, plotQ = T, prob = 0.95, xlab="mu")
parameter.intervals(params.mat$sigma, plotQ = T, prob = 0.95, xlab="sigma")


