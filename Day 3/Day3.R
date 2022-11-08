
############### Introduction to R Programming ############################
###############    08.11.2022 / Ozancan Ozdemir ##########################
####### ODTÜ İstatistik ve Veri Bilimi Topluluğu & ODTÜ Biyogen ##########


#### Where we were? #####

#### 5. Reading Data Sets in R ####

#Before we move on and discover how to load your data into R, it might be useful 
#to go over the following checklist that will make it easier to import the data 
#correctly into R:

## If you work with spreadsheets, the first row is usually reserved for the 
##header, while the first column is used to identify the sampling unit;

## Avoid names, values or fields with blank spaces, otherwise each word will be 
##interpreted as a separate variable, resulting in errors that are related to 
##the number of elements per line in your data set;

## If you want to concatenate words, inserting a . in between to words 
###instead of an empty space

## Short names are preferred over longer names;

## Try to avoid using names that contain symbols such as ?, $,%, ^, &, *, (, ),
## -,#, ?,,,<,>, /, |, \, [ ,] ,{, and };

## Delete any comments that you have made in your Excel file to avoid extra 
##columns or NA?s  to be added to your file; and make sure that any missing 
##values in your data set are indicated  with NA.

##### Preparing your R workspace ##### 

## In general, when you read the data set, your data file MUST BE 
##in your working directory to make process easier. 

## If you remember how to change wd, OK. 
## Otherwise, please look at the previous class file. 

##### Loading data set being available in R #####

## R and R Studio includes many data sets. 
## In order to display such a data set, 
##you have to type the name of data set on R console.  

## To see the list of the data sets, you can visit the following page.
##https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
  
library(help = "datasets")
  

mtcars

attitude

##### Read TXT files with read.table()##### 

## If you have a .txt or a tab-delimited text file, 
##you can easily import it with the basic R function read.table().

## If the your dataset has column names, 

data<-read.table("grade.txt",header=T)
data

## If not 

data1<-read.table("grade1.txt")
data1


##### Read CSV Excel Files into R #####

## If you have a file that separates the values with a , or ;  you usually are 
##dealing with a .csv file.

## To successfully load this file into R, you can use the read.table() function 
##in which you specify the separator character, or you can use the read.csv() or 
##read.csv2() functions. The former function is used if the separator is a , 
## the latter if ; is used to separate the values in your data file.

## Remember that the read.csv() as well as the read.csv2() function are almost 
##identical to the read.table() function. In other words, you can use read.table()
##command to read csv files, but it is not suggested. 

riskgamble<-read.csv("riskgamble.csv")
head(riskgamble) #shows the first 6 observations of the dataset


head(riskgamble,4) #shows the first 4 observation of the dataset

#head(name of dataset,# of observation thatyou want to show)


# read.delim() for Delimited Files

## The read.delim function is typically used to read in delimited text files, 
##where data is organized in a data matrix with rows representing cases and 
##columns representing variables.

d=read.delim("annual.txt", header=TRUE, sep="\t")


## sep="\t" tells R that the file is tab-delimited 
##(use " " for space delimited and "," for comma delimited)**
  
  
##### Read xlsx Excel Files into R #####
  
## To successfully load this file into R, you have to install readxl library 
##once, then you can use the read_excel() function in which you specify the 
##separator character.

#install.packages("readxl") #install the library
library(readxl)


labour<-read_excel("labourforce.xlsx",sheet=1)
head(labour)

## sheet indicates the sheet number of the data set you want to read
## col_names	 Either TRUE to use the first row as column names, 
## FALSE to number columns sequentially from X1 to Xn, 
#or a character vector giving a name for each column


##Read JSON Files Into R

## A JSON file is a file that stores simple data structures and objects. 
##It contains data in a standard data interchange format which is lightweight, 
##text-based, and human-readable. JSON files were originally based on a subset 
##of JavaScript, but is considered a language-independent format, 
##To get JSON files into R, you first need to install or load the rjson package. 
## Once you have done this, you can use the fromJSON() function. 
## Here, you have two options:
  

#install.packages("rjson")
library(rjson)

JsonData <- fromJSON(file= "world_bank.json" )# Import data from json   file


#Your JSON file is available through a URL:

#install.packages(?rjson?)
#library(rjson)
#JsonData<-fromJSON(file= "https://chronicdata.cdc.gov/api/views/g4ie-h725/rows.json?accessType=DOWNLOAD" )# Import data from json file



