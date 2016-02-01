.onLoad <- function(libname = find.package("RKEELjars"), pkgname = "RKEELjars") {

  #List of jar files to download
  downloadList <- c()

  jarList <- getJarList()

  for(jar in jarList){
    jarFile <- paste0(getJarPath(), jar)
    if(!file.exists(jarFile)){
      downloadList <- c(downloadList, jar)
    }
  }

  #If any jar file is missing, download them
  if(length(downloadList) > 0){
    downloadedFile <- paste0(getExePath(), "RKEELjars.zip")
    packageStartupMessage("Download RKEEL jars")

    #Try to download from http://www.uco.es/~i02momuj
    downloader::download(url = "http://www.uco.es/~i02momuj/RKEELjars.zip", destfile = downloadedFile)

    #If download failed, download from other mirror
    if(file.info(downloadedFile)$size < 1000000){
      unlink(downloadedFile)

      #Try to download from dropbox
      downloader::download(url = "https://www.dropbox.com/s/9g39xyvlpfapowj/RKEELjars.zip?dl=1", destfile = downloadedFile)

      if(file.info(downloadedFile)$size < 1000000){
        unlink(downloadedFile)
        warning("Jar files could not be downloaded.")
      }
      else{
        unzip(zipfile = downloadedFile, exdir = getExePath(), files = downloadList)
        unlink(downloadedFile)
      }
    }
    else{
      unzip(zipfile = downloadedFile, exdir = getExePath(), files = downloadList)
      unlink(downloadedFile)
    }
  }

}
