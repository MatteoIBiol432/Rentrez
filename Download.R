#Download

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
library(rentrez)  # you may need install.packages first
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

Sequences <- strsplit(Bburg, "\n")

print(Sequences)

Sequences<-unlist(Sequences)

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)

Sequences$Sequence <- gsub("\n", "", Sequences$Sequence)


write.csv(Sequences, "Sequences.csv", row.names = FALSE)
