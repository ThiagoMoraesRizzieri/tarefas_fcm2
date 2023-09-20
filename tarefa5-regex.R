# Lendo pacotes -----------------------------------------------------------

library(tidyverse)
library(pdftools)
library(lubridate)

# Lendo cada linha do arquivo como variável do tipo character criando um character de tamanho 11

df <- readLines("RACA_COR.cnv")
df

# A primeira linha não possui nenhum informação, iremos removê-la

df <- df[-1]

# Removemos os espaços ao redos do conteúdo

df <- trimws(df, "both")

# Fazemos a troca do termo Raça por Etnia, aproveitando e corrigindo o erro dos símbolos

df <- gsub("RA<c7>A\\/COR", "Etnia", df)

# Trocando 'sem informação' para NULL

df <- gsub("SEM INFORMA<c7><c3>O", "NULL", df)

# Removendo alguns erros

df <- gsub("N<c3>O EXIGIDO", "", df)

erro <- str_extract_all(df[7], "(?<=\\d{2}).*$")

df[7] <- gsub(erro, "", df[7])

# Colocando tudo que é indevido numa única linha

df <- gsub("1M,1G,1C,DE, D,87","06,09,1M,1G,1C,DE,D,87",df)

# Deixando apenas a string INDEVIDO

df <- gsub("Etnia.*)","INDEVIDO",df)

# Trocando o 10 do começo por ID

df <- gsub("10","ID",df)

# Trocando 00 por SIMBOLO

df <- gsub("00","SIMBOLO",df)

# Transformando muitos espaços em branco em um único espaço só

df <- gsub(" +", " ", df)

# Separando o character pelos espaços em branco e formando uma lista

df <- strsplit(df, " ")

# Separamos a primeira linha para formar o nome das colunas e removemos linhas de símbolos indevidos repetidos

nomes <- unlist(df[1])

dados <- df[-c(1,8,9)]

# Criamos um dataframe com os dados

df <- as.data.frame(do.call(rbind, dados))

# Adicionamos os nomes das colunas

colnames(df) <- nomes

# Exibir o dataframe

print(df)
