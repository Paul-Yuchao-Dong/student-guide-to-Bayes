
data {
  int<lower=0> n;
  int x[n];
}

parameters {
  ordered[2] alpha;

  real<lower=0, upper=1> s[n];
}

transformed parameters{
  real<lower=0, upper=1> theta[2];
  for (i in 1:2)
    theta[i] = inv_logit(alpha[i]);
}

model {
  for (i in 1:n)
    target += log(s[i]*exp(binomial_lpmf(x[i] | 20, theta[1]) + 
                (1-s[i])*exp(binomial_lpmf(x[i] | 20, theta[2]));
  for (i in 1:n)
    s[i] ~ uniform(0,1);
}

