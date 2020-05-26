## E Rosa
## May 25, 2020


best <- function(state, outcome) {
    
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
    state_df[, 2] <- as.numeric(state_df[, 2])
    state_df <- state_df[complete.cases(state_df), ]
    bestVal <- min(state_df[, 2])
    hospital <- state_df[state_df[, 2] == bestVal, 1]
    
    if (length(hospital) > 1) {
        
        hospital <- sort(hospital)[1]
        
    }
    
    return(hospital)
    
}

