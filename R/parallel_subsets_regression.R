require(parallel)
max.cores <- detectCores()

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

do_all_subsets <- function(X, y, k_max, ncores,
                           get_criterion){
  X <- cbind(rep(1, nrow(X)), X) # add constant
  XX <- crossprod(X)
  Xy <- crossprod(X, y)
  all_subsets <- get_subsets(ncol(X) - 1, k_max)
  f <- function(sub){
    do_1subset(sub, get_criterion, XX, Xy, X, y)
  }
  if(ncores == 1){
    return(lapply(all_subsets, f))
  }else{
    return(mclapply(all_subsets, f, mc.cores = ncores))
  }
}

sim_data <- function(n, p, k){
  b0 <- 0.5
  b <- c(rep(1, k), rep(0, p - k))
  X <- matrix(rnorm(n * p), n, p)
  y <- b0 + X %*% b + rnorm(n)
  return(list(X = X, y = y))
}

testBIC <- function(ncores, n = 100, p = 100, k = 3){
  data <- sim_data(n, p, k)
  X <- data$X
  y <- data$y
  return(do_all_subsets(X, y, k, ncores, get_BIC))
}

#criterion_values <- sapply(test_results, function(x) x$criterion)
#top10 <- order(criterion_values)[1:10]
#lapply(test_results[top10], function(x) x$subset)
