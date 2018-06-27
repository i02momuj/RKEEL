require(downloader)
require(utils)

.onAttach <- function(libname = find.package("RKEELjars"), pkgname = "RKEELjars") {

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

  #packageStartupMessage("Forbidden the following jars: ")
  #packageStartupMessage(downloadList)

  #If any jar file is missing, download them
  if(length(downloadList) > 0){

    downloadedFile <- file.path(system.file("exe", package="RKEELjars"), "RKEELjars.zip")

    #packageStartupMessage("Download RKEEL jars")

    #Try to download from uco
    downloader::download(url = "https://github.com/i02momuj/RKEEL/raw/master/RKEELjars/RKEELjars.zip", destfile = downloadedFile, mode = "wb")

    #If download failed, download from other mirror
    if(file.info(downloadedFile)$size < 1000000){
      unlink(downloadedFile)

      #Try to download from dropbox
      downloader::download(url = "http://www.uco.es/users/jmoyano/RKEELjars.zip", destfile = downloadedFile, mode = "wb")

      if(file.info(downloadedFile)$size < 1000000){
        unlink(downloadedFile)
        warning("Jar files could not be downloaded.")
      }
      else{
        utils::unzip(zipfile = downloadedFile, exdir = system.file("exe", package="RKEELjars"))
        unlink(downloadedFile)
      }
    }
    else{
      utils::unzip(zipfile = downloadedFile, exdir = system.file("exe", package="RKEELjars"))
      unlink(downloadedFile)
    }
  } #If all jars are downloaded, not download again

}
