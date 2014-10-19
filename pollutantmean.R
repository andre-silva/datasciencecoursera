pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    ## First load all relevant files. We'll get a list with all filenames
    filesToLoad <- paste(directory,"/",sprintf("%03d",id),".csv",sep="")
    
    ## Proceed to load the measurements to a dataset
    pollData <- lapply(filesToLoad, read.csv)
    pollData <- do.call(rbind,pollData)
    
    ## Get relevant pollutant
    pollColumn <- grep(pollutant,colnames(pollData))
    
    ## Get mean for pollutant
    mean(pollData[,pollColumn], na.rm=TRUE)
}