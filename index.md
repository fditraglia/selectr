Ultra-High-Dimensional Bayesian Variable Selection
--------------------------------------------------
Principal Investigators: [Siddhartha Chib](http://apps.olin.wustl.edu/faculty/chib/), [Francis J. DiTraglia](http://www.ditraglia.com)

Variable selection, also known as feature selection, is an important problem that spans a wide range of disciplines including Economics, Machine Learning and Genomics.
Even in its simplest form, choosing regressors for a linear model, variable selection presents two serious challenges.
First, the problem is known to be computationally hard.
Searching over all subsets of 100 regressors, for example, requires fitting 1000 times as many models as there are atoms in the human body.
Second, variable selection is subject to the danger of overfitting.
The in-sample fit of a model is *necessarily* no worse than its out-of-sample fit
Particularly when searching over a large number of models, there is a substantial risk that we may end up choosing regressors that merely align with the idiosyncratic noise in our sample rather than representing a genuine effect.
This problem is particularly acute in fields such as Economics where validation datasets can be very hard to come by.

