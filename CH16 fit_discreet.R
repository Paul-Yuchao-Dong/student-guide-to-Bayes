library(rstan)
library(tidybayes)

x <- c(4,18,6,4,5,6,4,6,16,7)

dat <- list(x = x, n = 10)

discreet <- stan_model("discreet.stan")

fit <- sampling(discreet, data = dat)

print(fit)

discreet2 <- stan_model("discreet2.stan")

fit2 <- sampling(discreet2, data = dat)

print(fit2)
