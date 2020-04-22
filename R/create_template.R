#' @title create_template
#' @description This function builds a template directory  with all the necessary files, as well as a rmarkdown script which is ready to edit.
#' The result is an Elsevier ready document that conforms to most academic journal standards.
#' In the directory folder provided, the user will have the tex files, as well as all relevant figure folders created in R upon knitting the rmarkdown file.
#' I strongly recommend working in a .Rproj environment, and thus recommend setting build_project to TRUE (as default). Using open_project will open the new project in a new session.
#' The Tex files should not be renamed or moved.
#' Prior to submitting a paper, the user should zip the template_name.tex file, together with the figure files and Tex folder, and send it through to journal editors.
#' Feel free to edit any of the settings in the template_name.tex file to conform to particular preferences (e.g. setting margins, etc.)
#' @importFrom rmarkdown render
#' @importFrom rstudioapi openProject
#' @param directory A character string with the target folder directory.
#' This folder will be created if it does not already exist, and you will be prompted if the folder already exists. In this case, it will create a subfolder within the existing folder. By default, it will save to a temporary directory.
#' @param template_name The folder, as well as the rmarkdown template, will be given this name.
#' @param bib.file If left blank, the default bib file will be used. This can be a user specified bib file. Should be the full path for the file (e.g. C:/Example/Bibfile.bib)
#' @param build_project Create .Rproj file in your provided location.
#' @param open_project Open project after running this function.
#' @examples
#' \dontrun{
#' create_template(directory = tempdir(), template_name = "Write_Up",
#' build_project = TRUE, open_project = TRUE)
#' }
#'
#' @export

create_template <- function (directory = tempdir(), template_name, bib.file, build_project = TRUE, open_project = TRUE){

  if (missing(template_name)) {
    template_name <- "Template"
  }

  if ( file.exists(file.path(directory, template_name)) ) {
    answer <- readline(cat("--------------- \n PROMPT: \n \n Path: ",
                           file.path(directory, template_name), " provided already exists. \n Proceed to create template in this folder? Type: Y or N....\n"))
    while (!(answer %in% c("Y", "y", "N", "n"))) {
      answer <- readline(cat("--------------- \n PROMPT: \n---------------\n Invalid input, please type Y in order to create template folder in path: ",
                             file.path(directory, template_name), " OR type N to quit \n"))
    }
    if (answer %in% c("Y", "y")) {
      cat(paste0("Creating research folder in: ", file.path(directory, template_name)) )
      Sys.sleep(1)
    } else {
      return(cat("\n\nTemplate folder not created - Please choose an alternative, preferably empty, directory.\n\n"))
    }
  } else {
    mkdirs <- function(fp) {
      if (!file.exists(fp)) {
        mkdirs(dirname(fp))
        dir.create(fp)
      }
    }
    if(!dir.exists( file.path( directory, template_name) )) mkdirs( file.path(directory, template_name))
  }

  dir.create(file.path(directory, template_name, "Tex"), showWarnings = FALSE)
  dir.create(file.path(directory,  template_name, "code"), showWarnings = FALSE)
  dir.create(file.path(directory,  template_name, "data"), showWarnings = FALSE)

  if(build_project){

    writeLines("Version: 1.0\n\nRestoreWorkspace: Default\nSaveWorkspace: Default\nAlwaysSaveHistory: Default\n\nEnableCodeIndexing: Yes\nUseSpacesForTab: Yes\nNumSpacesForTab: 4\nEncoding: UTF-8\n\nRnwWeave: Sweave\nLaTeX: pdfLaTeX\n\nStripTrailingWhitespace: Yes",
               paste0(file.path( directory, template_name), "/", template_name, ".Rproj"))

  }


  if (!missing(bib.file) && !file.exists(bib.file)) {
    stop(cat(paste0("\n bib file: \n", bib.file, " \n does not exist. Leave this parameter blank to create default .bibfile, or check the bib.file provided exists.")))
  }

  # Create bib files
  if (!missing(bib.file)) {
    bib <- readLines(bib.file)
  } else {
    bib <- readLines(system.file("templates/ref.txt", package = "Texevier"))
  }
  cat(bib, file=paste0(file.path(directory,  template_name, "Tex"), "/ref.bib"), sep="\n")
  cat(readLines(system.file("templates/EconEJ.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "Tex"), "/EconEJ.bst"), sep="\n")
  cat(readLines(system.file("templates/packages.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "Tex"), "/packages.txt"), sep="\n")
  cat(readLines(system.file("templates/TexDefault.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "Tex"), "/TexDefault.txt"), sep="\n")
  cat(readLines(system.file("templates/Example_Plot_Scatter.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "code"), "/Example_Plot_Scatter.R"), sep="\n")
  cat(readLines(system.file("templates/Data_Create.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "code"), "/Data_Create.R"), sep="\n")
  cat(readLines(system.file("templates/elsevier-harvard.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "Tex"), "/elsevier-harvard.csl"), sep="\n")
  cat(readLines(system.file("templates/harvard1.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "Tex"), "/harvard1.csl"), sep="\n")
  cat(readLines(system.file("templates/harvard-stellenbosch-university.txt", package = "Texevier")), file=paste0(file.path(directory,  template_name, "Tex"), "/harvard-stellenbosch-university.csl"), sep="\n")
  # Create Rmd template file:
  template_name <- gsub(".Rmd", "", template_name)
  cat( readLines(system.file("templates/write_up_template.txt", package = "Texevier")), file = paste0(file.path(directory, template_name), "/", template_name, ".Rmd"), sep="\n")

  cat("\n\n=====================\n\n  TEMPLATE FOLDER BUILD SUCCESSFUL at ", file.path(directory), "\n\n=====================\n\nProceed to edit your template located in ", paste0(file.path(directory, template_name), "/", template_name, ".Rmd"),"\nTest if you can knit the Rmd into a pdf by knitting the file (e.g. press Cntrl + Shift + K in Windows, find the knit button in Rstudio) into a pdf. A viewer will then appear showing the new pdf just built.\n      \nVisit http://rmarkdown.rstudio.com/ for tips on writing in R.")

  if(open_project) rstudioapi::openProject( paste0( file.path( directory, template_name), "/", template_name, ".Rproj"), newSession = TRUE)

}

