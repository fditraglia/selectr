# This is a very simple script to see how
# multicore scales on a very small problem
# in which the loads are perfectly balanced
# and there shouldn't be any memory issues

require(Rcpp)
require(RcppArmadillo)
require(parallel)
max.cores <- detectCores()

sourceCpp("reg_MSE.cpp")

reg_slope <- function(b){
  n <- 1000
  x <- rnorm(n)
  y <- b * x + rnorm(n)
  return(cov(x, y) / var(x))
}

reg_MSE <- function(b){
  reps <- 10000
  sims <- replicate(reps, reg_slope(b))
  return(mean((sims - b)^2))
}

simR <- function(cores, tasks){
  b_seq <- seq(0.9, 1.1, length.out = tasks)  
  return(mclapply(b_seq, reg_MSE, mc.cores = cores))
}

simCpp <- function(cores, tasks){
  b_seq <- seq(0.9, 1.1, length.out = tasks)  
  return(mclapply(b_seq, reg_MSE_cpp, mc.cores = cores))
}
