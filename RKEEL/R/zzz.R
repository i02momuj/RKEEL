require(downloader)
require(utils)
require(openssl)

.onLoad <- function(libname = find.package("RKEEL"), pkgname = "RKEEL") {

  #List of jar files to download
  downloadList <- c()

  jarList <- getJarList()

  for(jar in jarList){

    jarPath <- getJarPath()
    if(substr(jarPath, nchar(jarPath), nchar(jarPath)) != "/"){
      jarFile <- paste0(jarPath, "/", jar)
    }
    else{
      jarFile <- paste0(jarPath, jar)
    }

    if(!file.exists(jarFile)){
      downloadList <- c(downloadList, jar)
    }
  }

  #If any jar file is missing, download them
  if(length(downloadList) > 0){

    libPath = paste(.libPaths()[1], "/RKEEL", sep="")
    downloadedJarFile <- file.path(libPath, "RKEELjars_1.1.zip") #  "/tmp/RKEELjars.zip" # system.file("exe", package="RKEEL")

    #packageStartupMessage("Download RKEEL jars")

    #Try to download from two different mirrors: UCO and UGR
    tryCatch( 
      { 
        downloader::download(url = "https://www.uco.es/users/jmoyano/RKEELjars_1.1.zip", destfile = downloadedJarFile, mode = "wb", timeout=120)
        }, 
      error = function(e) {
        tryCatch( 
          { 
            downloader::download(url = "https://ugr.es/~jmoyano/RKEELjars_1.1.zip", destfile = downloadedJarFile, mode = "wb", timeout=120)
            }, 
          error = function(e) {
            warning("Jar files could not be downloaded. Please try again later")
            }
          )
        },
      warning = function(w) {
        sink("Cannot download from UCO mirror.")
        tryCatch( 
          {
            downloader::download(url = "https://ugr.es/~jmoyano/RKEELjars_1.1.zip", destfile = downloadedJarFile, mode = "wb", timeout=120)
            }, 
          error = function(e) {
            warning("Jar files could not be downloaded. Please try again later")
            }
        )
        }
      )

    #If download failed, download from other mirror
    if(as.character(md5(file(downloadedJarFile, open = "rb"))) != "d09bda2a58378012dcf1fe02125a4442"){
      unlink(downloadedJarFile)
      warning("Jar files could not be downloaded.")
    }
    else{
      utils::unzip(zipfile = downloadedJarFile, exdir = paste(libPath, "/exe", sep="")) # "/tmp") #
      unlink(downloadedJarFile)
    }
  } #If all jars are downloaded, not download again

}
