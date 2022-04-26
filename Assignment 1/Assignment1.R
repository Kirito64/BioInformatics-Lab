library(readr)

mystring <- read_file("R Files/Assignment 1/DNA-Data.txt")

#Exercise 1: Print the length of the DNA-Data.txt
tlen <- nchar(mystring)
print("length of the DNA-Data.txt is : ")
tlen

#Exercise 2: Print  the number of times that the string Pattern = "TGATCA" occurs in the string Text.
pattern <- "TGATCA"
plen <- nchar(pattern)
count = 0
for(i in 1:tlen-plen+1){
  if(pattern == substr(mystring,i,i+plen-1)){
    count = count + 1
  }
}
print("Count of pattern = TGATCA in the string  : ")
count

# Exercise 3:The Frequent Words Problem

# 3.1: Find the most frequent 2-mer of "GATCCAGATCCCCATAC"
mystring <- "GATCCAGATCCCCATAC"
tlen <- nchar(mystring)
k <- 2
max = -1
mer = ""
for(i in 1:tlen-k+1){
  count = 0
  pattern <- substr(mystring,i,i+k-1)
  plen <- nchar(pattern)
  for(j in 1:tlen-plen+1){
    if(pattern == substr(mystring,j,j+plen-1)){
      count = count + 1
    }
  }
  pattern
  count
    if(count > max){
      max = count
      mer = pattern
    }
}
print("Most frequent 2-mer is : ")
mer

# 3.2: Find the most frequent k-mers in a string.
# Input: A string Text and an integer k.
# Output: All most frequent k-mers in Text.

mystring = readline(prompt = "Enter string text : ")
var = readline(prompt = "Enter integer k : ")
k = as.integer(var);

tlen <- nchar(mystring)
plen <- k
max = -1
mer = c("")
for(i in 1:tlen-k+1){
  count = 0
  pattern <- substr(mystring,i,i+k-1)
  for(j in 1:tlen-plen+1){
    if(pattern == substr(mystring,j,j+plen-1)){
      count = count + 1
    }
  }
  if(count > max){
    max = count
    mer = c(pattern)
  }
  else if(count == max){
    mer <- append(mer,pattern)
    mer <- unique(mer)
  }
}
print("Most freq k-mers in string are : ")
mer

