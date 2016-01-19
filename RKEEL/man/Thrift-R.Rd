\docType{class}
\name{Thrift_R}
\alias{Thrift_R}
\alias{R6_Thrift_R}
\title{Thrift_R KEEL Regression Algorithm}
\description{
Thrift_R Regression Algorithm from KEEL. 
}
\usage{
Thrift_R(train, test, numLabels, popSize, evaluations,
   crossProb, mutProb, seed)
}
\arguments{
\item{train}{Train dataset as a data.frame object}
\item{test}{Test dataset as a data.frame object}
\item{numLabels}{numLabels. Default value = ?}
\item{popSize}{popSize. Default value = ?}
\item{evaluations}{evaluations. Default value = ?}
\item{crossProb}{crossProb. Default value = ?}
\item{mutProb}{mutProb. Default value = ?}
\item{seed}{Seed for random numbers. If it is not assigned a value, the seed will be a random number}
}
\value{
A data.frame with the actual and predicted values for both \code{train} and \code{test} datasets.
}
\examples{
data_train <- loadKeelDataset("autoMPG6_train")
data_test <- loadKeelDataset("autoMPG6_test")

#Create algorithm
algorithm <- RKEEL::Thrift_R(data_train, data_test)

#Run algorithm
algorithm$run()

#See results
algorithm$testPredictions
}
\keyword{regression}

