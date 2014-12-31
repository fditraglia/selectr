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
While asymptotic theory allows us to determine the *rate* at which these tuning parameters must change as a function of sample size to obtain consistent model selection, it is silent on the question of the appropriate constant of proportionality.
In practice, however, different constants lead to very different models as the choice of tuning parameter determines the degree of regularization. 
Second, even assuming that the assumption of sparsity is justified, the LASSO and related approaches can become quite fragile when regressors are highly correlated, as is often the case in Economics.

In fact, nearly all of the proposals in the variable selection literature can be interpreted as Bayesian estimators under alternative priors.
LASSO, for example, is nothing more than a maximum a posteriori (MAP) Bayesian estimator under independent Laplace priors.
The choice of tuning parameter corresponds to a choice how how diffuse to make the prior, representing one's beliefs about the likely size of effects and the degree of sparsity.
Once the problem is viewed from a Bayesian perspective, however, 

Problems when there are highly correlated predictors.
Motivate Bayesian subsets with regularzation.
Conditional on the data, LASSO penalty amounts to choosing number of regressors with nonzero coeffs.
If we restrict best subsets to only look at models at most 5 when there are 100 regressors, we have just under 80 million models.
This is a lot, but it's within the ability of a desktop computer.
Give a rough estimate of how long this would take.
Embarassingly parallel, so farm it out to a cluster.
True the problem doesn't scale, but can be solved for problems of realistic size.
Question of which priors are best for this kind of thing.
Develop open-source software using R, C++ and StarCluster so that anyone can easily use our methods on their problem via AWS without specialist knowledge.

combined with regularization this yields model selection consistency
Bayesian approach also gives natural framework for inference post-selection
Bayesian best subsets use marginal likelihoods to find extend to which data support model
Regularization via a prior
Fast implementation via Gibbs sampling
Which priors are best for the sparse setting
Start with linear regression
