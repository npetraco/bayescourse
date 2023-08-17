library(bayesutils)

# Extra options to set for Stan:
options(mc.cores = 1)
rstan_options(auto_write = TRUE)

# Load a Stan model:
stan.code <- read_model_file("norm-T_uniform.stan") # Getting lots of divergences......
#open_mf("norm-T_uniform.stan") # To view the actual Stan file stored in bayesutils if you'd like

# Translate Stan code into C++
model.c <- stanc(model_code = stan.code)

# Compile the Stan C++ model:
sm <- stan_model(stanc_ret = model.c, verbose = T)


# Data:
x <- c(63.7697, 38.8534, 50.6481, 76.8564, 47.5911, 60.6131, 41.1518, 41.7563, 65.3300, 72.0342)
##data set up for uniform prior
dat <- list(
  # The data:
  x         = x,
  n         = length(x),
  # Prior hyper-parameters:
  nu_hyp    = 3,
  mu_hyp    = 50,
  sigma_hyp = 20,
  #
  a_hyp     = 1,
  b_hyp     = 50
)

#Run the model:
fit <- sampling(sm, data = dat, iter=5000, thin = 1, chains = 4,
                control = list(adapt_delta = 0.999))
fit
#
#pairs(fit)

# Check chains:
#params.chains <- extract.params(fit, by.chainQ = T)
#mcmc_trace(params.chains, pars = c("mu", "sigma"))
#plot(fit)

# Posteriors:
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

