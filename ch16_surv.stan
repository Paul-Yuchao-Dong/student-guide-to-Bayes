functions{
  real surv_lpdf(real Y, real b){
    return(1./3.*log(b)-b*(Y^3));
  }
}

data {
  int<lower=0> n;
  real y[n];
}

parameters {
  real b;
}

model {
  for (i in 1:n)
    y[i] ~ surv(b);
}

