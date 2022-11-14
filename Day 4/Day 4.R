
############### Introduction to R Programming ############################
###############    14.11.2022 / Ozancan Ozdemir ##########################
####### ODTÜ İstatistik ve Veri Bilimi Topluluğu & ODTÜ Biyogen ##########


#### 0. Graphics in R #### 

# Graphs are a powerful way to present your data and results in a concise manner. 
# Whatever kind of data you have, there is a way to illustrate it graphically. 
# A graph is more readily understandable than words and numbers, and producing 
# good graphs is a vital skill. Some graphs are also useful in examining data 
# so that you can gain some idea of patterns that may exist; this can direct you
# toward the correct statistical analysis.

# R has powerful and flexible graphical capabilities. In general terms, 
# R has two kinds of graphical commands: some commands generate a basic plot of 
# some sort, and other commands are used to
# tweak the output and to produce a more customized finish.

##### Dot Plot ##### 

#It is a statistical chart consisting of data points plotted on a fairly simple scale. 
# It is usually used for small data sets and helps to observe unusual observations and 
# gaps etc. 

#plot(x)

# Let's consider mtcars dataset in R.


head(mtcars)

# Research Question 0

# How does mpg distribute over its range?

plot(mtcars$mpg)


##### Scatter Plot #####
# Scatter plots can help you identify the relationship between two data samples. 
# A scatter plot is a simple plot of one variable against another. 
# In order to draw a scatter plot, the following command is used.

# plot(x,y) #x is a rv, y is a rv 


# Research Question 1

#  What is the relationship between mpg values and hp (horsepower)?

plot(mtcars$hp,mtcars$mpg)


# Let's make this plot great again! 
  
###### Customizing the plot ######
  
# Adding axes names and title
  

plot(mtcars$hp,mtcars$mpg,xlab = "Horsepower",
     ylab="Miles Per Gallon",main="The relationship between hp and mpg")
#main command is used to add title into your plot
#xlab command is used to change the name of x axis
#ylab command is used to change the name of y axis



# Plotting and Coloring Symbols
  
# You can modify your basic scatter plot using pch and col command.


plot(mtcars$hp,mtcars$mpg,xlab = "Horsepower",
     ylab="Miles Per Gallon",main="The relationship between hp and mpg",pch=5)
#pch change the shape of dots in the plot.



plot(mtcars$hp,mtcars$mpg,xlab = "Horsepower",
     ylab="Miles Per Gallon",main="The relationship between hp and mpg",
     pch=5,col="red")
#pch change the shape of dots in the plot.


# Adding lines and Setting axis limits
  
# In order to add lines to your plots,

#abline(a = NULL, b = NULL, h = NULL, v = NULL...)
#a, b	the intercept and slope, single values.
#h	the y-value(s) for horizontal line(s).
#v	the x-value(s) for vertical line(s).

# To set axis limits


xlim = c(start, end)
ylim = c(start, end)

# You can use these to force a plot to be square, for example, or perhaps to ?zoom in? to a particular
# part of a plot or to emphasize one axis.


plot(mtcars$hp,mtcars$mpg,xlab = "Horsepower",
     ylab="Miles Per Gallon",main="The relationship between hp and mpg",
     pch=5,col="red",xlim=c(0,200),ylim=c(0,30))
abline(h=c(15,25),v=c(50,150))




##### Exercise 0.1  #####
  
  
# Please read beerhall.txt file. 
# Then, check whether you read it correctly or not using head(command)


beer<-read.table("beerhall.txt",header=T,sep="\t")
beer$Region_Name[4]<-"South_Eastern"



head(beer)


# What is the relationship between criminal and public attendance?
# Draw the scatter plot of criminal and public attendance.



##### Line Graph #####

# Line graph is used to look at the changes in variable over time or look at the 
# relationship between two variable. 

# In both cases, x axis corresponds to the independent variable(time, days etc), 
# y axis corresponds to the dependent variable(temperature, income etc). 

# The plot() function in R is used to create the line graph.


# Create the data for the chart.
rain <- c(7,12,28,3,41)




# Plot the bar chart.
plot(rain,type = "l")
#	type: defines the line type in ?plot?  function
#type = p Points only.
#type = b Points with line segments between.
#type = l Lines segments alone with no points.
#type = o Lines overplotted with points, that is, no gap between the line segments.
#type = c Line segments only with small gaps where the points would be.


# Let's make this plot great again!

#  You can use the same commands previously given to customize your line graph.


# Plot the bar chart.
plot(rain,type = "l", col = "red", xlab = "Month", ylab = "Rain fall",
   main = "Rain fall chart")
#main->add title
#xlab and ylab -> add label name
#col-> change the color of the line



#  Customizing your line types

#  You can use lty command to modify your line in the graph.


