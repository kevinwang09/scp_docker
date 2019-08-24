start = Sys.time()
knitr::purl("./qc.Rmd", output = "./qc.R")
knitr::purl("./scMerge.Rmd", output = "./scMerge.R")
knitr::purl("./downstream.Rmd", output = "./downstream.R")

source("./qc.R")
source("./scMerge.R")
source("./downstream.R")
end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
