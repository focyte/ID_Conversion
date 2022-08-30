# John @ Focyte created 30/08/2022 v.1.1
# Script converts ACCNUM IDs to gene symbol names

# If needed, this is how to install BiocManager to load the required packages below
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.15")

# Load required packages

BiocManager::install("org.Hs.eg.db")
BiocManager::install("AnnotationDbi")
library("org.Hs.eg.db")

### Load example data from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE52530
### GSE52530_HeLa.expData.txt.gz
counts.df <- read.table("GSE52530_HeLa.expData.txt", header = FALSE, sep = "", dec = ".")
counts.df <- as.data.frame(counts.df)

# Convert the ACCNUM IDs into the row names
counts.df2 <- counts.df[,-1]
rownames(counts.df2) <- counts.df[,1]

# Convert ENSEMBL to Symbol IDs and write the file to working directory
counts.df2$symbol <- mapIds(org.Hs.eg.db, 
                           keys = as.character(rownames(counts.df2)), 
                           keytype = "ACCNUM", 
                           column = "SYMBOL",
                           multiVals = "first")
write.csv(counts.df2,"counts.csv")

