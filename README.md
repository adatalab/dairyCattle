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

### mun_mp
A function for MUN-MP analysis
```r
df <- read_cattle(path="검정성적.xls", drop.zero=TRUE, add=TRUE) 
mun_mp(df)
```

## Notification
개발중인 패키지입니다.

## Getting helps
Email: ruminoreticulum@gmail.com
