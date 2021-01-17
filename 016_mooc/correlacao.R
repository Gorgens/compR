#--------------------------------------------------------------------------------------------------
# Correlação e covariância
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

# Correlacoes e covariancia
cor(mtcars, method="spearman")
cor(mtcars, method="pearson")
cov(mtcars)
