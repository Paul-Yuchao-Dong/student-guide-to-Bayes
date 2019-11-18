library(rstan)
options(mc.cores = parallel::detectCores())

rstan_options(auto_write = TRUE)

fit_negbin <- stan("discoveries_negbin.stan", data = dat, chains = 4, iter = 1000, warmup = 500, seed = 1)
print(fit_negbin)