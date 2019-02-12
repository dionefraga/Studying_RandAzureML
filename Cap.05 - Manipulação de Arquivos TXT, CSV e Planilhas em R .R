# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/ses01816300012/Desktop/Big Data Analytics com R e MS Azure Machine Learning/05. Manipula��o de Arquivos TXT, CSV e Planilhas em Excel em R")
getwd()


# Exercicio 1 - Encontre e fa�a a corre��o do erro na instru��o abaixo:
# write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = TRUE, qmethod = "double")
#OU
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")


# Exercicio 2 - Encontre e fa�a a corre��o do erro na instru��o abaixo:
install.packages("readr")
library(readr)
#df_iris <- read_csv("iris.csv", col_types = matrix(
#  Sepal.Length = col_double(1),
#  Sepal.Width = col_double(1),
#  Petal.Length = col_double(1),
#  Petal.Width = col_double(1),
#  Species = col_factor(c("setosa", "versicolor", "virginica"))
#))

#POR QU�?
df_iris <- read_csv("iris.csv", col_types = list(
    Sepal.Length = col_double(),
    Sepal.Width = col_double(),
    Petal.Length = col_double(),
    Petal.Width = col_double(),
    Species = col_factor(c("setosa", "versicolor", "virginica"))
))

df_iris

# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" ) 
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

#my answer
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" ) 
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , add=T)

#answer
hist(dataset1, breaks=30, xlim=c(0,300), col=rgb(1,0,0,0.5), xlab="height", ylab="nbr of plants", main="distribution of height of 2 durum wheat varieties" )
hist(dataset2, breaks=30, xlim=c(0,300), col=rgb(0,0,1,0.5), add=T)
legend("topright", legend=c("Dataset 1","Dataset 2"), col=c(rgb(1,0,0,0.5), 
                                                            rgb(0,0,1,0.5)), pt.cex=2, pch=15 )

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = Species , marker=list(size=20 , opacity=0.5))

#answer
plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))

# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
head(volcano)

p=plot_ly(z = volcano, type = "surface")
p


# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
install.packages('rjson')
library(rjson)
?rjson
json_resultado = fromJSON(file = 'input.json') 
print(json_resultado)


# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
df_json_resultado = data.frame(json_resultado)
df_json_resultado

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
install.packages("installr"); 
library(installr)
updateR()


install.packages("XML")
library("XML")
?xml

input_file = xmlParse(file = "input.xml")
print(input_file)


# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
df_from_xml = xmlToDataFrame(input_file)
df_from_xml


# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
install.packages("readr")
library(readr)

csv_file = read.csv("input.csv")
View(csv_file)


# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
#8 linhas e 5 colunas
print(nrow(csv_file))
print(ncol(csv_file))
# Pergunta 2 - Qual o maior salário?
#843.2
print(max(csv_file$salary))
# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
#Gary
print(subset(csv_file, salary == max(salary)))
# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
print(subset(csv_file, dept == "IT"))
# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
print(subset(csv_file, dept == "IT" & salary > 600))
