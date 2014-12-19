require(parallel)
ncores <- detectCores()

# convert matrix into list of vectors by column
col_list <- function(M){
  lapply(seq_len(ncol(M)), function(i) M[,i])
}

get_subsets <- function(p, k_max){
  out <- lapply(seq_len(k_max), function(k) combn(1:p, k))  
  out <- lapply(out, col_list)
  return(unlist(out, recursive = FALSE))
}

get_BIC <- function(XX, Xy, X, y){
  b <- solve(XX, Xy)
  n <- length(y)
  k <- ncol(X)
  s_squared <- crossprod(y - X %*% b) / n 
  return(log(s_squared) + k * log(n) / n)
}

do_1subset <- function(this_subset, get_criterion, XX, Xy, X, y){
  sub <- c(1, this_subset + 1) # account for constant 
  XXsub <-  XX[sub, sub]
  Xysub <- Xy[sub]
  Xsub <- X[, sub]   
  criterion <- get_criterion(XXsub, Xysub, Xsub, y)
  return(list(subset = this_subset, criterion = criterion))
}

run_serial <- function(X, y, k_max){
  X <- cbind(rep(1, nrow(X)), X) # add constant
  XX <- crossprod(X)
  Xy <- crossprod(X, y)
  all_subsets <- get_subsets(ncol(X) - 1, k_max)
  out <- lapply(all_subsets, function(sub) 
                do_1subset(sub, get_BIC, XX, Xy, X, y)) 
  return(out)
}

run_parallel <- function(X, y, k_max){
  X <- cbind(rep(1, nrow(X)), X) # add constant
  XX <- crossprod(X)
  Xy <- crossprod(X, y)
  all_subsets <- get_subsets(ncol(X) - 1, k_max)  
  out <- mclapply(all_subsets, function(sub) 
                  do_1subset(sub, get_BIC, XX, Xy, X, y),
                  mc.cores = ncores) 
  return(out)
}

# getting essentially no speedup unless the task is large then parallel is about twice as fast
# try to improve this with clever chunking? 
# cut down on function calls?
# Rcpp?

test_data <- function(){
  n <- 150 
  p <- 150
  b0 <- 0.5
  b <- c(rep(1, 3), rep(0, p - 3))
  X <- matrix(rnorm(n * p), n, p)
  y <- b0 + X %*% b + rnorm(n)
  return(list(X = X, y = y))
}

test_serial <- function(){
  data <- test_data()
  X <- data$X
  y <- data$y
  return(run_serial(X, y, 3))
}

test_parallel <- function(){
  data <- test_data()
  X <- data$X
  y <- data$y
  return(run_parallel(X, y, 3))
}
  

#criterion_values <- sapply(test_results, function(x) x$criterion)
#top10 <- order(criterion_values)[1:10]
#lapply(test_results[top10], function(x) x$subset)
