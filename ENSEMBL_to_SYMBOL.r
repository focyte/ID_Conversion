# John @ Focyte created 30/08/2022 v.1.1
# Upaded 17/12/2023 v2

# This script reads a file with ENSEMBL IDs and converts them to gene symbol names using the org.Hs.eg.db package. 
# It is designed to facilitate the translation of ENSEMBL IDs to more interpretable gene symbols.

# Load required packages
library("org.Hs.eg.db")

# Define command-line arguments
args <- commandArgs(trailingOnly = TRUE)

# Check if the correct number of arguments is provided
if (length(args) != 2) {
  stop("Usage: Rscript script.R <input_file> <output_file>")
}

# Get the input and output file names from the command line arguments
input_file <- args[1]
output_file <- args[2]

# Load data from the specified input file
counts.df <- read.table(input_file, header = TRUE, sep = "", dec = ".")
counts.df <- as.data.frame(counts.df)

# Extract the ENSEMBL IDs without version numbers
ensembl_ids <- sub("\\..*", "", counts.df[, 1])

# Convert the ENSEMBL IDs into the row names
counts.df2 <- counts.df[, -1]
rownames(counts.df2) <- ensembl_ids

# Convert ENSEMBL to Symbol IDs and write the file to the specified output directory
counts.df2$symbol <- mapIds(org.Hs.eg.db, 
                           keys = as.character(rownames(counts.df2)), 
                           keytype = "ENSEMBL", 
                           column = "SYMBOL",
                           multiVals = "first")
write.csv(counts.df2, output_file)