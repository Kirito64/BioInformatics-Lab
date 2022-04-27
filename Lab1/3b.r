library("pracma")
library("hash")

freqmap <- function(str, k) {

    len = nchar(str)
    if (k > len) {
      stop("k exceeds the length of dnastr")
    }
    map = hash()
    for (i in 1:(len-k+1)) {
      pattern = substr(str,i,(i+k-1))
      if ( has.key(pattern,map)) {
        map[[pattern]] = map[[pattern]] + 1
      } else {
        map[[pattern]] = 1
      }
    }
    return(map)
}

freq <- function(str, k) {
	len =nchar(str);
	if (k > len) 
		stop("K exceedes string lenght");
	
	frequency = freqmap(str, k);
	most = hash()

	maxvalue = max(values(frequency))

	for (i in keys(frequency)){
		if(frequency[[i]] == maxvalue){
			most[[i]] = maxvalue
		}
	}

	return(most);
}
print("Enter The DNA sequence")
str = readLines("stdin", n = 1)
print("Enter the k value")
k = as.integer(readLines("stdin",n = 1));

print(freq(str,k));


