data {
  int<lower=0> n;
  int rt[n];
  int nt[n];
  int rc[n];
  int nc[n];
}

parameters {
  vector[n] mu;
  real d;
  real<lower = 0> sigma;
  vector[n] eta;

}

transformed parameters{
  vector[n] pt;
  vector[n] pc;

  for (i in 1:n){
    pt[i] = inv_logit(mu[i] + eta[i]);
    pc[i] = inv_logit(mu[i]);
  }
}

model {
  
  for (i in 1:n){
    rc[i] ~ binomial(nc[i], pc[i]);
    rt[i] ~ binomial(nt[i], pt[i]);
  }
  
  mu ~ normal(0, 10);
  eta ~ normal(d, sigma);
  d ~ normal(0, 10);
  sigma ~ cauchy(0, 2.5);
}

generated quantities{
  real eta_rep;
  eta_rep = normal_rng(d, sigma);
}
