\name{checkGxM}
\alias{checkGxM}
\title{
Singularity Check for GxM Model Fittings
}
\description{
Model fittings based on numerical integration and derivative free optimzation may encounter circumstances in which
likelihood reaches infinity because of singular covariance matrix or other issues. This function helps to detech such circumstances.
}
\usage{
checkGxM(GxMmle, dataset, rGvalue=0.995,
         localpercentage=2, localrange=20, outlyingextent=2)
}
\arguments{
  \item{GxMmle}{
a model fitting outcome from running \code{GxM}.
}
  \item{dataset}{
a data frame which is used to produce \code{GxMmle}.
}
  \item{rGvalue}{
\code{rGvalue} which is used to produce \code{GxMmle}.
}
  \item{localpercentage}{
a local percentage in terms of the value of parameter whose absolute value of gradient is the largest among all gradient components. 
}
  \item{localrange}{
a positive number of parameter points with which the density values are computed and investigated.  
}
  \item{outlyingextent}{
a threshold value measuring the outlying extent. A pair of twins would be identified
if the variation of density values from two close set of parameters is larger than this threshold. 
}
}
\value{
  \item{locallikelihood}{a vector of local log-likelihood values with only one varying parameter whose absolute value of gradient is the largest among all gradient components. 
                           The length of \code{locallikelihood} is equal to \code{localrange}. }
  \item{localfMP}{a data frame matrix of local density values corresponding to the largest gap of \code{locallikelihood}. }
  \item{outlierID}{an integer indicating the pair of twins contributing to the singularity. 
                   A returned value 0 implies that no such pair of twins is found based on the current settings.} 
}
\seealso{
\link{GxM}
}
