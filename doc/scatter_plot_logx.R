## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(fancyplots)
library(tidyverse)
library(gapminder)

## ----example1-----------------------------------------------------------------
library(fancyplots)
library(gapminder)
example1 <- filter(gapminder, continent == "Asia")
scatter_plot_logx(example1, "pop", "lifeExp")

## ----example2-----------------------------------------------------------------
library(fancyplots)
example2 <- filter(gapminder, year == 2007)
scatter_plot_logx(example2, "pop", "continent")

## ----example3-----------------------------------------------------------------
#adding NAs to rows 150-250
example1[150:250, ] <- NA

scatter_plot_logx(example1, "pop", "lifeExp", na.omit = TRUE)

## ----example4-----------------------------------------------------------------
scatter_plot_logx(example2, "pop", "continent", logx = FALSE)

