start = Sys.time()
setwd("/home/rstudio/")
knitr::purl("/home/rstudio/qc.Rmd", output = "/home/rstudio/qc.R")
knitr::purl("/home/rstudio/scMerge.Rmd", output = "/home/rstudio/scMerge.R")
knitr::purl("/home/rstudio/downstream.Rmd", output = "/home/rstudio/downstream.R")

list.files("/home/rstudio/")

# source("/home/rstudio/qc.R")
# source("/home/rstudio/scMerge.R")
# source("/home/rstudio/downstream.R")

# rmarkdown::render("/home/rstudio/qc.Rmd")
# rmarkdown::render("/home/rstudio/scMerge.Rmd")
# rmarkdown::render("/home/rstudio/downstream.Rmd")
end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
