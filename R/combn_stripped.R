mycombn <- function (n, k){
  m <- 0
  h <- k
  a <- seq_len(k)
  out <- matrix(a, k, ncol = choose(n, k))
  i <- 2L
  a1_final <- n - k + 1L
  while (a[1L] != a1_final) {
    if (m < n - h) {
      h <- 1L
      m <- a[k]
      j <- 1L
    } else {
      m <- a[k - h]
      h <- h + 1L
      j <- 1L:h
    }
    a[k - h + j] <- m + j
    out[, i] <- a
    i <- i + 1L
  }
  return(out)
}

