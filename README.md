# dairyCattle <img src="man/figures/logo.png" align="right" />
## Overview
A system for modeling the nutrient requirement of dairy cattle.

## Installation
```r
 # The development version from GitHub:
 # install.packages("devtools")
 devtools::install_github("adatalab/dairyCattle")
```

## Usage
### read_cattle
```r
 library(dairyCattle)
 read_cattle(path="검정성적.xls", drop.zero=FALSE, add=FALSE)
```

### days_my
A function for analysis the milk yield of the herd.
```r
df <- read_cattle(path = "검정성적.xls", drop.zero = TRUE, add = TRUE)
days_my(data = df, grid = FALSE, line = TRUE, density = FALSE)
```
<img src="man/figures/days_my_1.png">

```r
days_my(data = df, grid = TRUE, line = TRUE, density = FALSE)
```
<img src="man/figures/days_my_2.png">

```r
days_my(data = df, grid = TRUE, line = TRUE, density = TRUE)
```
<img src="man/figures/days_my_3.png">

### mun_mp
A function for MUN-MP analysis.
```r
mun_mp(data = df, grid = FALSE)
```
<img src="man/figures/mun_mp_1.png">

```r
mun_mp(data = df, grid = TRUE)
```
<img src="man/figures/mun_mp_2.png">

```r
library(gganimate)

mun_mp(data = df, grid = TRUE) +
  labs(title = 'Date: {frame_time}', x = 'MUN', y = 'Milk protein') +
  transition_time(검정일) +
  ease_aes('linear')
```
<img src="man/figures/mun_mp_3.gif">

## Embedded dataset
```r
dairy_example
```

## Notification
개발중인 패키지입니다.

## Getting helps
Email: ruminoreticulum@gmail.com
