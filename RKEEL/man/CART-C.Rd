\docType{class}
\name{CART_C}
\alias{CART_C}
\alias{R6_CART_C}
\title{CART_C KEEL Classification Algorithm}
\description{
CART_C Classification Algorithm from KEEL. 
}
\usage{
CART_C(train, test, maxDepth)
}
\arguments{
\item{train}{Train dataset as a data.frame object}
\item{test}{Test dataset as a data.frame object}
\item{maxDepth}{k. Default value = 90}
}
\value{
A data.frame with the actual and predicted classes for both \code{train} and \code{test} datasets.
}
\examples{
data_train <- loadKeelDataset("iris_train")
data_test <- loadKeelDataset("iris_test")

#Create algorithm
algorithm <- RKEEL::CART_C(data_train, data_test)

#Run algorithm
algorithm$run()

#See results
algorithm$testPredictions
}
\keyword{classification}

