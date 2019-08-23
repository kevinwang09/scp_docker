start = Sys.time()
source("./SingleCellPlus/qc.R")
source("./SingleCellPlus/scMerge.R")
source("./SingleCellPlus/downstream.R")
end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
