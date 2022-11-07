
############### Introduction to R Programming #######################
###############    31.10.2022 / Ozancan Ozdemir ##########################
####### ODTÜ İstatistik ve Veri Bilimi Topluluğu & ODTÜ Biyogen ##########

#### 0. First Steps... ####

# function_name(input_argument) -> How a typical R code looks like. 

#### 1. Fundamental Functions ####

### Press Ctrl + Enter to execute your code from R script. 

getwd() #to find out working directory

setwd("C:/Users/Ozancan/Desktop") #to set up your wd.

dir() #list the files in your working directory 

sessionInfo()

### Important for data analysis process.

##### A Powerful Calculator ######

#+	(summation)
#-	(substraction)
#*	(multiplication)
#/	(divison)
#^ or ** (taking power / exponentiation)
#x %% y	modulus (x mod y)
#log  (ln) 
#log10 (logarithm base 10)
#exp() (exponential power) 
#sqrt calculates the square root of number 

5+3 

5-3

7*8 

88/2 

5^2 

3**4

18%%4 # 18 (mod 4)

log(5) #ln

log10(1000) #log10

sqrt(4)


# Bonus 

pi

### Ctrl + L cleans your console 

##### Assigning a variable #####

x <- 5 

x <<-5 

x = 5

5 -> x 

5 ->> x 

## Mostly, we prefer x <- 5 or x = 5

## What to name variables

### Name should start with a letter
### Can continue with letters, numbers, dot or underline characters
### Case is important. That is a and A are different names

metu<-1956

stat<-1975

ozan<-1994

print(metu) #print displays your variable on the console

print(stat)

print(ozan)

ls() # to see which objects and functions are saved in the workspace
rm("ozan") # removes the object ozan from the workspace
rm(list=ls()) #removes everything in the workspace


##### Exercise 1 ######

## Calculate 2*4 - (2/7)  and 2*(4 -(2/7))



## Calculate 7^2 + (4*40/5) - 3 



## Calculate x^2 + 2x + 6 when x = 5 




####### Getting Help ###### 

?mean #or

help(mean)

#If you do not know the exact form of the command, you can get help using several ways. 

??mean

help.search("mean")


##### Installing Packages#####

### Download from CRAN 

## https://cran.r-project.org/web/packages/available_packages_by_name.html

install.packages()

install.packages("DamiaNN")

install.packages(dependencies = TRUE) #download the package with its dependencies

### Download from GitHub

devtools::install_github("DeveloperName/PackageName")

# or 

remotes::install_github("DeveloperName/PackageName")

remotes::install_github("ozancanozdemir/ggpowerbi")

##### Loading / Attaching Package #####

library()

library(ggplot2)

require()

require(ggplot2)

#### 2. Data/Object Types ####


### There are 5 main object types in R. 

# numeric  = (3, 11.6, 159786452)
# integer (1L, 11L, 999L, where the letter "L" declares this as an integer)
# complex (1+ 4i, where "i" is the imaginary part)
# character/string ("Ozancan", "FALSE", "11.11", "Galatasaray")
# logical/booleans (TRUE or FALSE) & (T or F) #sadece baş harfler

## Main difference between numeric and integer is 
## that integer type can contain only whole numbers, like 11
## numeric type can contain decimal numbers like 11.29.


## You can find out the object type by using class() function. 


adim <- "Ozancan"

class(adim)

adim_soyadim <- "Ozancan Ozdemir"

class(adim_soyadim)

yasim <- 28

class(yasim)

yasim_2 <- 28L

class(yasim_2)

denklem <- 4+8i

class(denklem)

karar <- TRUE

class(karar)

## You can change the class of your objects using as.type_name()

print(yasim_2)

yasim_3 <- as.numeric(yasim_2)

class(yasim_3)

as.character(yasim)

as.integer(adim) #returns NA

number_but_character <- "28"

print(number_but_character)

class(number_but_character)

as.numeric(number_but_character)

## You can check the class of your object by is.type_name()

is.integer(yasim)

is.character(adim)


#### Relational and Logical Operators ####

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

### They always return a boolean value. (TRUE or FALSE)


6 > 7

9 != 6

3<5&6>7

3<5|6>7
 
x <- 9 

x < 8

sq <- 1:10 # Create a sequence between 1 and 10.

print(sq)

class(sq)

sq[sq > 6] #return the values exceeds 6 in sq object.

#### 3. Creating Your Objects #### 

##### Sequence #####

### Sequences of numbers are used in many different tasks, 
### from plotting the axes of graphs to generating simulated data. 
### There are two ways to create a sequence of numbers in R.

#### The first way is to use : operator.


1:20 #a sequence from 1 to 20 with a default increment value 1

seq(1,10)#a sequence from 1 to 20 with a default increment value 1
#seq(the first value,the last value, the amount of increment)

#Another usage of this command is as follows;

seq(from = 1, to = 10)

