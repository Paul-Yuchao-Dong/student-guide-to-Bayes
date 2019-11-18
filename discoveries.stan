data {
  int<lower = 0> N;
  int Y[N];
}

parameters {
  real lambda;
}

model {
  Y ~ poisson(lambda);
  lambda ~ lognormal(2, 1);
}

generated quantities{
  int Y_hat[N];
  for (i in 1:N){
    Y_hat[i] = poisson_rng(lambda);
  }
}
