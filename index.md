High-Dimensional Sparse Bayesian Variable Selection
---------------------------------------------------
**Principal Investigators**: [Siddhartha Chib](http://apps.olin.wustl.edu/faculty/chib/), [Francis J. DiTraglia](http://www.ditraglia.com)

Variable selection, also known as feature selection, is an important problem that spans a wide range of disciplines including Economics, Machine Learning and Genomics.
Even in its simplest form, choosing regressors for a linear model, variable selection presents two serious challenges.
First, the problem is known to be computationally hard.
Searching over all subsets of 100 regressors, for example, requires fitting 1000 times as many models as there are atoms in the human body.
Second, variable selection is subject to the danger of overfitting.
The in-sample fit of a model is *necessarily* no worse than its out-of-sample fit.
Particularly when searching over a large number of models, there is a substantial risk that we may end up choosing regressors that merely align with the idiosyncratic noise in our sample rather than representing a genuine effect.
This problem is particularly acute in fields such as Economics where validation datasets can be very hard to come by.

A wide range of proposals for addressing the problem of variable selection have appeared in the statistics, econometrics, and machine learning literatures.
Generalizations of the least absolute shrinkage and selection operator (LASSO) of Tibshirani (1996) have been particularly influential in recent years as they avoid explicitly searching over subsets of regressors, dramatically reducing the computational cost, and produce interpretable solutions in which only a few regressors have nonzero coefficients.
The LASSO and related procedures rely on two key ingredients.
First is the assumption of sparsity.
Although we have many candidate regressors, we assume that only a very small number of them are truly relevant: the rest have coefficients that are exactly equal to zero.
Second is regularization.
To reduce the risk of overfitting, LASSO and it generalizations add a penalty to the usual least-squares criterion function.
Under appropriate conditions, sparsity combined with an appropriate choice of the LASSO penalty lead to model selection consistency: in the limit as we obtain more and more data, the probability that we select the "true" model approaches one.

Nevertheless, LASSO-type approaches suffer from several shortcomings.
First, the penalty term generally involves one or more tuning parameters constant terms which must be selected by the user.
Theory can't tell us which to use. Model selection consistency tells us the rate at which


combined with regularization this yields model selection consistency
Bayesian approach also gives natural framework for inference post-selection

