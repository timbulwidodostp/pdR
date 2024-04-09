# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Threshold specification of panel Data Use Package pdR (ptm) With (In) R Software
# Threshold Model and Unit Root Tests in Cross-Section and Time Series Data Use Package pdR (ptm) With (In) R Software
# Panel Data Regression for threshold model and unit root tests Use Package pdR (ptm) With (In) R Software
# Install Threshold specification of panel Data Use Package pdR (ptm) With (In) R Software
# Install Threshold Model and Unit Root Tests in Cross-Section and Time Series Data Use Package pdR (ptm) With (In) R Software
# Install Panel Data Regression for threshold model and unit root tests Use Package pdR (ptm) With (In) R Software
install.packages("readxl")
install.packages("httr")
install.packages("pdR")
library(httr)
library("readxl")
library("pdR")
github_link <- "https://github.com/timbulwidodostp/pdR/raw/main/pdR/pdR.xlsx"
temp_file <- tempfile(fileext = ".xlsx")
req <- GET(github_link, 
# authenticate using GITHUB_PAT
authenticate(Sys.getenv("GITHUB_PAT"), ""),
# write result to disk
write_disk(path = temp_file))
pdR <- readxl::read_excel(temp_file)
# subsetting the first 50 obs
#for simplicity
dat<-pdR[1:50,]
#Length of time period
t <- 5            
nt <- nrow(dat)
# number of cross-section units
n <- nt/t
# investment/assets     
dep<- as.matrix(dat[,1])
#Tobin's Q
th1<- as.matrix(dat[,2])
# cash-flow/assets
th2<- as.matrix(dat[,3])
#regime-dep covariates
ind1<- cbind(th1,th2)
# Threshold variable
d <- as.matrix(dat[,4])
# regime-indep covariates
ind2 <- cbind((th1^2),(th1^3),(th1*d)) 
# bootstrapping replications for each  threshold esitmation
bootn<-c(10,25,50)
#trimmed percentage for each threshold  esitmation
trimn<-c(0.05,0.05,0.05) 
qn<-5
conf_lev<-0.95
Output=ptm(dep,ind1,ind2,d,bootn,trimn,qn,conf_lev,t,n)
#Formatted output of 1st threshold, 2 regimes
Output[[1]]
#Formatted output of 2nd threshold, 3 regimes
Output[[2]]
#Formatted output of 3rd threshold, 4 regimes
Output[[3]]
# In the output, the Regime-dependent Coefficients matrix
# Threshold specification of panel Data Use Package pdR (ptm) With (In) R Software
# Threshold Model and Unit Root Tests in Cross-Section and Time Series Data Use Package pdR (ptm) With (In) R Software
# Panel Data Regression for threshold model and unit root tests Use Package pdR (ptm) With (In) R Software
# Install Threshold specification of panel Data Use Package pdR (ptm) With (In) R Software
# is, from top to bottom, regime-wise.
# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Finished