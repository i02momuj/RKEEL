\docType{class}
\name{Falco_GP_C}
\alias{Falco_GP_C}
\alias{R6_Falco_GP_C}
\title{Falco_GP_C KEEL Classification Algorithm}
\description{
Falco_GP_C Classification Algorithm from KEEL. 
}
\usage{
Falco_GP_C(train, test, population_size, max_generations,
   max_deriv_size, rec_prob, mut_prob, copy_prob, alpha, seed)
}
\arguments{
\item{train}{Train dataset as a data.frame object}
\item{test}{Test dataset as a data.frame object}
\item{population_size}{population_size. Default value = 200}
\item{max_generations}{max_generations. Default value = 200}
\item{max_deriv_size}{max_deriv_size. Default value = 20}
\item{rec_prob}{rec_prob. Default value = 0.8}
\item{mut_prob}{mut_prob. Default value = 0.1}
\item{copy_prob}{copy_prob. Default value = 0.01}
\item{alpha}{alpha. Default value = 0.9}
\item{seed}{Seed for random numbers. If it is not assigned a value, the seed will be a random number}
}
\value{
A data.frame with the actual and predicted classes for both \code{train} and \code{test} datasets.
}
\examples{
data_train <- loadKeelDataset("iris_train")
data_test <- loadKeelDataset("iris_test")

#Create algorithm
algorithm <- RKEEL::Falco_GP_C(data_train, data_test)

#Run algorithm
algorithm$run()

#See results
algorithm$testPredictions
}
\keyword{classification}

