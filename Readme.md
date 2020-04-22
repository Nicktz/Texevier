
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Texevier

<!-- badges: start -->

<!-- badges: end -->

This package helps a user set up an Elsevier template for writing
academic journal reports in Rmarkdown. The setup requires very few lines
of code and will get you up and running in *a few seconds* (provided you
have all the relevent dependencies installed - see below), with a fully
working and good-to-go template.

Using Texevier you can simply start writing your paper / thesis / phd in
R, with a template guiding you through the most important aspects you
will encounter in your writing. Your template will look as follows:

![Screenshot](inst/ScreenShot/Example.PNG)

## Installation

Make sure you have the following installed on your computer:

  - [R](http://cran.r-project.org/bin/windows/base/)
  - [Rstudio](http://www.rstudio.com/)
  - [tinytex](https://yihui.name/tinytex/) by running:

<!-- end list -->

``` r
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()
```

Alternatively, you could install the full
[MikTex](http://miktex.org/download) version.

## Example

After installing all three at the top, simply run the following code:

    if (!require("devtools")) install.packages("devtools")
    library(devtools)
    devtools::install_github("Nicktz/Texevier")
    library(Texevier)
    # Input your directory as dir:
    dir <- "YOUR DIRECTORY HERE" # Ideally choose an empty folder.
    template_name = "Write_Up"
    create_template(directory = dir, template_name = template_name, build_project = TRUE, open_project = TRUE)

This will automatically install all the needed files and components in
the right places - allowing you to immediately focus on your paper. By
setting and `open_project = TRUE r`, a new project file will be created
in your chosen folder location, and opened with a new environment.

\<template\_name.Rmd\> file will be created in the directory provided,
which contains all the needed notes on how to write an academic paper in
R. See if all your tex installations are working by opening this file,
and hitting the knit button.

## Motivation

Doing research in R allows you to verify your work easily. This template
is designed to save the researcher time in terms of setting up a proper
template for doing formal research. This is something which could feel
daunting and can be time-consuming for even intermediate LaTeX and R
users. This package is intended to get you started in less than a
minute.

Feel free to edit the templates and use this as a starting point for
your own research.