#What if I'd like to have a sequence from 1 to 10 with increment 2?**

seq(1,10,2) 
#seq(the first value,the last value, the amount of increment)

###### Repeating your sequence #####


## rep(x) : replicates the values in x 

a<-seq(1,9,3)
a
rep(seq(1,9,3),4) #replicates the sequence itself 4 times.

#Also,

rep(a,4)

rep(seq(1,9,3),each=4) #replicates the numbers in the sequence 4 times

###### Exercise 3.1 #####

### Use  seq() function to generate the following sequence  9, 18, 27, 36, 45.

seq(9,45,9)

###### Exercise 3.2 #####

### Please create the following sequences 

##### a sequence from 0 to 9 and from 30 to 10.

0:9

seq(30,10,-1)

##### a sequence from 0 to 20 by 2 increments.

seq(0,20,2)

##### a sequence from 1 to 10 by 3 increments where each item is repeated 4 times. 

rep(seq(1,10,3),each =4)

##### a sequence from 1 to 10, repeating 4 times.

rep(seq(1,10,1),4)

##### Vectors #####

# Vectors are one-dimensional arrays that can hold numeric data, 
# character data, or logical data. 
# The concatenate function c() is used to form the vector. 

a <- c(1, 2.8, 5, 3, 6, -2, 4.6)

print(a)
class(a)

b <- c("one", "two", "three")

print(b)
class(b)

c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

print(c)
class(c)
 
metu<- c("odtu", 1956,  "yilinda","kuruldu")

print(metu)
class(metu)

###### Vector Manipulations #####

## Consider vector object named  a.

print(a)

#To find out length of the vector a

length(a)

#To check whether your object is vector or not 

is.vector(a)

#To extract 3rd entry of vector a 

a[3]

#To extract 1st,3rd and 5th entries of vector a

a[seq(1,5,2)]


#OR


a[c(1,3,5)]


#To remove 3rd entry of a vector a


a[-3]


#To remove 1st,3rd and 5th entries of vector a

a[-seq(1,5,2)] #OR


a[-c(1,3,5)]

#To display the elements in a not equal to 3 

a[a != 3]


#To display the elements in a at least 4

a[a>=4]

#To display your elements from smallest to largest 

sort(a)

#To display your elements from largest to smallest 

sort(a, decreasing = TRUE)

## Mathematical operations are applied to each element in the vector

#To calculate the elements in a as an exponential power

exp(a)

#To calculate logarithm 

log(a)

#To calculate the two times of each element in a

a*2

# Consider vector object called metu. 

print(metu)

#To extract the entry in metu equal to odtu

metu[metu == "odtu"]

#What is the index of odtu in metu vector? 

# which(): Give the TRUE indices of a logical object

which(metu=="odtu")



###### Exercise 3.3 #####

### Create the vector (0,1,1,2,3,5,8,13,21,34) 

vct <- c(0,1,1,2,3,5,8,13,21,34) 

#the third element 

vct[3]

#the first, the second and the third element 

vct[1:3]

#the elements 1,2,4 and 8  

vct[c(1,2,4,8)]

#what is the index of 34 in the vector? 

which(vct == 34)

#rearrange the vector so that the first element is the last one, 
#the second one is the second from the last, and so on. Naturally, the last one is the first one. 

vct[seq(length(vct),1,-1)]

#the elements corresponding to the odd-numbered indices 
#by using TRUE and FALSE logical values.

vct[1:length(vct)%%2 ==0]

#all the elements between 5 and 20.

vct[vct>=5 & vct<=20]

#all the elements smaller than 5 or greater than 20.

vct[vct<5 | vct>20]

###### Vector Operations ######

takim = c("Galatasaray","Fenerbahce","Besiktas")

gol = c(30,10,10)

rbind(takim,gol) #both objects must have the equal length

cbind(takim,gol)

##### Matrices ##### 

## A matrix is a two-dimensional array.
## Matrices are created with the matrix and c functions in general. 

mat1 <-matrix(1:6, nrow= 3, ncol=2)

# nrow = 3 represents number of row
# ncol = 2 represents number of column

mat1

class(mat1)

is.matrix(mat1)

mat2 <-matrix(1:6, ncol=2)
mat2

matrix(0,5,5) # 5x5 matrix with all 0 
 
matrix(1,4,4) # 4x4 matrix with all 1 

diag(1,4,4) # 4x4 identity matrix 

###### Matrix Manipulation and Operations ##### 

# matrix_name[row_index,column_index]

#Consider mat3

mat3 <- matrix(1:9,3,3)

print(mat3)

# To find out dimension of the matrix 

dim(mat3)

nrow(mat3) #returns number of row

ncol(mat3) #retunrs number of column

# To display first column 

mat3[,1]

# To display 2nd row

mat3[2,]

# To extract the e.g 2,1 th entry of matrix of mat3

mat3[2,1]

# To extract the first two rows and first two columns of mat3

