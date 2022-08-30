# John @ Focyte created 30/08/2022 v.1.1
# Script converts ENSEMBL IDs to gene symbol names

### Load required packages

BiocManager::install("org.Hs.eg.db")
BiocManager::install("AnnotationDbi")
library("org.Hs.eg.db")

### Load example data from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE149204 
### GSE149204_Nanopore_sequencing_readcounts.txt

counts.df <- as.data.frame("GSE149204_Nanopore_sequencing_readcounts.txt")
counts.df2 <- counts.df[,-1]
rownames(counts.df2) <- counts.df[,1]
counts.df2$symbol <- mapIds(org.Hs.eg.db, keys = rownames(counts.df2), keytype = "ENSEMBL", column = "SYMBOL")
write.csv(counts.df2,"counts.csv")
