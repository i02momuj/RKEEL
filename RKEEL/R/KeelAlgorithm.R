#Class that defines a KEEL Algorithm
  #Implements the common functions of a KEEL algorithm

KeelAlgorithm <- R6::R6Class("KeelAlgorithm",

  public = list(

    #Public properties


    #Public functions

    #Initialize
    initialize = function(){
      if(substr(private$jarPath, nchar(private$jarPath), nchar(private$jarPath)) != "/"){
        private$jarPath <- paste0(private$jarPath, "/")
      }
      if(substr(private$exePath, nchar(private$exePath), nchar(private$exePath)) != "/"){
        private$exePath <- paste0(private$exePath, "/")
      }
      if(substr(private$dataPath, nchar(private$dataPath), nchar(private$dataPath)) != "/"){
        private$dataPath <- paste0(private$dataPath, "/")
      }

      #Test paths
      if(! file.exists(paste0(private$jarPath, "RunKeel.jar"))) {
        #cat(paste0("jarPath: ", private$jarPath), sep="\n")
        stop("RunKeel.jar doesn't exist under the defined path. Installation error.")
      }
    },

    #Execute algorithm
    run = function(){
      #Implement in each algorithm type class
    },

    #Print object
    print = function(...) {
      cat("Keel Algorithm Object", sep="\n")
      cat("Need to have an object of an algorithm implementing this class")
    }

  ),

  private = list(

    #Private properties

    #RunKeel.jar path
    #jarPath = system.file("exe", "", package="RKEELjars"),
    jarPath = RKEELjars::getJarPath(),

    #exes path
    #exePath = system.file("exe", "", package="RKEELjars"),
    exePath = RKEELjars::getExePath(),

    #dataset path
    #dataPath = system.file("datasets", "", package="RKEELdata"),
    dataPath = RKEELdata::getDataPath(),


    #Private Functions

    #Create XML function
    writeKeelXML = function(mainPath){
      #Implement in each algorithm class
    },

    #Create config files function
    writeKeelConfig = function(mainPath){
      #Implement in each algorithm class
    },

    #Generate experiment directory
    generateExperimentDir = function(mainPath){
      dir.create(mainPath)
      dir.create(paste0(mainPath, "/datasets"))
      dir.create(paste0(mainPath, "/exe"))
      dir.create(paste0(mainPath, "/results"))
      dir.create(paste0(mainPath, "/scripts"))
      file.copy(paste0(private$jarPath, "RunKeel.jar"), paste0(mainPath, "/scripts/RunKeel.jar"))

    }

  )
)
