Introduction
============

This package helps a user set up an Elsevier template for writing academic journal reports in Rmarkdown. The setup requires very few lines of code and will get you up and running in *less than a minute* (provided you have all the relevent dependencies installed - see below), with a fully working and good-to-go template.

Using Texevier you can simply start writing your paper / thesis / phd in R.

<p>
<a href="http://Nicktz.github.io/Texevier"><img src="http://Nicktz.github.io/Texevier/inst/ScreenShot/ScreenShot.JPG" alt="Image Not Displayed"></a>
</p>
Dependencies Required
---------------------

Make sure you have the following installed on your computer:

-   R
-   RStudio
-   Latex (I suggest simply installing Miktex here: <http://miktex.org/download> )

Code
----

After installing all three at the top, simply run the following code:

``` r
if (!require("devtools")) install.packages("devtools")
require(devtools)
devtools::install_github("Nicktz/Texevier")
create_template(directory = "C:/Temp", template_name = "Template", launch_template = TRUE)
```

This will automatically install all the needed files and components, and allow you to start working with an Elsevier template in less than a minute.

A template.Rmd file will be opened automatically from the directory provided, which contains all the needed notes on how to write an academic paper in R. I recommend going through that for a good reference before you start working.

Motivation
----------

Doing research in R allows you to verify your work easily. This template is designed to save the researcher time in terms of setting up a proper template for doing formal research. This is something which could feel daunting and can be time-consuming for even intermediate LaTeX and R users. This package is intended to get you started in less than a minute.

Feel free to edit the templates and use this as a starting point for your own research.
