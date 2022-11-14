############### Introduction to R Programming ############################
###############    14.11.2022 / Ozancan Ozdemir ##########################
####### ODTÜ İstatistik ve Veri Bilimi Topluluğu & ODTÜ Biyogen ##########
########### Day 4 Exercise Solutions #####################################

##### Exercise 0.1  #####

plot(beer$Criminal,beer$At_Public,main="The relationship between criminal and 
     public attendance",xlab="Criminal",ylab="Public Attendance")


##### Exercise 0.2  #####
plot(x,y1,type="p",main="y1 vs x")


plot(x,y2,type="l",main="y2 vs x")


##### Exercise 0.3  #####

hist(beer$At_School,main = "Histogram of School Attendance",xlab="School Attendance")


hist(beer$At_Public,main="Histogram of Public Attendance",xlab = "Public Attendance")


##### Exercise 0.4 ###### 

barplot(table(beer$Region_Name))

##### Exercise 0.5 ###### 

boxplot(beer$Criminal~beer$Region_Name,main="Comparison of Criminals in terms of Regions")

################# ggplot exercises ###############



beer<-read.table("beerhall.txt",header=T,sep="\t")
head(beer)

##### Exercise 1.1  #####

ggplot(beer, aes(x=Criminal, y=At_Public)) + geom_point()

##### Exercise 1.2  #####
ggplot(beer, aes(x=Criminal, y=At_Public,color=Region_Code)) + 
  geom_point()+scale_color_gradient2(low = "yellow", high = "red")


##### Exercise 1.3  #####
ggplot(data, aes(x=x, y=y1)) + geom_line()+labs(title="y1 vs x")


ggplot(data, aes(x=x, y=y2)) + geom_line()+labs(title="y2 vs x")

##### Exercise 1.4 #####

ggplot(beer,aes(x=At_Public))+geom_histogram(bins=10,colour="yellow",fill="red")+
  labs(title="The distribution of Public Attendance")

##### Exercise 1.5 ######

ggplot(beer, aes(x=as.factor(Region_Name), y=Criminal)) + geom_boxplot( )+
  labs(title="Box plot of Criminal vs Region Name",x="Region Name", y = "Criminal")

##### Exercise 1.6 ######

ggplot(beer,aes(x=Region_Name))+geom_bar()
