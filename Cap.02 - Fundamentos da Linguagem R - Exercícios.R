# Exerc�cio 1 - Crie um vetor com 12 n�meros inteiros
vetor = c(1:12)
vetor

# Exerc�cio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com n�meros inteiros
matriz = matrix(ncol = 4,nrow = 4, data = c(1:16))
matriz

# Exerc�cio 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista = list(vetor, matriz)
lista

# Exerc�cio 4 - Usando a fun��o read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
df = data.frame(read.table('http://data.princeton.edu/wws509/datasets/effort.dat'))
class(df)

# Exerc�cio 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes
# labels:
# c("config", "esfc", "chang")
names(df) = c("config", "esfc", "chang")
df

# Exerc�cio 6 - Imprima na tela o dataframe iris, verifique quantas dimens�es existem no
# dataframe iris, imprima um resumo do dataset.
iris
dim(iris)
summary(iris)
str(iris)

# Exerc�cio 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)

# Exerc�cio 8 - Usando s fun��o subset, crie um novo dataframe com o conjunto de dados do
# dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a fun��o subset()
help("subset")
df_sepalLenght_higherThan7 = subset(iris, iris$Sepal.Length > 7)
df_sepalLenght_higherThan7

# Exerc�cios 9 (Desafio) - Crie um dataframe que seja c�pia do dataframe iris e usando a fun��o
# slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: voc� vai ter que instalar e carregar o pacote dplyr
# Dica 2: consulte o help para aprender como usar a fun��o slice()
install.packages("dplyr")
library(dplyr)
?slice()
iris_15rows = slice(iris, 1:15)
iris_15rows
class(iris_15rows)

# Exerc�cios 10 - Use a fun��o filter no seu novo dataframe criado no item anterior e retorne
# apenas valores em que Sepal.Length > 6
# Dica: use o RSiteSearch() para aprender como usar a fun��o filter
RSiteSearch("filter")
filter(iris_15rows, Sepal.Length > 5)
