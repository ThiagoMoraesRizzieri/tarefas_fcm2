# let's extract the email of several universities of medicine from
# https://emec.mec.gov.br/

library(RSelenium)
library(wdman)
library(netstat)
library(tidyverse)
library(rvest)

wpage <- "https://emec.mec.gov.br"
maxpages <- 13
# selenium()

# JAVA PATH
# Firefox (opcional)
# selenium()
# linguagem
# chromever

selenium(retcommand = TRUE, check = TRUE)

# Robozinho abre o firefox

remote_driver <- rsDriver(
  browser = "firefox",
  port = free_port(),
  verbose = FALSE, # Só pra não mandar warnings
  chromever = NULL # necessário
)

# Salva o que dá pra mexer com o nome remDr

remDr <- remote_driver$client

# Iremos fazer ele navegar para a webpage que queremos

remDr$navigate(wpage)

# Ele não pode fazer algo logo em seguida, pois a aba ainda estaria carregando
# Por isso, forçamos ele esperar 15 segundos

Sys.sleep(15) 

# Queremos o https que tem a informação de verdade da tabela do site
# Usando o inspecionar elemento podemos ver que é onde o id = mainFrame
# Iremos buscar esse https e navegar até ele
# Isso melhora as futuras inspeções do elemento

barra <- remDr$findElement(using = "id", "mainFrame")
hh <- barra$getElementAttribute(attrName = "src")[[1]]
remDr$navigate(hh)
Sys.sleep(15)

# Obrigar o robozinho clicar na aba
# /html/body/div[2]/div[2]/div/div[3]/ul/li[1]/a

situacao <- remDr$findElement(using = "xpath", value = "/html/body/div[2]/div[2]/div/div[3]/ul/li[1]/a")
situacao$clickElement()