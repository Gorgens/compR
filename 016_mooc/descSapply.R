#--------------------------------------------------------------------------------------------------
# Estatistica descritiva
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------
data(mtcars)
names(mtcars)
dim(mtcars)
head(mtcars)

# Estatisticas basicas com sapply

sapply(mtcars, mean)
sapply(mtcars, min)
sapply(mtcars, max)
sapply(mtcars, var)
sapply(mtcars, sd)
