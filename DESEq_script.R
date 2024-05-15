# Script for DESeq analysis

# Load metadata from the specific
metadata <- read.csv("C:/Users/Elin/OneDrive/Dokument/Genome_data/Meta_data/metadata_musangking.txt", header = TRUE, row.names = 1)

# Load count files
count_files <- list.files(path = "C:/Users/Elin/OneDrive/Dokument/Genome_data/htseq_results/musang_king", pattern = "*.txt")


# Read count data
count_data_lst <- lapply(count_files, function(file) {
  # Read counts data from each file
  counts <- read.table(file, header = FALSE, col.names = c("gene", "counts"))
  
  # Filter out rows that do not represent typical gene identifiers
  valid_genes <- !grepl("^__", counts$gene)
  counts <- counts[valid_genes, ]
  
  # Convert counts to a named vector (gene counts)
  setNames(counts$counts, counts$gene)
})

# Extract base file names (sample identifiers) and assign to count data list
count_file_names <- gsub(".txt$", "", basename(count_files))
names(count_data_lst) <- count_file_names


# Create the DESEq2 data object
library(DESeq2)
dds <- DESeqDataSetFromMatrix(countData = count_matrix,
                              colData = metadata,
                              design = ~ tissue)

# Run DESeq analysis
dds <- DESeq(dds)

# Extract results
res <- results(dds)

res_df <- as.data.frame(res)

# Save the results for further analysis
write.csv(res_df, file.path("C:/Users/Elin/OneDrive/Dokument/Genome_data/output", "DESeq2_results_musangking.csv"))