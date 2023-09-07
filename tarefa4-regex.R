# Lendo pacotes -----------------------------------------------------------

library(tidyverse)
library(pdftools)
library(lubridate)

# Lendo PDF ---------------------------------------------------------------

pdf <- pdf_text("cadastro.pdf")
pdf <- str_split_1(pdf, "\\n")
pdf

# Pegando o endereço completo
endereco <- pdf[grepl("Endere", pdf)]

# Obtendo apenas a rua
rua <- gsub("(Endereço: |,.*)", "", endereco)

# Obtendo apenas o local
local <- str_extract(gsub("(.*, |)","",endereco), "[A-Za-z]*")
