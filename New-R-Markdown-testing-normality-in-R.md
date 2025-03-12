---
title: "Normality Testing in R"
author: "Dr. Lindokuhle Dlamini"
date: "12 March 2025"
output:
  html_document:
    css: "styles.css"
    keep_md: true
    self_contained: false
---
h1.title, .author, .date {
    display: none;
}




<header>
    <h1 class="title">Normality Testing in R</h1>
    <p>Visual and Statistical Approaches for Checking Normality</p>
    <h4 class="author"><em>Dr Lindokuhle Dlamini</em></h4>
    <h4 class="date"><em>12 March 2025</em></h4>
</header>
## Introduction
This document outlines the process for performing normality testing in R using visual and statistical methods. The dataset used here is based on plant richness.

## 1. Loading the Dataset

``` r
getwd()
```

```
## [1] "G:/My Drive/Rhodes/2025/Honours 2025/Intro to R Hons 2025"
```

``` r
setwd("G:/My Drive/Rhodes/2025/Honours 2025/Intro to R Hons 2025")
library(readxl)
```

```
## Warning: package 'readxl' was built under R version 4.4.3
```

``` r
library(tidyverse)
```

```
## Warning: package 'tidyverse' was built under R version 4.4.3
```

```
## Warning: package 'ggplot2' was built under R version 4.4.3
```

```
## Warning: package 'tibble' was built under R version 4.4.3
```

```
## Warning: package 'tidyr' was built under R version 4.4.3
```

```
## Warning: package 'readr' was built under R version 4.4.3
```

```
## Warning: package 'purrr' was built under R version 4.4.3
```

```
## Warning: package 'dplyr' was built under R version 4.4.3
```

```
## Warning: package 'stringr' was built under R version 4.4.3
```

```
## Warning: package 'forcats' was built under R version 4.4.3
```

```
## Warning: package 'lubridate' was built under R version 4.4.3
```

```
## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
## ✔ dplyr     1.1.4     ✔ readr     2.1.5
## ✔ forcats   1.0.0     ✔ stringr   1.5.1
## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
## ✔ purrr     1.0.4     
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
library(ggplot2)
Independent_t_test <- read_excel("Independent t test.xlsx")

data2025 <- Independent_t_test  # Renaming the dataset for ease of use
View(data2025)
```

## 2. Visual Normality Testing
### 2.1 Histogram

``` r
# Histogram
hist(data2025$`Plant richness`)
```

![](New-R-Markdown-testing-normality-in-R_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

### 2.2 Enhanced Histogram with Normal Distribution Curve

``` r
# Enhanced Histogram with normal curve
hist(data2025$`Plant richness`, 
     probability = TRUE,  
     col = "lightblue",   
     main = "Histogram with Normal Distribution", 
     xlab = "Plant Richness", 
     border = "black", 
     ylim = c(0, 0.100))

curve(dnorm(x, mean = mean(data2025$`Plant richness`), 
            sd = sd(data2025$`Plant richness`)), 
      col = "red", lwd = 3, add = TRUE)
```

![](New-R-Markdown-testing-normality-in-R_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

### 2.3 Density Plot using ggplot2

``` r
# Density plot using ggplot2
ggplot(data = data2025, aes(x = `Plant richness`)) + 
  geom_density() + theme_classic()
```

![](New-R-Markdown-testing-normality-in-R_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

### 2.4 Density Plot using Base R

``` r
# Density plot in base R
density_plot <- density(data2025$`Plant richness`)
plot(density_plot, 
     main = "Density Plot of Plant Richness", 
     xlab = "Plant Richness", 
     ylab = "Density", 
     col = "blue", 
     lwd = 2)
```

![](New-R-Markdown-testing-normality-in-R_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

### 2.5 Q-Q Plot

``` r
# Q-Q plot
qqnorm(data2025$`Plant richness`)
qqline(data2025$`Plant richness`, col = "red")
```

![](New-R-Markdown-testing-normality-in-R_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

## 3. Statistical Normality Testing
### 3.1 Shapiro-Wilk Test

``` r
# Shapiro-Wilk Test
shapiro.test(data2025$`Plant richness`)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  data2025$`Plant richness`
## W = 0.97208, p-value = 0.5974
```

### 3.2 Kolmogorov-Smirnov Test

``` r
# Kolmogorov-Smirnov Test
ks.test(data2025$`Plant richness`, "pnorm", mean = mean(data2025$`Plant richness`), sd = sd(data2025$`Plant richness`))
```

```
## Warning in ks.test.default(data2025$`Plant richness`, "pnorm", mean =
## mean(data2025$`Plant richness`), : ties should not be present for the
## one-sample Kolmogorov-Smirnov test
```

```
## 
## 	Asymptotic one-sample Kolmogorov-Smirnov test
## 
## data:  data2025$`Plant richness`
## D = 0.11699, p-value = 0.8061
## alternative hypothesis: two-sided
```

## Footer
<style>
    body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    header {
        background-color: #628554;
        color: #fff;
        text-align: center;
        padding: 10px;
    }
    h1, h2, h3, h4, h5, h6 {
        color: #333;
    }
    code {
        background-color: #d3f5e0;
        padding: 5px;
        border-radius: 3px;
        font-family: monospace;
    }
    pre {
        background-color: #f0f0f0;
        padding: 10px;
        border-radius: 5px;
        overflow-x: auto;
    }
    footer {
        text-align: center;
        padding: 10px;
        background-color: #d5e8cc;
        color: #fff;
        position: fixed;
        width: 100%;
        bottom: 0;
    }
</style>

<footer>
    <p>&copy; 2025 Dr. Lindokuhle Dlamini</p>
</footer>
