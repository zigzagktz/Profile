
#read your docmen files whatever way feels comfertable to you

df <- read.csv("filename.csv")


#create empty data frame
y <- NA
y <- as.data.frame(y)


#text preprocessing
for (i in 1:nrow(df)) {
y[i] <- removePunctuation(y[i])   # remove all the punctuations
y[i] <- tolower(y[i])             # convert eveything into lowercase
y[i] <- stripWhitespace(y[i])     # strip away any white space
y[i] <- removeNumbers(y[i])       # remove numbers
}


#create corpus and convert it into matrix
var <- as.matrix(TermDocumentMatrix(corpus))  # converting the copus into matrix
var <- t(var)  # taking transpose 
var <- as.data.frame(var) # converting into dataframe


# TERM FREQUENCY FUNCTION
tf <- function(row){
  row/(sum(row))
}


# INVERSE DOCUMENT FREQUENCY FUNCTION
idf <- function(col){
  N <- length(col)
  term_count <- length(which(col>0))
  log10(N/term_count)
}


# COMPUTING FINAL RESULT
tf_idf <- function(tf,idf)
{
  tf*idf
}


# APPLYING TF FUNCTION FOR EACH DOCUMENT
tf_vector <- apply(var, 1, tf)

#APPLYING IDF FUNCTION ACROSS EACH TERM ACROSS ALL DOCUMENTS
idf_vector <- apply(var, 2, idf)

#MULTIPLYING THE RESULTS
train <- apply(tf_vector, 2, tf_idf, idf=idf_vector)
