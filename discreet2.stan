
data {
  int<lower=0> n;
  int x[n];
}

parameters {
  ordered[2] alpha;

  // real<lower=0, upper=1> s[n];
}

transformed parameters{
  real<lower=0, upper=1> theta[2];
  matrix[2, n] lp;
  for (i in 1:2)
    theta[i] = inv_logit(alpha[i]);
  
  for (i in 1:2){
    for (j in 1:n){
      lp[i,j] = binomial_logit_lpmf(x[j] | 20, alpha[i]);
    }
  }
}

model {
  for (i in 1:n)
    target += log_sum_exp(lp[,i]);
}

generated quantities{
  real s[n];
  for (i in 1:n){
    s[i] = exp(lp[1,i]) / (exp(lp[1,i])+exp(lp[2,i]));
  }
}

