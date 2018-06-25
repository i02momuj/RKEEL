#Class implementing a Semi-Supervised Learning Algorithm
  #Implements the C45-SSL KEEL algorithm

C45_SSL <- function(train, trs, test, pruned=TRUE, confidence=0.25, instancesPerLeaf=2, seed=-1){
  alg <- RKEEL::R6_C45_SSL$new()
  alg$setParameters(train, trs, test, pruned, confidence, instancesPerLeaf, seed)
  return (alg)
}

R6_C45_SSL <- R6::R6Class("R6_C45_SSL",

  inherit = SemiSupervisedAlgorithm,

  public = list(

    #Public properties

    #pruned
    pruned = TRUE,

    #confidence
    confidence = 0.25,

    #instances per leaf
    instancesPerLeaf = 2,

    #seed
    seed = -1,


    #Public functions

    #Initialize function
    setParameters = function(train, trs, test, pruned=TRUE, confidence=0.25,
                          instancesPerLeaf=2, seed=-1){

      super$setParameters(train, trs, test)

      self$pruned <- pruned

      self$confidence <- confidence

      self$instancesPerLeaf <- 2

      self$seed <- seed

    }

  ),

  private = list(

    #Private properties

    #jar Filename
    jarName = "C45SSL.jar",

    #algorithm name
    algorithmName = "C45-SSL",

    #String with algorithm name
    algorithmString = "C4.5 Decision Tree for SSL",


    #Private functions

    #Get the text with the parameters for the config file
    getParametersText = function(){

      text <- ""
      text <- paste0(text, "seed = ", self$seed, "\n")
      text <- paste0(text, "pruned = ", self$pruned, "\n")
      text <- paste0(text, "confidence = ", self$confidence, "\n")
      text <- paste0(text, "isntancesPerLeaf = ", self$instancesPerLeaf, "\n")

      return(text)

    }
  )
)


