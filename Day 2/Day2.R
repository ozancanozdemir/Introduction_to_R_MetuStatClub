
############### Introduction to R Programming ############################
###############    01.11.2022 / Ozancan Ozdemir ##########################
####### ODTÜ İstatistik ve Veri Bilimi Topluluğu & ODTÜ Biyogen ##########


#### Where we were? #####

##### Lists #####

### Lists are the most complex of the R data types. 
### Basically, a list is an ordered collection of objects (components). 
### A list allows you to gather a variety of (possibly unrelated) objects 
### under one name.

x <- c(6,8,10)
x
class(x)

is.vector(x)

is.list(x)

list1 <- list(6,8,10)
list1
class(list1)

is.list(list1)

length(list1) #returns length of the object 

unlist(list1) #returns a vector 

###### List Manipulations #####

## Creating a list object ## 

j <- list(c("Joe","Marry","Michael"), 
          c(55000,12000,7000),
          c(46,28,20))

print(j)

length(j)

str(j)

### Finding entries from list by position or name

j[[1]]


j[[2]]


j[[1]][2]

j1 <- list(name=c("Joe","Marry","Michael"), 
           salary=c(55000,12000,7000),
           age=c(46,28,20))

print(j1)

j1$name

j1$name[2]

names(j) <- c("name","salary","age")

print(j)



### Checking an element in list 

"Marry" %in% j1

"Marry" %in% j1[[1]]

### Adding new object in a list 

append(j1, "ozan")

j1[[1]][4] = "ozan"

j1

append(j1, "ozan", after = 2)

j1[-1]

##### Factors #####

answers <- c("Strognly Disagree","Disagree",
             "Neither Disagree nor Agree",
             "Agree",
             "Strongly Agree")

print(answers)

class(answers)

#convert into factor 
answers <- factor(answers)

answers

levels(answers)

#Reorder your levels 

myorder <-  c("Strognly Disagree","Disagree",
              "Neither Disagree nor Agree",
              "Agree",
              "Strongly Agree")

answers <- factor(answers, levels = myorder, ordered = TRUE)

levels(answers)

##### Date ##### 



date<-"11111994"

class(date)

is.Date(date)

as.Date(date)  

install.packages("lubridate")
library(lubridate)

new_date <- dmy(date)
new_date

class(new_date)

information <- data.frame( age = c(20,25,28),
                           height = c(160, 175, 183),
                           birth_date  = c("20020301","19970315","19940407")
)


information1 <- data.frame( age = c(20,25,28),
                            height = c(160, 175, 183),
                            birth_date  = c("2002_03_01","1997_03_15","1994_04_07")
)

information2 <- data.frame( age = c(20,25,28),
                            height = c(160, 175, 183),
                            birth_date  = c("01032002","15031997","07041994")
)


str(information)


information$birth_date <- ymd(information1$birth_date)

information

###### Exercise 3.4 ###### 

## Convert birth_date columns in information1 and information2 to a date object



#### 4. Specific Applications ####

################ Example 1 #################

#some built-in function

x=c(1,9,0,5,1,9,5,6)

print(x)

which(x==6)#shows the location of 6 in the vector of x

which.max(x)#shows the location of the maximum element of vector of x

which.min(x)#shows the location of the minimum element of vector of x

length(x) #to see the length of the vector

max(x) #maximum value of a vector

min(x) #minimum value of a vector

range(x)#minimum and maximum values of vectors

sum(x)#the summation of all elements of a vector

cumsum(x)#cumulative sum of vector

mean(x)#mean of the vector

median(x)#median of the vector

var(x)#variance of vector

sd(x)#standard deviation of the vector

sort(x)#sort in increasing order

sort(x,decreasing = T)#sort in decreasing order

diff(x)#take the difference of ith and (i+1)th element

################ Example 2 ######################

### Combination of multiple items

first_word <- "ali"

second_word <-"ata"

third_word <-"bak"

print(first_word, second_word, third_word) #error!

print(first_word);print(second_word);print(third_word)

cat(first_word, second_word, third_word) #combines multiple items.