plot(rain,type = "l", col = "red", xlab = "Month", ylab = "Rain fall",
   main = "Rain fall chart",lty=3)
#More examples on lty: 
#lty= "solid"  or lty=1
#lty= "dashed"  or lty=2
#lty= "dotted"  or lty=3
#lty= "dotdash"  or lty=4
#lty= "longdash"  or lty=5
#lty= "twodash"  or lty=6



##### Exercise 0.2 #####

# Draw the following two related functions of x: y1 = 2 cos(x), y2 =0.5 * cos(x), 
# in the interval 0 < x< 2pi 


x<-seq(0,2*pi,0.01)
y1<-2*cos(x)
y2<-0.5*cos(x)




##### Histogram:#####

# Histograms display the distribution of a continuous variable by dividing up the range
# of scores into a specified number of bins on the x-axis and displaying the frequency of
# scores in each bin on the y-axis. You can create histograms with the function

# hist(x)  where x is a numeric vector of values.


# Consider mtcars dataset again.

# Research Question 2

# Can you identify the distribution of mpg variable in mtcars dataset visually?





# Let's make this plot great again!
  
# You can use the same commands previously given to customize your histogram.
  
  hist(mtcars$mpg,breaks=12, col="red", xlab="Miles Per Gallon", 
       main="Colored histogram with 12 bins")
#breaks option controls the number of bins.


##### Showing more than one plot in one window #####
  
# par(mfrow=c(row,column))


par(mfrow=c(1,2))
hist(mtcars$mpg)
hist(mtcars$mpg,breaks=12, col="red", xlab="Miles Per Gallon", 
     main="Colored histogram with 12 bins")



#  Additional Example:Histogram with density line


x <- mtcars$mpg
h<-hist(x,breaks=12,col="red",xlab="Miles Per Gallon",
        main="Histogram with normal curve and box")
xfit<-seq(min(x), max(x), length=40)
yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)


##### Exercise 0.3 ##### 

#  Consider beerhall.txt dataset again. 

# Draw the histogram of school attendance and public attendance. 
  


##### Bar plots ##### 

# Bar plots display the distribution (frequencies) of a categorical variable through 

# vertical or horizontal bars. In its simplest form, the format of the barplot() function is

#  barplot(table(height)) where table(height) is a vector or matrix.

# Research Question 3#

# Can you display which type of cylinder has the highest frequency in mtcars dataset?
  

counts<-table(mtcars$cyl) #table command creates a frequency table
counts

barplot(counts) #simple bar plot

barplot(counts,horiz = T) #simple horizontal bar plot


# Let's make this plot great again!

# You can use the same commands previously given to customize your barplot.


barplot(counts,main="Car Distribution", xlab="Number of Cylinder",
        ylab="Frequency of Cylinder",col=c("red","yellow","white"),
        legend = c(" 4=4cyl","6=6cyl","8=8cyl"))
#legend is used to add information box to your plot.


#  You can change the location of legend box using args.legend.


barplot(counts,main="Car Distribution", 
        xlab="Number of Cylinder",ylab="Frequency of Cylinder",
        col=c("red","yellow","white"),legend = c(" 4=4cyl","6=6cyl","8=8cyl"), 
        args.legend = list(x="topleft"))
#legend is used to add information box to your plot.


##### Exercise 0.4 ###### 

#  Consider beerhall.txt dataset again.

# Draw the bar plot of frequencies of Regions.
# Which region has the highest frequency?



##### Box plots #####

# A "box-and-whiskers"" plot describes the distribution of a 
# continuous variable by plotting its five-number summary: 
#the minimum, lower quartile (25th percentile), median (50th percentile), 
# upper quartile (75th percentile), and maximum. 
# It can also display observations that may be outliers 
# (values outside the range of ? 1.5*IQR, where IQR is the interquartile range 
# defined as the upper quartile minus the lower quartile). 


# Consider mtcars dataset.

# Research Question 4:#
# Is there any outlier in the mpg variable in mtcars dataset?


boxplot(mtcars$mpg)

# Let's make this plot great again!
  
# You can use the same commands previously given to customize your box plot.
  

boxplot(mtcars$mpg,main="The Box Plot of mpg",col="orange")

# Using parallel box plots to compare groups
  
# Research Question 5: # 
#Does weight(wt) of cars show a change in terms of type of engine (vs) ?
  

boxplot(mtcars$wt~mtcars$vs,
        main="Comparison of weights in terms of vs",col=c("red","yellow"))


# Box plots are very versatile. By adding notch=TRUE, you get notched box plots .


boxplot(mtcars$wt~mtcars$vs,
        main="Comparison of weights in terms of vs",col=c("red","yellow"),
        notch=TRUE)


# Additional Suggestion: You can search "Violin Plot in R" on Google.


