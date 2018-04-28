#--------------------------------------------------------------------------------------------------
# Importando dados de planilhas eletrônicas de extensão .csv
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------


# Comando simplificado
df <- read.csv("flowering_alien_vs_indigen.csv") 

# comando incluindo separador de colunas
df <- read.csv("flowering_alien_vs_indigen.csv", sep = ";")

# comando incluindo separador de colunas e separador decimal
df <- read.csv("flowering_alien_vs_indigen.csv", sep = ";", dec = ".")

# comando incluindo separador de colunas, separador decimal e presença de cabeçalho
df <- read.csv("flowering_alien_vs_indigen.csv", sep = ";", dec = ".", head = TRUE)

# comando incluindo endereço completo
df <- read.csv("C:/Users/Gorgens/Documents/R/udemy R/flowering_alien_vs_indigen.csv", sep = ";")


# Inspecionar os dados importador

dim(df)
head(df)
names(df)
summary(df)
