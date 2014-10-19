complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    ## First load all relevant files. We'll get a list with all filenames
    filesToLoad <- paste(directory,"/",sprintf("%03d",id),".csv",sep="")
    
    ## Proceed to load the measurements to a dataset
    pollData <- lapply(filesToLoad, read.csv)
   
    ## Get the list with complete cases per id
    nobs <- sapply(lapply(pollData,complete.cases),sum)
    
    ## Add the ids to complete list
    data.frame(id = id, nobs = nobs)
}