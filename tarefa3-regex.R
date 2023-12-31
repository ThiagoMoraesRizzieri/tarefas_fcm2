# Lendo PDF ---------------------------------------------------------------

pdf <- pdf_text("cadastro.pdf")
pdf <- str_split_1(pdf, "\\n")
pdf

# Extrando do pdf as linhas que possuem o conjunto de caracteres "CEP:"
x <- pdf[grepl("CEP:", pdf)]

# Priemiramente, iremos substituir tudo aquilo que come�a com qualquer caracter at� o caracter "CEP: " que ser� excluido tamb�m.

# ^(.*) indica todos os caracteres presentes desde o come�o.
# ^(.*?)(CEP: ) indica para pegar todas os caracteres "CEP: ", sendo que pode haver mais caracteres antes dele ou n�o.
# Isso ser� necess�rio para lidarmos com os caracteres presentes antes de "CEP: " na segunda linha.
x <- gsub("(.*?)(CEP: )", "", x)

# Por fim, retiramos os caracteres "-" e "." para deixar apenas n�meros no CEP.
x <- gsub("-|\\.", "", x)


