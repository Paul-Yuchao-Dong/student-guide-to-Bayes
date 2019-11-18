data {
  int<lower = 0> n;
  int<lower = 0> discoveries[n];
}

parameters {
  real<lower =0> mu;
  real<lower =0> phi;
}

model {
  discoveries ~ neg_binomial_2(mu, phi);
  mu ~ lognormal(2, 1);
  phi~ lognormal(2, 1);
}

generated quantities{
  int discoveries_hat[n];
  for (i in 1:n){
    discoveries_hat[i] = neg_binomial_2_rng(mu, phi);
  }
}
