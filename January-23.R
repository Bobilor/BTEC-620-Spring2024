#Author: Blessing Obilor, Date:01/23/24, Purpose: perform Microarray analysis

#Set the working directory
setwd("/Users/marya/Documents/data")

#Load library Affy
library(affy)

#Read the .CEL data files
data<-ReadAffy()

#Visualize data
boxplot(data)


#Perform RMA normalization
data_norm <-rma(data)

#Extract the expression data from normalized data variable
data_norm_exprs<-exprs(data_norm)


#Plot the normalized dataset
boxplot(data_norm_exprs)


#Group into treatment and controls for fold change analysis
Control<-data_norm_exprs[,c(1:2)]
Treatment<-data_norm_exprs[,c(3:4)]

#Take averages for treatment and controls for fold change analysis
Control<-rowMeans(Control)
Treatment<-rowMeans(Treatment)

#Take the fold Change
Fold_change<-Treatment-Control


#Interpret these results
#any value > than 2 is a Up-regulated gene in the treatment
#any value < than -2 is a Down-regulated gene in the treatment


#Export the data in csv file
write.csv(Fold_change, "Fold_change.csv")


##########################
#creating a variable called data frame 
Fold_change<- as.data.frame(Fold_change)

#Print the conditional statements
Fold_change[which(Fold_change$Fold_change>2),]
Fold_change[which(Fold_change$Fold_change>-1),]