##### Exercise 0.5 ######

# Construct the box plot of criminals for each regions.
  

##### Pie charts: ##### 

#Although pie charts are ubiquitous in the business world, they are denigrated by most
#statisticians, including the authors of the R documentation. They recommend bar or dot plots over pie charts because people are able to judge length more accurately than volume. Perhaps for this reason, the pie chart options in R are quite limited when
#compared with other statistical software.
#Pie charts are created with the function  pie(x, labels) 
# where x is a non-negative numeric vector indicating the area of each slice and labels provides a character vector of slice labels.


par(mfrow=c(2, 2))
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany")
pie( slices, labels = lbls,
     main="Simple Pie Chart")



library(plotrix)
pie3D(slices, labels=lbls,explode=0.1,
      main="3D Pie Chart ")


##### Quantile-Quantie Plot (QQ Plot) ##### 

#The Q-Q plot, or quantile-quantile plot, is a graphical tool to help us assess 
#if a set of data plausibly came from some theoretical distribution 
# such as a Normal or exponential.
# For this lab, we are only interested in assessing if a set of data plausibly 
# came from Normal distribution. You can look at how it is used for the other distributions.


x<-rnorm(100,2,4)
y<-rpois(100,5)



par(mfrow=c(1,2))
qqnorm(x) #help us to draw Normal qq plot
qqline(x) # to add theoretical line
qqnorm(y) #help us to draw Normal qq plot
qqline(y) # to add theoretical line


#### 1.What is ggplot2? #####

# ggplot2 is a plotting system for R, based on the grammar of graphics, 
# which tries to take the good parts of base and lattice graphics and 
# none of the bad parts. 

# It takes care of many of the fiddly details that make plotting a hassle 
# (like drawing legends) as well as providing a powerful model of 
# graphics that makes it easy to produce complex multi-layered graphics.

# To get more information about this special packages, 
# you can visit  [http://ggplot2.org/]

# Also, there are many videos, books and pages related to this packages. 

# The ggplot2 implies "Grammar of Graphics" which believes in the principle that 
# a plot can be split into the following basic parts 
  
#  Plot = data + Aesthetics + Geometry

#  data refers to a data frame (dataset).

#  Aesthetics indicates x and y variables. It is also used to tell R 
# how data are displayed in a plot, e.g. color, size and shape of points etc.

#  Geometry refers to the type of graphics (bar chart, histogram, box plot, 
# line plot, density plot, dot plot etc.)

#  Why ggplot2 is better?
  
# Excellent themes can be created with a single command. 

# Its colors are nicer and more pretty than the usual graphics. 

# Easy to visualize data with multiple variables. 

# Provides a platform to create simple graphs providing plethora of information.


  
  
install.packages("ggplot2") #ggplot2 is for the graphical representation

install.packages("gcookbook")#gcookbook is for some special data sets


library(ggplot2) #calling ggplot2 library
library(gcookbook)#calling gcookbook library


###### Scatter Plot #####  

qplot(mtcars$wt, mtcars$mpg) #first way


qplot(wt, mpg, data=mtcars) 

# Another way 

ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() #suggested way
#geom_point function creates your plot as scatter plot


##### Exercise 1.1 #####

# What is the relationship between criminal and public attendance?
# Draw the scatter plot of criminal and public attendance.



# Adding Label Names and Titles

# To add title and label names into your plot, labs command is used. Consider the previous plot.

ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point()+labs(title="Scatter plot of wt and mpg",x="wt", y = "mpg") 
#title is used to add title
#x change the name of x axes
#y change the name of y axes


# The  labs command can be used not only scatter plot, but also other plots to add title etc.

# Drawing scatter plot of two continious variables conditioned on one categorical variables

head(mtcars)

table(mtcars$cyl) #produces frequency table

ggplot(data = mtcars,aes(x = mpg,y = disp,colour = factor(cyl))) + 
  geom_point()+labs(title="Scatter plot of wt and mpg with respect to cylinder",
                    x="wt", y = "mpg") 


# Changing Color Scale in Legend


library(ggplot2)
c <- ggplot(mtcars,aes(x = mpg, y = disp, color = cyl))  + geom_point()
c + scale_color_gradient2(low = "yellow", high = "red")


# When you use scale_color_gradient2 command, do not use factor() for coloring your plot.

# Drawing Multiple Scatter Plot

# By using facet_wrap command, you can easily produce multiple scatter plot.


ggplot(data = mtcars,aes(x = mpg,y = disp)) + 
  geom_point()+labs(title="Scatter plot of wt and mpg with respect to cylinder",
                    x="wt", y = "mpg")+facet_wrap("cyl")

##### Exercise 1.2 #####

# Consider beer dataset Then, 
# plot the relationship between between criminal and public attendance 
# conditioned on region code.






