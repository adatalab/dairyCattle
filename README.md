# dairyCattle <img src="man/figures/logo.png" align="right" />
## Overview
A system for modeling and visualization the nutrient requirement of dairy cattle.

## Installation
```r
 # The development version from GitHub:
 # install.packages("remotes")
 remotes::install_github("adatalab/dairyCattle")
```

## Usage
### read_cattle
```r
 library(dairyCattle)
 read_cattle(path = "검정성적.xls", drop.zero = FALSE, add = FALSE)
```

### read_cattle_all
This function read the multiple xls files in the working directory.
```r
 setwd("Users/please/setting/the/working/directory")
 read_cattle_all()
```

### dim_my
A function for plotting the milk yield of the herd.
```r
df <- read_cattle(path = "검정성적.xls", drop.zero = TRUE, add = TRUE)
dim_my(data = df, grid = FALSE, line = TRUE, density = FALSE, text = FALSE)
```
<img src="man/figures/days_my_1.png" width=70%>

```r
dim_my(data = df, grid = TRUE, line = TRUE, density = FALSE, text = FALSE)
```
<img src="man/figures/days_my_2.png" width=70%>

```r
dim_my(data = df, grid = TRUE, line = TRUE, density = TRUE, text = FALSE)
```
<img src="man/figures/days_my_3.png" width=70%>

### mun_mp
A function for plotting the MUN-MP analysis.
```r
mun_mp(data = df, grid = FALSE, line = TRUE, density = TRUE, text = FALSE)
```
<img src="man/figures/mun_mp_1.png" width=70%>

```r
mun_mp(data = df, grid = TRUE)
```
<img src="man/figures/mun_mp_2.png" width=70%>

```r
library(gganimate)

mun_mp(data = df, grid = TRUE, line = TRUE, density = TRUE, text = FALSE) +
  labs(title = 'Date: {frame_time}', x = 'MUN', y = 'Milk protein') +
  transition_time(검정일) +
  ease_aes('linear')
```
<img src="man/figures/mun_mp_3.gif">

### mun_mp_tbl
A function for classification of the MUN-MP groups. It returns list of classified herd.
```r
mun_mp_tbl(data = df, dataframe = TRUE)
```


## fat_prot
A function for plotting the milk fat-protein analysis.
```r
fat_prot(data = df, grid = FALSE, line = TRUE, density = TRUE, text = FALSE)
```

## parturition
A function for time schedule for parturition of herd.
```r
parturition(df)
```

[Example Result](https://youngjunna.github.io/adatalab/parturition)


## Embedded dataset
```r
dairy_example
```

## Notification
개발중인 패키지입니다.

## Getting helps
Email: ruminoreticulum@gmail.com
