this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
x <- c(8,9,11,12)
y <- c(0.9031, 0.9542, 1.0414, 1.0792)

dataLength = length(x)+1
ndd_matrix = matrix(data=NA, nrow=dataLength-1, ncol=dataLength)

#insert x values to first column of matrix
ndd_matrix[,1] = x
#insert y values to second column of matrix
ndd_matrix[,2] = y

count = length(x)-1
interval=1

for(i in 3:dataLength) {
  for(j in 1:count) {
    ndd_matrix[j,i] = (ndd_matrix[j+1,i-1] - ndd_matrix[j, i-1]) / (ndd_matrix[j+interval,1] - ndd_matrix[j,1])
  }
  count = count-1
  interval = interval + 1
}
print(ndd_matrix)
polynomial = paste(ndd_matrix[1,2], " + ", sep = "") 
f = "f <- function(x)"
#rowCount = 1
#for (i in 3:dataLength) {
#  if(i != dataLength) {
#    polynomial = paste(polynomial, ndd_matrix[1,i], " * (x - ", ndd_matrix[rowCount,1], ") + ", sep = "")
#  }else{
#    polynomial = paste(polynomial, ndd_matrix[1,i], " * (x - ", ndd_matrix[rowCount,1], ")", sep = "")
#  }
#  rowCount = rowCount + 1
#}
#for()

print(polynomial)