#####Read SPSS Files into R#####

## If you are a user of SPSS software and you are looking to import your SPSS 
##files into R, firstly install the foreign package. After loading the package, 
##run the read.spss() function that is contained within it and 
##you should be good to go!
  

#install.packages("foreign")
library(foreign)

birth<-read.spss("birth.sav")
head(birth)



##### Reading a file from internet#####

## Its possible to use the functions read.delim(), read.csv() and read.table()
##to import files from the web.

my_data =read.delim("http://www.sthda.com/upload/boxplot_format.txt")
head(my_data)


##### To export data set from R #####

## R allows you to export data sets from the R workspace to the CSV and 
## tab-delimited file formats.

## To export a data set named data set to a CSV file, use the write.csv function.


write.csv(dataset, "filename.csv")



## To export a data set named data set to a  txt file, use the write.table function.


write.table(dataset, "filename.txt",sep="\t")


## To export a data set named data set to a xlsx file, you need a package 

#install.packages("openxlsx")

library(openxlsx)

write.xlsx(dataset, "filename.xlsx")


patientID <- c(1, 2, 3, 4)

age <- c(25, 34, 28, 52)

diabetes <- c("Type1", "Type2", "Type1", "Type1")

level <- c(120,80,75,130)

stage <- c("Poor", "Improved", "Excellent", "Poor")

patientdata <- data.frame(patientID, age, diabetes, level, stage)
patientdata

write.csv(patientdata,"patientdata.csv")


write.table(patientdata,"patientdata.txt",sep="\t")


write.xlsx(patientdata,"patientdata.xlsx")


# Then, look at your working directory! :) 


#### 0. Data Manipulation and Subseting #### 

## Data subseting is the process of extracting a small piece from data based on 
## a research question. It is useful in exploring the data. 

## Data manipulation is a process of extracting useful information by using 
## some techniques. 

##Can be done by using base code or tidyverse package

## Read the dataset mortality. 


data<-read.table("mortality.txt",header=T)
head(data) #show first six observations 


class(data) #check the class of the data 


str(data) #check the class of each variable in the data 


dim(data) #check the dimension of the data


#Assume we want to construct a new matrix with the first 10 rows of data


data[1:10,]


#Assume we want to construct a new matrix with the 1st , 3nd ,12th , 
#and 15th rows of data


data[c(1,3,12,15),]


#Assume we want to construct a new matrix same as data but 
#without the 4th  row of data


data[-4,]


#Assume we want to construct a new matrix same as data but 
#without the 3rd,5th,12nd and 27th row of the data


data[-c(3,5,12,27),]

#Assume we want to construct a new matrix same as data but 
#without pci information


data[,-3]


#Assume we want to construct a new matrix same as data but 
#without pci and mortality rate information

data[,-c(3,5)]


#Assume we want to confine the analysis only to birth rate which are at least 25 

data[data$birth_rate>=25,]

data[data[,2]>=25,]

subset(data,birth_rate>=25)

#subset(x, subset, select, drop = FALSE, …)


#Assume we want to display the mortality rate of 
#countries whose birth rate which are at least 25 

subset(data,birth_rate>=25, select = mortality_rate)


#Assume we want to display the mortality rate and population of 
#countries whose birth rate which are at least 25 

subset(data,birth_rate>=25, select = c(pop,mortality_rate))

# Assume we want to include only the nations whose mortality 
#rate given is between 80 and 120


data[data$mortality_rate>=80&data$mortality_rate<=120,]

data[data[,5]>=80&data[,5]<=120,]

subset(data,mortality_rate>=80&mortality_rate<=120)

# Assume we want to include only the nations whose population per income 
#equals to either 0.53 or 0.3


data[data$pop==0.53|data$pop==0.3,]

subset(data,pop==0.53|pop==0.3)


## Show the information of nordic countries. 

data[data$nation=="Norway" |data$nation=="Sweden" |data$nation=="Finland", ]

subset(data,nation=="Norway" |nation=="Sweden" |nation=="Finland")

##### Exercise 1 #####

#Read ex_data.txt file on R using appropriate command. 


data<-read.table("ex_data.txt",header=T)
head(data)


#a) Show first six observations



#b) Assume you want to extract temp column




#c)Assume you want to remove 2nd,5th and 7th rows of the data



#d)Assume you want to construct a new matrix that includes only 
#names whose temp values are between 50 and 70



#e)Which country has the highest temperature? 



