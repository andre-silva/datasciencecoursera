corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    ## Start by getting files over the threshold
    id <- complete(directory)
    id <- id$id[id$nobs > threshold]
    
    if(length(id) == 0) {
        id
    } else {
        ## Load all relevant files. We'll get a list with all filenames
        filesToLoad <- paste(directory,"/",sprintf("%03d",id),".csv",sep="")
        
        ## Proceed to load the measurements to a dataset
        pollData <- lapply(filesToLoad, read.csv)
        
        ## Set every element of the list as a data frame so cor can work
        dflist <- lapply(pollData,data.frame)
        
        ## Apply correlation
        sapply(dflist,function(x) cor(x$sulfate,x$nitrate,use="pairwise.complete.obs"))   
    }
}