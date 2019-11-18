library(rstan)
set.seed(1)
fit <- stan("discoveries.stan", data = dat, chains = 4, iter = 1000, warmup = 500, seed = 1)
print(fit)