cat("odtü", 1956, "yılında","kuruldu.")

# paste and paste0

x = 8

paste0("This is ", x, "hours", "R Course")
paste("This is ", x, "hours", " R Course")
# The difference between paste() and paste0() is that the argument sep
# by default is " " for (paste) and "" for (paste0).

################ Example 3 ######################

sample(1:25,3) #generate 3 different intergers between 1 and 25

sample(1:25,10,replace = TRUE) #generate 4 integers between 1 and 25 and 
#an integer can be generated more than one.

set.seed(158) # the recommended way to specify seeds.

x = rnorm(100) #generate 100 number from standard normal distribution.

head(x) # shows first 6 items

x = rnorm(100)

head(x)

set.seed(158)

x = rnorm(100) 

head(x) 

# work with your previous commands
history() # display last 25 commands

# save your command history
savehistory(file="mycodes") 

# save the workspace to the file .RData in the cwd
save.image("Day1Data")

ls() #list the R objects in the current workspace
rm(x) #remove x from the workspace
rm(list=ls()) #remove all the variables from the workspace

q() #close your R programme. 


#### 0. Swirl Package #### 

install.packages("swirl")

library(swirl)

swirl() # start swirl

#### Control Structures ####

## Control structures allow you to put some “logic” into your R code, 
## rather than just always executing the same R code every time. 
## Commonly used control structures are 

# if and else : testing a condition and acting on it.

# for: execute a loop a fixed number of times. 

# while: execute a loop while a condition is true. 

# repeat: execute an infinite loop (must break out of it to stop) 

# break: break the execution of a loop 

# next: skip an interation of a loop

### Reminder 

# <	less than
# <=	less than or equal to
# >	greater than
# >=	greater than or equal to
# ==	exactly equal to
# !=	not equal to
# !x	Not x
# x | y:	x OR y
# x & y:	x AND y
# isTRUE(x):	test if X is TRUE

#### 1. If statements #####

#An if statement runs a block of code only if a certain condition is true.

#if (condition){
  #do something if condition is true
#}

x<-1

if (x==1){
  
  print("x equals to 1")
  
}



a <- 6 

b <-  8 

if(a <= b){
  a <- a^2
}

a


#if (condition){
  #do something if condition is true
#}
#else{
  #do someting if condition is not true
#}

a <- 19

if(a > 23) {
  
  print("greater")
  
  
} else if(a < 23){
  
  print("less")
}

# or 

a <- 19

ifelse(a>23,"greater","less")


#if (condition){
  #do something if condition is true
#} else if (condition2) {
  #do something if condition2 is  true
#} else {
  #do something if neither condition 1 nor condition 2 is true
#}


age <- 28 

if (age<23){
  print("S/he is a bachelor student.")
} else if (age >= 23 & age <=25){
  print("S/he is a master student.")
} else {print("S/he is a PhD student.")}



#### if else ladder 

#if (condition){
#do something if condition is true
#} else if (condition2) {
#do something if condition2 is  true
#} else if (condition3) {
#do something if condition3 is  true
#} else {
#do something if condition 1, condition 2 and condition 3 is not true
#}


###### Exercise 1.1 ######

## For a given vector whose elements are 4,5,-9,6,7,12,-3. 
## Please classify them as odd and even by using ifelse 


#### 2. for loops ####
# In R , for loops take an interator variable and 
# assign it successive values from a sequence or vector. 
# It is most commonly used for iterating over the elements of an object.

#The general form of for loop is

#for(index in vector){
#  do any code in here
#}

for (i in 1:10) {
    print(i)
}


x <- c("apples", "oranges", "bananas", "strawberries")

for (i in 1:length(x)) {
    print(x[i])
}


## manipulate items 

sum <- 0 

for(i in 1:10){
  sum <- sum + i 
  cat("The current summation value is", sum,".")
}

print(sum)

###### Exercise 2.1 #######

# Write a structure for a given vector v=4,5,-6,2,0,-2,4 
# that decides which number is negative which number is positive. 
# If a entry selected from the vector is positive, 
# print "it is a positive number", 
# if it is negative, print "it is a negative number". 
# If it is equals to zero, print "it equals to zero"

