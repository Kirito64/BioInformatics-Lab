
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(version ="3.14")

BiocManager::install("multtest")

library(multtest)

data(golub)
nrow(golub)

ncol(golub) 

golub[1042,2]

golub[,1]

golub[1042,] # show data for row no 1042 (cols=38)

golub[1042,1:27]

gol.fac <- factor(golub.cl, levels=0:1, labels = c("ALL","AML"))

golub[1042,gol.fac=="ALL"]

meanALL <- apply(golub[,gol.fac=="ALL"], 1, mean)

grep("CD33",golub.gnames[,2])

#1.a
class(golub)

class(golub[1,1])
class(golub.cl)
class(golub.gnames)
class(apply)
class(exp)
class(gol.fac)
class(plot)
#class(ALL) ALL not found

#1.b

#2.a   #error
gene1 <- c(1.00,1.50,1.25)
gene2 <- c(1.35,1.55,1.00) 
gene3 <- c(-1.10,-1.50,-1.25)
gene4 <- c(-1.20,-1.30,-1.00)
rowcolnames <- list(c("gene1","gene2","gene3","gene4"),  c("Eric","Peter","Anna"))
gendat <- matrix(c(gene1,gene2,gene3,gene4), nrow=4, ncol=3,  byrow=TRUE, dimnames =rowcolnames)
apply(gendat,2,sd) #sd of persons


sdexprsval <- apply(gendat,1,sd)
print(sdexprsval) #sd of genes
o <- order(sdexprsval,decreasing=TRUE)
gendat[o,]

#3. Computations on gene means of the Golub data.
# a) Computation of mean gene expression values.
data(golub, package = "multtest")
meangol <- apply(golub,1,mean)
o <- order(meangol,decreasing=TRUE)
golub[o,]
golub.gnames[o[1:3],3]

golub.gnames[o[1:3],2]
#4.a
sdgol <- apply(golub,1,sd)
#4b
golubsd <- golub[sdgol>0.5,]
#4c



#5a
length(agrep("^oncogene",golub.gnames[,2]))
#5b

data(golub, package="multtest")
rowindex <- agrep("^oncogene",golub.gnames[,2])
oncogol <- golub[rowindex,]
oncogolub.gnames <- golub.gnames[rowindex,]
gol.fac <- factor(golub.cl,levels=0:1, labels= c("ALL","AML"))
meangol <- apply(oncogol[,gol.fac=="ALL"],1,mean)
o <- order(meangol,decreasing=TRUE)
oncogolub.gnames[o[1:3],2]

#5c
meangol <- apply(oncogol[,gol.fac=="AML"],1,mean)
o <- order(meangol,decreasing=TRUE)
oncogolub.gnames[o[1:3],2]
#5d

x <- oncogolub.gnames[o[1:10],c(3,2)]
colnames(x) <- c("probe ID","gene name")
write.csv(x,file="goluboutcsv")
write.table(x,file="goluboutnorowname",row.names=FALSE)

#6a
gl(2,4)
gl(5,3)
gl(3,5)

#7a
BiocManager::install("ALL")
library(ALL); 
data(ALL)
meanB1 <- apply(exprs(ALL[,ALL$BT=="B1"]),1, mean)
o <- order(meanB1,decreasing=TRUE)
meanB1[o[1:3]