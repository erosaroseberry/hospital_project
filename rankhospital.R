## E Rosa
## May 25, 2020

rankhospital <- function(state, outcome, num = 'best') {
    
    outcomeOpts <- c('heart attack', 'heart failure', 'pneumonia')
    stateOpts <- state.abb
    
    if (!(state %in% stateOpts)) {
        stop('invalid state')
    }
    if (!(outcome %in% outcomeOpts)) {
        stop('invalid outcome')
    }
    
    df <- read.csv('data/outcome-of-care-measures.csv', colClasses = 'character')
    
    if (outcome == 'heart attack') {
        colnum <- 11
    }
    if (outcome == 'heart failure') {
        colnum <- 17
    }
    if (outcome == 'pneumonia') {
        colnum <- 23
    }
    
    state_df <- df[df$State == state, c(2, colnum)]
    
    if (class(num) == 'numeric') {
        
        if (num > nrow(state_df)) {
            return(NA)
        }
    }
    
    state_df[, 2] <- as.numeric(state_df[, 2])
    state_df <- state_df[complete.cases(state_df), ]
    colnames(state_df) <- c('Hospital.Name', 'Rate')
    state_df <- state_df[order(state_df$Rate, state_df$Hospital.Name), ]
    Rank <- 1:nrow(state_df)
    state_df <- cbind(state_df, Rank)
    
    if (num == 'best') {
        return(state_df$Hospital.Name[1])
    }
    if (num == 'worst') {
        return(state_df$Hospital.Name[nrow(state_df)])
    }
    else {
        return(state_df$Hospital.Name[num])
    }
    
}



