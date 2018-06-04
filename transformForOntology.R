library(tidyverse); library(readxl)

#change WD to the github repo locally
list.files(pattern = ".xlsx")

nark <- read_xlsx(list.files(pattern = ".xlsx"))
nark <- nark[!is.na(nark$Field),]
nark <- nark %>% fill(Table)
nark <- nark %>% mutate(TableNote = ifelse(grepl("^\\*", Table) == T, gsub("\\**","",Table), NA))
nark$Table <-  replace(nark$Table, grepl("^\\*", nark$Table)==T,NA)
nark <- nark %>% fill(Table)
nark$`Disease-->` <- NULL

nark[] <- lapply(nark, gsub, pattern = "✓", replacement = 1, fixed = TRUE)
nark <- rename(nark, "Myeloma" = "M.Myeloma", "Head & Neck" = "H&N")

write.csv(nark, file = "forOntology/businessUpFront.csv", row.names = F)
