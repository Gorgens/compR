#------------------------------------------------------------------------------------------
# Tipos de objetos
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#------------------------------------------------------------------------------------------

# Vetores

a <- 2

a <-  c(1, 2, 3)

idade <- c(2, 4, 3)
experiencia <- c(1, 5, 7)


length(idade)
length(experiencia)

dados <- c(2, 4, 3, 1, 5, 7)

# Matrizes

matrix(dados, nrow = 2, ncol = 3, byrow = FALSE)

m1 <- matrix(dados, nrow = 2, ncol = 3, byrow = FALSE)

dim(m1)

m1[1,1]
m1[1,]
m1[,2]
m1[2, 1:3]

# Data frame

mtcars

# Retorna os nomes das variaveis (colunas)
names(mtcars)

# Resumo estatistico das variaveis (colunas)
summary(mtcars)

# Retorna as primeiras linhas do dataframe
head(mtcars)

# Retorna as ultimas linhas do dataframe
tail(mtcars)

# Retorna a dimensao do dataframe
dim(mtcars)

# filtra o dataframe
subset(mtcars, mtcars$cyl == 4) # exemplo 1

subset(mtcars, mtcars$cyl == 4, select = c("mpg", "hp")) # exemplo 2

# Listas

lista = lis(mtcars, a, idade)

lista[1]

lista[2]

lista[3]


# Exibe quais sao os objetos carregados na memoria
ls()

# deleta um objeto da memoria
rm(a)

# Limpa a memória do espaco de trabalho
rm(list = ls(all=TRUE))
