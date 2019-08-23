start = Sys.time()
knitr::purl("/home/rstudio/SingleCellPlus/qc.Rmd")
knitr::purl("/home/rstudio/SingleCellPlus/scMerge.Rmd")
knitr::purl("/home/rstudio/SingleCellPlus/downstream.Rmd")

source("/home/rstudio/SingleCellPlus/qc.R")
source("/home/rstudio/SingleCellPlus/scMerge.R")
source("/home/rstudio/SingleCellPlus/downstream.R")
end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
