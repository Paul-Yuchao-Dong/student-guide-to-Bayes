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

