## E Rosa
## May 25, 2020

rankall <- function(outcome, num = 'best') {
    
    outcomeOpts <- c('heart attack', 'heart failure', 'pneumonia')
    
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
    
    hospital <- c()
    state <- c()
    for (st in sort(state.abb)) {
        hospital[length(hospital) + 1] <- rankhospital(st, outcome, num)
        state[length(state) + 1] <- st
    }

    res_df <- data.frame('hospital' = hospital, 'state' = state)
    rownames(res_df) <- state
    return(res_df)
    
}










