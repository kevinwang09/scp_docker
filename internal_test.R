start = Sys.time()
knitr::purl("/home/rstudio/qc.Rmd")
knitr::purl("/home/rstudio/scMerge.Rmd")
knitr::purl("/home/rstudio/downstream.Rmd")

list.files("/home/rstudio/")
list.files("/home/rstudio/data")

source("/home/rstudio/qc.R")
source("/home/rstudio/scMerge.R")
source("/home/rstudio/downstream.R")
end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
