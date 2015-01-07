// [[Rcpp::depends(RcppArmadillo)]]
#include <RcppArmadillo.h>
using namespace arma;

//[[Rcpp::export]]

double reg_MSE_cpp(double b){
  int n = 1000;
  int reps = 10000;
  colvec b_hat(reps); 
  colvec x(n);
  colvec error(n);
  colvec y(n);
  for(int i = 0; i < reps; i++){
    x = randn<vec>(n);
    error = randn<vec>(n);
    y = b * x + error;
    b_hat(i) = as_scalar(cov(x, y) / var(x));
  }
  colvec devs = b_hat - b * ones<vec>(reps);
  return(dot(devs, devs) / reps);
}