#### 1. Calculating Summary Statistics #####


## Consider PimaIndiansDiabetes dataset from mlbench package

#install.packages("mlbench")
library(mlbencb)

data(PimaIndiansDiabetes)

?PimaIndiansDiabetes #information

head(PimaIndiansDiabetes)

dim(PimaIndiansDiabetes)

str(PimaIndiansDiabetes)

##### Univariate Calculation #####

## Numerical Data ## 

min(PimaIndiansDiabetes$glucose) #min

mean(PimaIndiansDiabetes$glucose) #mean

median(PimaIndiansDiabetes$glucose) #median

var(PimaIndiansDiabetes$glucose) #variance

sd(PimaIndiansDiabetes$glucose) #standard deviation 

quantile(PimaIndiansDiabetes$glucose,0.25) #quantile 

max(PimaIndiansDiabetes$glucose) #max


## Categorical Data## 

table(PimaIndiansDiabetes$diabetes) #frequency table 

prop.table(table(PimaIndiansDiabetes$diabetes) ) #proportional table 

##### Quick Summary ### 

summary(PimaIndiansDiabetes)

##### Multivariate Calculation #####

cor(PimaIndiansDiabetes$glucose,PimaIndiansDiabetes$insulin) #pearson correlation

#-1 strong negative linear association
#0 linearly independent
#1 strong positive linear association


#mean age of participants based on diabetes type 

aggregate(age~ diabetes, PimaIndiansDiabetes,mean)

#Splits the data into subsets, computes summary statistics for each, and 
#returns the result in a convenient form.

#mean age of participants based on diabetes type and number of times pregnant

aggregate(age~ diabetes+pregnant, PimaIndiansDiabetes,mean)

#mean age and  mass of participants based on diabetes type

aggregate(cbind(mass,age) ~ diabetes, PimaIndiansDiabetes,mean)


#### 2. Missing Data #####

#In statistics, missing data, or missing values, occur when no data value 
#is stored  for the variable in an observation. Missing data are a common 
#occurrence and can have a  significant effect on the conclusions that 
#can be drawn from the data.

#In general, the missing values are recorded as “NA”, “-99”,”0”,”*”, or 
#nonsense numbers such as “354564”.

#When you start your analysis, you should be aware of having missing value or 
#not. If you have,  then you have to fix this problem with appropriate methods,
#then you can go further.


ex <- c(4, 6, 2, NA, 9, 2)	# NA is used to show an object is a missing value in R. 
#Note that, we don't need to use quotation marks to use NA even though it seems like a character
ex
#NA indicates Not available or Not Applicable


#####2.1 Testing for missing values ######
# is.na(x) # returns TRUE of x is missing

is.na(ex)
#TRUE indicates that the value is missing

#na.fail

ex

na.fail(ex)

a=c(2,6,5,4)

na.fail(a)

##### 2.2 Recording values to Missing ######

# R reads only “NA” as missing value. 
#Other representations such as “-99”,”*” are not considered as NA. 


#Create a sampe data set 

v1<-c(9,5,-99,-99,17,4)
v2<-c(4,-99,2,-99,9,2)
v3<-c(3,1,2,-99,8,99)

sample_data <-data.frame(v1,v2,v3)
sample_data

sample_data[sample_data==-99]=NA
sample_data

replace(sample_data, sample_data == -99,NA)
#replace(x, list, values)


##### 2.3 Finding out the number of missing values#####

## Remember 

ex 


length(which(is.na(ex)))

#We use length, which and is.na command together to find out 
#the number of missing values
  
#When you have missing values, you cannot make any analysis. 

sum(ex)# Can not gives a result because of the missing case in the vector.

mean(ex) #cannot give the result 

##### 2.4 Excluding missing values from analysis ######

sum(ex, na.rm = TRUE)	# Now, we inform R that there is a missing case in the vector and want R to ignore it
#na.rm command help me to remove NA term from the vector.

mean(ex, na.rm = TRUE)
  
##### 2.5 Removing missing values from data (Not Suggested) #####

ex

ex1 <- na.omit(ex)
#na.omit deletes NA values in your data. 

ex1 

sum(ex1)

mean(ex1)

##### 2.6 Imputing Missing Values #####


sample_data

sample_data <- replace(sample_data, sample_data == -99,NA)

sample_data

#Mean and Median Imputation 


replace(sample_data$v1, is.na(sample_data$v1), mean(sample_data$v1,na.rm= T)) #mean imputation


