require(Rcpp)
require(RcppArmadillo)
require(parallel)

sourceCpp("reg_MSE.cpp")

cl <- makePSOCKcluster(4)
myfun <- function(i) { Sys.sleep(1); i }
parLapply(cl, 1:8, myfun)
stopCluster(cl)

# cl <- makeForkCluster(4)

