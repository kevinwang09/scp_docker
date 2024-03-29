# DO NOT EDIT 'install.R'; instead, edit 'install.R.in' and
# use 'rake' to generate 'install.R'.

if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")
#install.packages("devtools", repos="https://cran.rstudio.com")
#devtools::install_github("Bioconductor/BiocManager")
library(BiocManager)

if(BiocManager::version() != "3.10"){
    BiocManager::install(version="3.10",
                         update=TRUE, ask=FALSE)
}

builtins <- c(
	"scMerge", "devtools", 
	"DropletUtils", "edgeR",
	"ggpubr", "MAST", 
	"plyr", "Rtsne", 
	"scales", "scater", 
	"scran", "tidyverse", 
	"viridis", "monocle",
	"DescTools",
	"SydneyBioX/scdney")

for (builtin in builtins)
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        suppressWarnings(BiocManager::install(builtin,
                                              version="3.10",
                                              update=TRUE, ask=FALSE))