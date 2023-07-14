
### Convert gene symbol into ensembl id
library(biomaRt)
ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")

#all = file with gene symbols in
genetypes = getBM(attributes = c('ensembl_gene_id', 'gene_biotype'), 
                  filters = 'ensembl_gene_id', 
                  values = all.df2$symbol, 
                  mart = ensembl)

#get gene types based on ensembl id e.g. coding, miRNA etc.
alldfnona$genetype <- getBM(attributes = c('ensembl_gene_id', 'gene_biotype'), 
                             filters = 'ensembl_gene_id', 
                             values = alldfnona$symbol, 
                             mart = ensembl)
