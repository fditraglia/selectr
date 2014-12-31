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
First, the penalty term generally involves one or more tuning parameters which must be selected by the user.
While asymptotic theory allows us to determine the *rate* at which these tuning parameters must change as a function of sample size to obtain consistent model selection, it is silent on the question of the appropriate constant of proportionality.
In practice, however, different constants lead to very different models as the choice of tuning parameter determines the degree of regularization. 
Second, even assuming that the assumption of sparsity is justified, the LASSO and related approaches can become quite fragile when regressors are highly correlated, as is often the case in Economics.

In fact, nearly all of the proposals in the variable selection literature can be interpreted as Bayesian estimators under alternative priors.
LASSO, for example, is nothing more than a maximum a posteriori (MAP) Bayesian estimator with independent Laplace priors on the regression coefficients.
The choice of tuning parameter corresponds to a choice how how diffuse to make theses priors, representing one's beliefs about the likely size of effects and the degree of sparsity.
Once the problem is viewed from an explicitly Bayesian perspective, however, the natural object to use for model selection is not a sparsity-inducing prior on the regression coefficients, but the marginal likelihood, a principled information-theoretic measure of how strongly the data support a given model.
It is typically argued that approaches based on the marginal likelihood are impractical because they require enumerating the various models under consideration: typically a huge set.
What this argument ignores, however, is that approaches such as the LASSO *effectively* place an upper bound on the maximum model size under consideration through their choice of penalty term.
If a Bayesian were willing to make an equivalent sparsity assumption, say by considering models with at most 5 regressors out of a set of 100, the size of the model space would be dramatically smaller: just under 80 million in this particular example.
Given the speed with which the marginal likelihood can be computed (e.g. Chib 1995) a calculation of this magnitude, while large, is feasible on even a reasonably fast desktop computer.
More to the point, variable selection is an *embarrassingly parallel* problem and in this era of convenient on-demand computation from services such as Amazon's Elastic Compute Cloud (EC2), Bayesian variable selection by explicit enumeration is a viable alternative for problems of realistic scale provided one is willing to make the same kind of sparsity assumption that appears, for example, LASSO estimation.
Indeed, because it considers strictly more information than methods such as the LASSO, a properly tuned enumeratation procedure should yield far better results while still producing interpretable solutions and avoiding the problem of overfitting.
Moreover, by relying on the marginal likelihood for model selection, enumeration avoids the problem of arbitrary tuning parameters while *still* obtaining model selection consistency.

The goals of this project are twofold.
First, we aim to determine which priors are best suited to Bayesian variable selection via marginal likelihood comparisons in a sparse setting.
While some work on this problem has appeared in the literature, we are unaware of any studies that consider problems of a scale comparable to those in which LASSO and related procedures are typically brought to bear.
Second, we plan to develop open-source software using R, C++ and StarCluster to make it easy for researchers to use EC2 to implement our methods.
