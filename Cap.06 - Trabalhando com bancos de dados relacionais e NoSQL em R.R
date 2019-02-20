# Solução Lista de Exerc�?cios - Cap�?tulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/ses01816300012/Desktop/Big Data Analytics com R e MS Azure Machine Learning/06. Trabalhando com Bancos de Dados Relacionais e NoSQL em R")
getwd()


# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages(c("dbplyr","RSQLite"))
library("RSQLite")
library("dbplyr")
library("dplyr")


# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "mamiferos.sqlite")
dbListTables(con)
#mamiferos = dbConnect(SQLite(), "mamiferos.sqlite")

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
src_dbi(con)

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objero em R:
# SELECT year, species_id, plot_id FROM surveys
query = "SELECT year, species_id, plot_id FROM surveys"
rs = dbSendQuery(con,query)
dados = fetch(rs, n = -1)
dados
#dados = tbl(mamiferos, sql("SELECT year, species_id, plot_id FROM surveys"))

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
class(dados)
#tipo tbl

# Exercicio 6 - Já carregamos a tabela abaixo para você. 
# Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(con, "surveys")
pesquisas %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)


# Exercicio 7 - Grave o resultado do item anterior em um objeto R. 
# O objeto final deve ser um dataframe
class(pesquisas)
rs_df = as.data.frame(pesquisas)
class(rs_df)

# Exercicio 8 - Liste as tabelas do banco de dados carregado
dbListTables(con)


# Exercicio 9 - A partir do dataframe criado no item 7, 
# crie uma tabela no banco de dados
dbWriteTable(con, 'weight_less_than_five', rs_df)
dbListTables(con)

# Exercicio 10 - Imprima os dados da tabela criada no item anterior
dados = tbl(con, sql("SELECT * FROM weight_less_than_five"))
print(dados)
#dbReadTable(con, "weight_less_than_five")

