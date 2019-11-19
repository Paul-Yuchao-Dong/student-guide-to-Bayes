data {
  int<lower=0> n;
  vector[n] volume;
  vector[n] holiday;
}

parameters {
  real beta;
  real beta_holiday;
  real<lower=0> sigma;
}

model {
  volume ~ normal(beta + beta_holiday * holiday, sigma);
  beta ~ normal(0, 50);
  beta_holiday ~ normal(0, 50);
  sigma ~ normal(0,10);
}

generated quantities{
  real increase;
  increase = 1 + beta_holiday / beta;
}
