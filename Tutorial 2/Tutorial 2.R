library(tidyverse)
library(ggplot2)


data <- read.csv("Tutorial 2/Cars_data.csv")

data$Make <- as.factor(data$Make)
data$Year <- as.factor(data$Year) #Year as Factor, as scale is problematic. Maybe 'Age' would be a better integer variable?
data$Engine.Fuel.Type <- as.factor(data$Engine.Fuel.Type)
data$Engine.Cylinders <- as.factor(data$Transmission.Type)
data$Driven_Wheels <- as.factor(data$Driven_Wheels)
data$Market.Category <- as.factor(data$Market.Category)
data$Vehicle.Size <- as.factor(data$Vehicle.Size)
data$Vehicle.Style <- as.factor(data$Vehicle.Style)


#Other, much quicker way of doing this
data <- data %>% 
  mutate_if(is.character, as.factor)

#Removing a variable
data$Model <- NULL #IDK this seems stupid to do IMO, I see no real reason to delete. I guess it has too many levels. Like 915 or something.

#Partitioning the data
set.seed(42)
n <- dim(data)[1]
train_ind <- sample(1:n, n*0.7)

train_data <- data[train_ind,]
test_data <- data[-train_ind,]

#Showing the distribution
hist(data$MSRP, breaks= 1000, xlim = c(0, 250000))