mat3[c(1,2),c(1,2)]

# To change the entries 

mat3[1,] = c(1.1,4.4,7.7)
mat3

# To remove the 3rd column 

mat3[,-3]

# To remove the 1st row

mat3[-1,]

# To remove the entry on 1,1

mat3[1,1] <- NA

mat3

#We can assign names to rows and columns of a matrix. 

rownames(mat3)=c("istanbul","beyoglu","taksim")
colnames(mat3)=c("galata","saray","takimi")

print(mat3)

mat3["istanbul","galata"]

# Add new entries to your matrices 

m <- matrix(c(1,2,3,4) , 2,2,T)
m

m[ ,3] <- c(1,2) # No third column ! 

cbind(m , c(1, 2))
rbind(m , c(1, 2))

cbind(m , c(1, 2, 3))
rbind(m , c(1, 2, 3))

####### Algebraic Operations and details #######

A <- matrix(c( 6, 1, 0, -3,-1, 2),3, 2, byrow = TRUE)
print(A)
B <- matrix(c( 4, 2, 0, 1, -5, -1),3, 2, byrow = TRUE)
print(B)


A + B

A - B


A * B # this is component-by-component multiplication, not matrix multiplication


t(A) #take the transpose of the matrix

C<-matrix(c(2,4,2,8),nrow=2)
C

A%*%C #the matrix multiplication

det(C) #determinant of matrix 

solve (C) #take the inverse of the matrix

##### Arrays #####

# Arrays are similar to matrices but can have more than two dimensions.
# USAGE : myarray <- array(vector, dimensions, dimnames)
help(array)

myarray <- array(c(1:80), c(2, 5, 10))
myarray[1, 2:3, 5]
myarray[1, , ]

class(myarray[1, , ])


dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
z
z[, , "C4"]

thisarray <- c(1:24)
# Access all the items from the first row from matrix one
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray
multiarray[c(1), , 1]

2 %in% multiarray
32 %in% multiarray

which(2 %in% multiarray)

which(32 %in% multiarray)

dim(multiarray)
length(multiarray)

##### Data Frames #####

# Data Frames A data frame is more general than a matrix in that 
# different columns can contain different modes of data 
# (numeric, character, etc.). 

# They are the most common data structure you’ll deal with in R.

# Data frame object is created by data.frame(col1, col2, col3,.) function
# where col1, col2, col3, . are column vectors of any type (such as character, numeric, or logical). Names for each column can be provided with the names function.

patientID <- c(1, 2, 3, 4)

age <- c(25, 34, 28, 52)

diabetes <- c("Type1", "Type2", "Type1", "Type1")

level <- c(120,80,75,130)

stage <- c("Poor", "Improved", "Excellent", "Poor")

patientdata <- data.frame(patientID, age, diabetes, level, stage)
patientdata

class(patientdata) #check the class
 
is.data.frame(patientdata)#verify the object name 

str(patientdata) #shows the details of the function 

###### Data Frame Manipulations ###### 

# To extract the first two variables 

patientdata[1:2]

# To extract second and fourth patients information 

patientdata[c(2,4),]

# To extract columns with their names 

patientdata[c("diabetes", "stage")]

#or 

attach(diabetes)

# To extract the 3rd patients age 

patientdata[3,"age"]

patientdata[3,2]

# To replace an entry in data frame 

patientdata[3,2] = 27

# To extract observation based on condition

patientdata[patientdata$age>30,]

# To extract a specific variable 

patientdata$age #returns a vector object

patientdata$age[patientdata$age>30]

# Adding a new column 

patientdata$diab_index = patientdata$level/patientdata$age

print(patientdata)

# Adding more than one column 

patientpersonal <- data.frame(gender = c("Male",
                                          "Female",
                                          "Female","Male"),
                               status = c("Married","Single",
                                          "Single","Married"))
print(patientpersonal)

patientdata1 <- data.frame(patientdata,patientpersonal)

print(patientdata1)

patientpersonal1 <- data.frame(patientID  =  c(1, 2, 3, 4),
                              gender = c("Male",
                                         "Female",
                                         "Female","Male"),
                              status = c("Married","Single",
                                         "Single","Married"))

#If you create your vector in data frame, use = instead of <-

print(patientpersonal1)

patientdata2<-merge(patientdata,patientpersonal1,by ="patientID")

print(patientdata2)


##### Lists #####

### Lists are the most complex of the R data types. 
### Basically, a list is an ordered collection of objects (components). 
### A list allows you to gather a variety of (possibly unrelated) objects 
### under one name.

x <- c(6,8,10)
x
class(x)

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


information$birth_date <- ymd(information$birth_date)

information

###### Exercise 3.4 ###### 

## Convert birth_date columns in information1 and information2 
#to a date object

information1$birth_date <- ymd(information1$birth_date)

information2$birth_date <- dmy(information2$birth_date)

str(information1)

str(information2)

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

