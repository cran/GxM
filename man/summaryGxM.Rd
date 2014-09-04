\name{summaryGxM}
\alias{summaryGxM}
\title{
GxM Outcome Summaries
}
\description{
This function is used to summarize the fitted models from applying function {\code{GxM}}. 
}
\usage{
summaryGxM(GxMmle, inverseHessian="overall", eps=1e-10, r=0.999)
}
\arguments{
  \item{GxMmle}{
a model fitting outcome from running \code{GxM}.
}
  \item{inverseHessian}{
a character string specifying the way of inverting the Hessian matrix.
It takes values in \dQuote{overall} and \dQuote{block}. The choice depends on whether the intercepts \eqn{\mu_M} and \eqn{\mu_P}
should be treated disjointedly from other parameters. 
\code{inverseHessian}=\dQuote{overall} inverts the whole Hessian matrix directly.
\code{inverseHessian}=\dQuote{block} chooses to invert two diagonal blocks of the Hessian matrix (a block corresponding to intercept parameters, and a block corresponding to non-intercept parameters),
and combines the invidual inverse.
}
  \item{eps}{
a boundary tolerance to see whether non-negative parameters reach zeros.
}
  \item{r}{
a boundary tolerance to see whether correlation coefficient parameters reach ones or negative ones.
}
}
\value{
\item{\code{loglikelihood}}{maximum log-likelihood value from fitting indicated model to the input data set.}
\item{\code{BIC}}{Bayesian information criterion (BIC) value from the model fitting.}
\item{\code{par}}{parameter estimates.}
\item{\code{stderr}}{standard errors of parameter estimates.}
}
\seealso{
\link{GxM}
}


