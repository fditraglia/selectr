#Compare performance of combn, mycombn, a byte-code
# compiled verion of mycombn and an Rcpp version 
library(microbenchmark)
library(compiler)
setwd("~/selectr/R")
source("combn_stripped.R")

# create byte-code compiled version of mycombn
mycombnc <- cmpfun(mycombn)
n <- 50 
k <- 3
system.time(foo <- combn(n, k))
system.time(bar <- mycombn(n, k))
system.time(baz <- mycombnc(n, k))
all.equal(foo, bar)
all.equal(foo, baz)

microbenchmark(combn(n, k), mycombn(n, k), mycombnc(n, k))
