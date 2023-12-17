# Gene Conversion and Annotation Scripts

This repository contains three R scripts for gene-related data conversion and annotation. These scripts are designed to provide a convenient way to convert gene identifiers and retrieve additional information from public databases.

## Scripts

### 1. ACCNUM_to_SYMBOL.r

This script takes a file containing ACCNUM IDs and converts them to gene symbol names using the org.Hs.eg.db package. It is particularly useful for gene expression data processing.

#### Usage

```bash
Rscript ACCNUM_to_SYMBOL.r input_file.txt output_file.csv
```

Example data downloaded from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE52530 GSE52530_HeLa.expData.txt.gz

### 2. ENSEMBL_to_SYMBOL.r

This script reads a file with ENSEMBL IDs and converts them to gene symbol names using the org.Hs.eg.db package. It is designed to facilitate the translation of ENSEMBL IDs to more interpretable gene symbols.

#### Usage

```bash
Rscript ENSEMBL_to_SYMBOL.r input_file.txt output_file.csv
```

Example data downloaded from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE149204 GSE149204_Nanopore_sequencing_readcounts.txt.gz

### 3. genetype_ensembl.r

This script utilizes the biomaRt package to convert gene symbols into Ensembl IDs and retrieve corresponding gene biotypes. It provides information on the types of genes based on Ensembl IDs.

#### Usage

```bash 
Rscript genetype_ensembl.r input_file.csv output_file.csv
```

### Prerequisites

Make sure to install the required R packages before running the scripts. The scripts use BiocManager, org.Hs.eg.db, AnnotationDbi, and biomaRt.

```bash
# Install BiocManager if not already installed
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.15")

# Install required packages
BiocManager::install(c("org.Hs.eg.db", "AnnotationDbi", "biomaRt"))
```