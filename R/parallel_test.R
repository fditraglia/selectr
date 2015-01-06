# This is a very simple script to see how
# multicore scales on a very small problem
# in which the loads are perfectly balanced
# and there shouldn't be any memory issues

require(parallel)
max.cores <- detectCores()


reps <- 1000
n <- 1000
x <- rnorm(n)

reg_slope <- function(b){
  x <- rnorm(n)
  y <- b * x + rnorm(n)
  return(cov(x, y) / var(x))
}

reg_MSE <- function(b){
  sims <- replicate(reps, reg_slope(b))
  return(mean((sims - b)^2))
}

run_sim <- function(cores, tasks){
  b_seq <- seq(0.9, 1.1, length.out = tasks)  
  return(mclapply(b_seq, reg_MSE, mc.cores = cores))
}

