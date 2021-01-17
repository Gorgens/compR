#--------------------------------------------------------------------------------------------------
# Data frame
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# Exemplo 1 - Criando um data frame a partir da função data.frame()
# Dados do exemplo 1 foram adaptador de http://ecologia.ib.usp.br/bie5782/doku.php?id=bie5782:03_apostila:05a-graficos

d = data.frame(riqueza = c(22, 24, 25, 30, 37, 39, 41, 45),
               area = c(10, 30, 34, 50, 56, 80, 85, 90),
               categoria = rep(c("pequeno", "grande"), each = 4))


# Exemplo 2 - Criação de um data frame a partir da importação de uma planilha eletrônica (.csv)

df = read.csv("flowering_alien_vs_indigen.csv", sep = ";")

is.data.frame(df)

# Funções úteis para trabalhar com data frame:

names(df)
dim(df)
head(df)
tail(df)
nrow(df)
ncol(df)
