## E Rosa
## May 25, 2020


## Code associated with the hospital quality assignment
x <- getwd()
setwd(x)
datapath <- paste(x, '/data/', sep = '')


## Part 1
outcome <- read.csv(paste(datapath, 'outcome-of-care-measures.csv', sep = ''), colClasses = 'character')
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)


outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


## Part 2
source('best.R')
best('TX', 'heart attack')
best('TX', 'heart failure')
best('MD', 'heart attack')
best('MD', 'pneumonia')
best('BB', 'heart attack')
best('NY', 'hert attack')


## Part 3
source('rankhospital.R')
rankhospital('TX', 'heart failure', 4)
rankhospital('MD', 'heart attack', 'worst')
rankhospital('MN', 'heart attack', 5000)


## Part 4
source('rankall.R')
head(rankall('heart attack', 20), 10)
tail(rankall('pneumonia', 'worst'), 3)
tail(rankall('heart failure'), 10)
