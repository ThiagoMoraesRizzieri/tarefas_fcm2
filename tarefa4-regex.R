# Lendo pacotes -----------------------------------------------------------

library(tidyverse)
library(pdftools)
library(lubridate)

# Lendo PDF ---------------------------------------------------------------

pdf <- pdf_text("cadastro.pdf")
pdf <- str_split_1(pdf, "\\n")
pdf

# Pegando o endere�o completo
endereco <- pdf[grepl("Endere", pdf)]

# Obtendo apenas a rua
rua <- gsub("(Endere�o: |,.*)", "", endereco)

# Obtendo apenas o local
local <- str_extract(gsub("(.*, |)","",endereco), "[A-Za-z]*")