##### Line Plot #####


# Let's consider pressure data set being available in R.


head(pressure) #shows first 6 observations

qplot(pressure$temperature, pressure$pressure, geom="line")


qplot(temperature, pressure, data=pressure, geom="line") #with label name


#Another way 


ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() #geom_line converts your plot into line plot


ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point() #to add points


##### Exercise 1.3 ######

# Draw the following two related functions of x: y1 = 2 cos(x), y2 =0.5 * cos(x),
# in the interval 0 $\leq$ x$\leq$ 2$\pi$. 

#(Hint: To draw these plots, you have to create a new dataset using data.frame function.)


x<-seq(0,2*pi,0.01)
y1<-2*cos(x)
y2<-0.5*cos(x)
data<-data.frame(x,y1,y2)



##### Histogram #####
 
qplot(mtcars$mpg)

library(ggplot2)
qplot(mpg, data=mtcars) 


# Another way

ggplot(mtcars, aes(x=mpg)) + 
  geom_histogram()#geom_histogram converts your plot into histogram


ggplot(mtcars, aes(x=mpg)) + 
  geom_histogram(binwidth=4)#binwidth arranges the number of bin


#Some Details for Histogram


ggplot(mtcars,aes(x=mpg))+geom_histogram(bins = 4,colour="red",fill="yellow")
#bins arrange the number of bins in the histogram
#fill fills inside of histogram
#colour defines the color of frame

#Drawing Multiple Histogram

#By using facet_wrap command, you can easily produce multiple histogram.


ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 4,colour="red",fill="yellow")+
  facet_wrap("cyl")


##### Exercise 1.4 #####

# Draw the histogram of public attendance.


##### Box Plot #####

qplot(as.factor(mtcars$cyl),mtcars$mpg,geom = "boxplot")


qplot(as.factor(cyl),mpg,data=mtcars,geom="boxplot")


# Another way


ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_boxplot( )



#Customizing Box Plot
  
ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_boxplot(outlier.colour="red", 
outlier.shape=8,outlier.size=4,fill="yellow",colour="red")+
  labs(title="Box plot of mpg wrt cyl",x="cyl", y = "mpg")+ theme_classic()



# Notched Box Plot
  
ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_boxplot(notch=TRUE)


# Violin Box Plot
  
ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_violin()
ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_violin(fill="yellow",colour="red")

##### Exercise 1.5 ######

# Draw the boxplot of the criminals for each region.
  


##### Bar Plot #####


ggplot(mtcars, aes(x=cyl)) + geom_bar(stat = "count")



# Customize your plot


ggplot(mtcars, aes(x=cyl)) + geom_bar(fill="red",col="yellow")
ggplot(mtcars,aes(x=cyl))+geom_bar(fill=c("yellow","blue","red"))
ggplot(mtcars,aes(x=cyl))+geom_bar(fill=c("yellow","blue","red"))+
  labs(title="Bar plot of cyl",x="number of cyl")


#Drawing Bar Plot of numerical variable with respect to Levels of 
# one categorical variable

library(gcookbook)
BOD
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat="identity")# Convert Time to a discrete (categorical) variable with factor()
ggplot(BOD, aes(x=factor(Time), y=demand))+geom_bar(stat="identity", 
fill="lightblue", colour="black")


##### Exercise 1.6 #####

# Consider beerhall.txt dataset again. 

# Construct a bar chart for the frequencies of Regions. Which region has the highest frequency?





##### Quantile-Quantile Plot #####


qplot(sample = mpg, data = mtcars)


ggplot(mtcars, aes(sample=mpg))+stat_qq()


ggplot(mtcars, aes(sample=mpg))+stat_qq(col="red") #with red color


# Change qq plot colors by groups

ggplot(mtcars) +stat_qq(aes(sample = mpg, colour = factor(cyl)))


# NOTE: In ggplot, we cannot directly add normality line on the plot, however there are many functions written for this purpose on the internet and you can easily find them by asking "Uncle Google".

##### Pie Chart #####

# To draw a pie chart in ggplot2, you have to create a bar plot at first. Then, you should convert your bar plot into pie chart.


df<-data.frame(slices=c(10, 12,4, 16, 8),labels=c("US", "UK", "Australia", "Germany", "France"))
df
#Use a barplot to visualize the data :
library(ggplot2)
# Barplot
bp<- ggplot(df, aes(x="", y=slices, fill=labels))+geom_bar(width = 1, stat = "identity")
bp#ggplot2 pie chart for data visualization in R software
#Create a pie chart :
bp + coord_polar("y", start=0)


### For more examples for ggplot2

# https://bookdown.org/ozancanozdemir/introduction-to-ggplot2/ 


### For a document for R Markdown

# https://ozancanozdemir.github.io/markdownforclassreports.pdf