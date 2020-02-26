packages <- c("readxl")
lapply(packages, require, character.only = TRUE)

# path to folder that holds files
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd('..')
setwd('..')

file <- "Cabify_2010.xlsx"
originData <- read_excel(file, sheet=1)
# rows with start_date greater than end_date are not valid
data <- subset(originData, originData$arrived_at>=originData$start_at & originData$end_at>=originData$arrived_at)
cancelEndStates <- c('driver cancel', 'rider cancel') 
data$jorneyStatus <- ifelse(data$end_state == "drop off", "completed", 
                            ifelse(data$end_state %in% cancelEndStates, "canceled", "other"))

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd('../data/visualization-data')
getwd()
write.xlsx(data, 'cleanData.xlsx')