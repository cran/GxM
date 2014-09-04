\name{GxM}
\alias{GxM}
\title{
Maximum Likelihood Estimation of Gene-by-Measured Environment Interaction Models
}
\description{
This function is used to produce maximum likelihood estimation for model fittings. 
With identification of the model fitted to the given data set with certain constrains of parameters, 
both numerical method and closed form based method are available to 
obtain the maximum likelihood estimate of parameters. Hessian matrix of log-likelihood at the estimate
is provided to obtain the standard errors of the estimate.
}
\usage{
GxM(dataset, rGvalue=0.995, modelname, 
    zeroset=character(), closedform=FALSE, K=8, coreNumber=1, 
    manualinitial=NULL, priority=1, gradientlevel=2)
}
\arguments{
\item{dataset}{
a data frame of input. This data frame should contain 6 columns, including the id of twin/sibling pairs, the rG value for the pairs, as well as the observed M1, M2, P1 and P2 values. 
The M1, M2, P1, P2 data would NOT be automatically standardized. 
}
\item{rGvalue}{a correlation value of genetic influences to a pair of twins/siblings. A value close to one is used to replace exact one to avoid calculations with singular matrices.
This value cannot be the same for all pairs for the same reason.}
\item{modelname}{
a character string input specifying which model should be fitted. Possible choices include \code{Chol,CholGxM,CholNonLin,NLMainGxM,CorrGxM} and \code{CorrNonLin}. \cr
\describe{
\item{\code{Chol}}{\eqn{P = \mu_P + a_C*A_M + c_C*C_M + e_C*E_M + a_U*A_U + c_U*C_U + e_U*E_U.}}
\item{\code{CholGxM}}{\eqn{P = \mu_P + (a_C+\alpha_C*M)*A_M + (c_C+\kappa_C*M)*C_M + (e_C+\epsilon_C*M)* E_M + (a_U+\alpha_U*M)*A_U + (c_U+\kappa_U*M)*C_U + (e_U+\epsilon_U*M)*E_U.}}
\item{\code{CholNonLin}}{\eqn{P = \mu_P + a_C*A_M + c_C*C_M + e_C*E_M + a_U*A_U + c_U*C_U + e_U*E_U + \gamma_1*A^2_M + \gamma_2*C^2_M + \gamma_3*E^2_M + \delta_1*A_M*A_U + \delta_2*C_M*C_U + \delta_3*E_M*E_U.}}
\item{\code{NLMainGxM}}{\eqn{P = \mu_P + \beta_1*M + \beta_2*M^2 + (a_U+\alpha_U*M)*A_U + (c_U+\kappa_U*M)*C_U + (e_U+\epsilon_U*M)*E_U.}}
\item{\code{CorrGxM}}{\eqn{P = \mu_P + (a_P+\alpha_P*M)*A_P + (c_P+\kappa_P*M)*C_P + (e_P+\epsilon_P*M)*E_P.}}
\item{              }{\eqn{ r_A = corr(A_P,A_M);  r_C = corr(C_P,C_M);  r_E = corr(E_P,E_M)}}
\item{\code{CorrNonLin}}{\eqn{P = \mu_P + a_P*A_P + c_P*C_P + e_P*E_P + \lambda_1*A_M*A_P + \lambda_2*C_M*C_P + \lambda_3*E_M*E_P.}}
\item{                 }{\eqn{ r_A = corr(A_P,A_M);  r_C = corr(C_P,C_M);  r_E = corr(E_P,E_M)}}
}
}
\item{zeroset}{
a set of parameters that would be set zeros in the estimation. Character string for parameter names would be used for identification.
}
\item{closedform}{
logical type indicating whether closed form method or numerical method should be applied to likelihood calculation.
}
\item{K}{
an integer indicating the number of points in each dimension in numerical integration.
}
\item{coreNumber}{
a positive integer representing whether and how parallel computation should be used. The fault value is set to be 1, and no parallel computation is necessary. A number greater than 1 indicates how many processors would be used in parallel computation.  
}
\item{manualinitial}{
a list of numerical values used for initializing the parameters excluding members in the zeroset.
}
\item{priority}{
a positive number specifying the priority of manual initialization. It takes values in 1 and 2. Priority=2 implies that 
the manual initialization would override possible update built in the optimization.
}
\item{gradientlevel}{
a positive value which serves as a threshold. A warning information would be produced if the maximum absolute value 
of gradient components exceeds this level.
}
}
\value{
An S4 class of output with 10 slots would be returned. \cr
\item{\code{loglikelihood}}{maximum log-likelihood value from fitting indicated model to the input data set.}
\item{\code{BIC}}{Bayesian information criterion (BIC) value from the model fitting.}
\item{\code{par}}{parameter estimates.}
\item{\code{hess}}{Hessian matrix of log-likelihood at the maximum point with respect to parameters.}
\item{\code{gradient}}{gradient components of log-likelihood at the maximum point with respect to parameters.}
\item{\code{modelname}}{inherited from input.}
\item{\code{zeroset}}{inherited from input.}
\item{\code{closedform}}{inherited from input.}
\item{\code{K}}{inherited from input.}
\item{\code{coreNumber}}{inherited from input.}
}
\references{
Rathouz, P. J., Van Hulle, C. A., Rodgers, J. L., Waldman, I. D., Lahey, B. B. (2008)
\emph{Specification, testing, and interpretation of gene-by-measured-environment interaction models
in the presence of gene-environment correlation}. Behavior Genetics, 38(3), 301-315.
}
\seealso{
\link{checkGxM}, \link{summaryGxM}
}
\examples{
id <- 1:10;
rG <- c(rep(1,5),rep(0.5,5));
M1 <- rnorm(10);
M2 <- rnorm(10);
P1 <- rnorm(10);
P2 <- rnorm(10);
Data <- data.frame(id,rG,M1,M2,P1,P2);
output <- GxM(dataset = Data, modelname='Chol', closedform=TRUE);
output;
output@BIC;
output@hess;
}