replace(sample_data$v2, is.na(sample_data$v2), median(sample_data$v1,na.rm= T)) #median imputation


## Check Amelia II, Mice, and mitools packages for more statistical imputation ideas. 


##### Exercise 2 #####

# Read tao.csv into R

# Calculate the total number of missing values

# Show the variables that have missing values and not have missing values

# Calculate the mean of Air Temperature after median imputation 

# Calculate the sum of Humidity after mean inputation 


#### 3. Apply Family ####

# The apply() family belongs to the R base package and is populated with 
#functions to manipulate slices of data from matrices, arrays, lists and 
#dataframes in a repetitive way. 

#These functions allow crossing the data in a number of ways and avoid 
#explicit use of loop constructs. 

#They act on an input list, matrix or array and apply a named function with 
#one or several optional arguments.


#This family contains apply(), lapply() , sapply(), vapply(), mapply(), rapply(), and tapply() functions.

# apply(X, MARGIN, FUN, ...)

# Consider cars data set in R.

head(cars)  #R built-in dataset

#Sum up for each row:
apply(cars,1,sum) #1 row index 

#Sum up for each column:
apply(cars,2,sum) # 2 column index 

# Mean of each column 

apply(cars,2,sum) 

#It is also possibe to write a user defined function in R by using apply

apply(cars,1:2,function(x) 10 * x)



#lapply(X, FUN, ...)


#If you want to apply a function to every entry in a list or in a vector, 
#we can use lapply() function. 
#When you execute ?lapply, you see that the syntax looks like the apply() 
#function.


summation<-lapply(cars,sum)
summation

summation$speed

summation$dist

lapply(cars,mean)

data <- list(x = 1:5, y = 6:10, z = 11:15)
data



lapply(data,median)


#sapply(X, FUN, ...)
  
#The sapply() function behaves similarly to lapply(); 
#the only real difference is in the return value. sapply() will try to 
#simplify the result of lapply() if possible.  

#In other words, sapply is the same as lapply, 
#but returns a vector instead of a list.
 

sapply(data, median)


#If you use simplify operator in your sapply function, it works like lapply.


sapply(data,median,simplify = F)

  
  
#mapply(FUN,...,SIMPLIFY=T)

# mapply is a multivariate version of sapply. 
#It will apply the specified function to the first element of each argument 
#first, followed by the second element, and so on. 
#The sytnax of the function is,


x <- 1:5
b <- 6:10
mapply(sum, x, b)

# You can implement user defined functions. 

diff<-function(x,y){x-y}


mapply(diff,x,b)



#tapply(Summary Variable, Group Variable, Function)
  
#In statistics, one of the most basic activities we do is computing summaries of variables. 
#These summaries might be as simple as an average, or more complex.
#Let's look at some simple examples.
#When you read the results of a medical trial, you will see things such as 
#"The average age of subjects in this trial was 55 years in the treatment group, 
#and 54 years in the control group." 





## generate data for medical example
medical.example <-data.frame(patient = 1:100,age = rnorm(100, mean = 60, sd = 12), treatment = gl(2, 50,labels = c("Treatment", "Control")))
summary(medical.example)

    
## generate data for baseball example
## 5 teams with 5 players per team
baseball.example <-data.frame(team = gl(5, 5,labels = paste("Team", LETTERS[1:5])), player = sample(letters, 25), batting.average = runif(25, .200, .400))
summary(baseball.example)



## tapply(Summary Variable, Group Variable, Function)
## Medical Example
tapply(medical.example$age, medical.example$treatment, mean)



## Baseball Example
tapply(baseball.example$batting.average, baseball.example$team,max)


##### Example 3.1 #####
mymatrix = matrix(data = c(6,34,923,5,0, 112:116, 5,9,34,76,2, 545:549), 
                  nrow = 5)
mymatrix

# Get the mean of each row


#  Get the mean of each column


# Sort the columns in ascending order




##### Example 3.2 #####

#Consider mtcars dataset. 
#Which columns in mtcars dataset have observations which are greater than 20? 
#If they have, how many? 



##  Use two 'apply' family functions to get the minimum values of each 
#column of the 'mtcars' dataset (hint: 'lapply', 'sapply'). 
## Explain the difference between type of outputs.



## Use the mapply() function to find out how many mpg values are greater 
## than 10, how many cylinders are greater than 6 and how many displacement 
## values are greater than 300. 


## (Hint: You should create a user defined function.)






