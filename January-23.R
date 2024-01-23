#Author: Blessing Obilor, Date:01/23/24, Purpose: perform Microarray analysis

#Set the working directory
setwd("/Users/marya/Documents/data")

#Load library Affy
library(affy)

#Read the .CEL data files
data<-ReadAffy()

#Visualize data
boxplot(data)