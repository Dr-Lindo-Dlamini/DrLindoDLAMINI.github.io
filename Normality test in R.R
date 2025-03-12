#Renaming the data imported using "import dataset" under file in the "Plots & Packages" space

getwd()
setwd("G:/My Drive/Rhodes/2025/Honours 2025/Intro to R Hons 2025")
library(readxl)
library(tidyverse)
library(ggplot2)
Independent_t_test <- read_excel("Independent t test.xlsx")

data2025 <- Independent_t_test #renaming the dataset to data2025 for ease of use 
View(data2025)

##NORMALITY TESTING USING VISUALS 
#Visual Inspection:
#Histogram: You can plot a histogram to visually inspect the distribution.

hist(data2025$`Plant richness`)

#Histo 2 with bell shape

hist(data2025$`Plant richness`, 
     probability = TRUE,  # To scale the histogram to show probabilities
     col = "lightblue",   # Color of the histogram bars
     main = "Histogram with Normal Distribution", 
     xlab = "Plant Richness", 
     border = "black", 
     ylim = c(0, 0.100))   # Adjust the y-axis to ensure the curve fits

# Add a red line for the normal distribution curve
curve(dnorm(x, mean = mean(data2025$`Plant richness`), sd = sd(data2025$`Plant richness`)), 
      col = "red", 
      lwd = 3, 
      add = TRUE)  # add = TRUE overlays the curve on the histogram
#You can also plot a DENSITY PLOT 
###using ggplot2, just one line of code

ggplot(data = data2025, aes(x = `Plant richness`)) + geom_density() +theme_classic()

# Create the density object in base R
density_plot <- density(data2025$`Plant richness`)

# Plot the density plot
plot(density_plot, 
     main = "Density Plot of Plant Richness", 
     xlab = "Plant Richness", 
     ylab = "Density", 
     col = "blue",   # Color of the density curve
     lwd = 2)        # Line width

#Q-Q Plot: This is a more formal method for visual inspection of normality.

qqnorm(data2025$`Plant richness`)
qqline(data2025$`Plant richness`, col = "red")


########## NORMALITY TEST STATISTICALLY####
###############################################
#Shapiro-Wilk Test
#The Shapiro-Wilk test is one of the most popular tests for normality. 
#It tests the null hypothesis that the data is normally distributed.

shapiro.test(data2025$`Plant richness`)
###############################################
# Kolmogorov-Smirnov Test
#This test compares the sample distribution with a reference distribution (such as the normal distribution).

ks.test(data2025$`Plant richness`, "pnorm", mean = mean(data2025$`Plant richness`), sd = sd(data2025$`Plant richness`))

