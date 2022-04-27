dnaData <- read.delim("DNA-Data.txt", header = FALSE);
length <- nchar(dnaData);
match <- "TGATCA"
matchs <- lengths(regmatches(dnaData, gregexpr(match, dnaData)))
print(matchs);