##### Nested for loops #####

## for loops can be nested inside of each other.

#for(index in vector){
#  for(index1 in vector1){
#  do any code in here
#  }
#}

# They are commonly used for multidimensional or hiearchical data structures. 
# Be careful with nesting though. Nesting beyond 2 or 3 levels often makes 
# it difficult to read/understand the code.


m <- matrix(1:10, 2)
print(m)
for (i in 1:nrow(m)) {
  for (j in 1:ncol(m)) {
    print(m[i, j])
  }
}

##### Exercise 2.2 #####

# Create a matrix of size 6 by 6, where the entries are equal to 
# the summation of the row and column number.



#### 3. While loop ####

# While loops begin by testing a condition. 
# If it is true, then they execute the loop body. 
# Once the loop body is executed, the condition is tested again, 
# and so forth, until the condition is false, after which the loop exists. 

#while(loopcondition){
#  do any code in here
#}


count<-0

while(count<10){
  count<-count+1
  cat("\n'mycount' is now",count,"\n")
  cat("'mycondition' is now",count<10,"\n")
}


invest <- 5 

while(invest >= 5 && invest <=10){
  
  earning_a_money = rbinom(1,1,0.5) 
  
  if (earning_a_money == 1){
    
    invest <- invest + earning_a_money
    cat("\n'my invest' is now",invest,"\n")
    cat("'mycondition' is now",invest >= 5 && invest <=10,"\n")
  }
  
  else{
    
    invest <- invest - earning_a_money
    cat("\n'my invest' is now",invest,"\n")
    cat("'mycondition' is now",invest >= 5 && invest <=10,"\n")
  }
  
}

##### Exercise 3.1 #######

# Please calculate the following sum using while loop 

# s = 1 + 2 + 2^2 + 2^3 + ... + 2^8 



##### break and next #### 

#break is used to exit a loop immediately, 
#regardless of what iteration the loop may be on.


for(i in 1:100) {
  print(i)
  if(i > 20) {
    ## Stop loop after 20 iterations
    break
  }
}


invest <-5

while(invest >= 5 && invest <=10){
  
  earning_a_money = rbinom(1,1,0.5) 
  
  
  if (earning_a_money == 1){
    
    invest <- invest + earning_a_money
    cat("\n'my invest' is now",invest,"\n")
    cat("'mycondition' is now",invest >= 5 && invest <=10,"\n")
  }
  
  else{
    
    invest <- invest - earning_a_money
    cat("\n'my invest' is now",invest,"\n")
    cat("'mycondition' is now",invest >= 5 && invest <=10,"\n")
  }
  
  if(invest== 10) {
    break
  }
  
}


## next is used to skip an iteration of a loop.


for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next
  }
  print(i)
}


x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}


##### Exercise 3.2 #####

# How many values between 1 and 1000 are exactly divided by 4?  



##### repeat ##### 

## repeat initiates an infinite loop right from the start. 
## These are not commonly used in statistical or data analysis applications but 
##they do have their uses. The only way to exit a repeat loop is to call break.

#repeat{
#  do any code in here
#}

x<-0
repeat{
  x <- x+1 
  print(x)
}

x<-0

repeat{
  x<- x+1
  print(x)
  if(x == 100){
    break
  }
}

#### 4. Writing your own functions #### 

## Although there are many built-in functions in R, you have to create your own 
## functions in R. You create an R function using the function keyword.

# function_name <- function(var){
#   Do something
#   return(new_variable)
# }

square<-function(x){
  y <- x^2
  return(y)
}

square(2)

square(-2)

## you can give more then one input. 

sum.of.square<-function(x,y){
  z <- (x^2)+(y^2)
  return(z)
}


##### Exercise 4.1 ##### 

#Write a function that shows the larger number among the given two inputs 


##### Exercise 4.2 #####

#Write a function that prints and identity matrix 




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


# ```read.delim()``` for Delimited Files

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
