library(tidyverse); library(readxl)

#change WD to the github repo locally
list.files(pattern = ".xlsx")

nark <- read_xlsx(list.files(pattern = ".xlsx"))
nark <- nark[!is.na(nark$Field),] #Field cannot be empty or the row will be removed.

nark[] <- lapply(nark, gsub, pattern = "✓", replacement = 1, fixed = TRUE)
#nark <- rename(nark, "Myeloma" = "M.Myeloma", "HeadNeck" = "H&N")

write.csv(nark, file = "forOntology/businessUpFront.csv", row.names = F)
