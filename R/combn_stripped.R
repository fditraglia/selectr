mycombn <- function (n, k){
  out <- matrix(NA_integer_, nrow = k, ncol = choose(n,k))
  
  # first subset is {1, 2, ..., k}
  a <- seq_len(k) 
  out[, 1] <- a
  m <- 0
  h <- k 

  # alternatively, could use a for loop but for large n
  # this would use a lot of memory in R
    i <- 2L
    a1_final <- n - k + 1L
    while(a[1] != a1_final){
    # case I: only need to change one element
    if (m < n - h) {
      h <- 1L
      m <- a[k] 
      j <- 1L
    # case II: need to change several elements
    } else {
      m <- a[k - h] 
      h <- h + 1L
      j <- 1L:h
    }
    # update a
    a[k - h + j] <- m + j
    out[, i] <- a
    i <- i + 1
  }
  return(out)
}

