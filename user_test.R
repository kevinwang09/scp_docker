start = Sys.time()
source("./qc.R")
source("./scMerge.R")
source("./downstream.R")
end = Sys.time()

message("The test completed in ", round(end - start, 2), " mins! You are good to go!")
