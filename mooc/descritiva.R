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
head(mtcars)

# Estatisticas basicas
mean(mtcars$mpg)                            # media
var(mtcars$mpg)                             # variancia
sd(mtcars$mpg)                              # desvio padrao
quantile(mtcars$mpg, c(0.25, 0.50, 0.75))   # quantile
max(mtcars$mpg)                             # maximo
min(mtcars$mpg)                             # minimo
median(mtcars$mpg)                          # mediana
IQR(mtcars$mpg)                             # distancia intequartil


# Veja agora a função summary
summary(mtcars)
