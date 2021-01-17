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

dados <- read.csv("mudas.csv")

dados

# filtrar a coluna
dados[,1]
dados[,2]
dados$Altura

# filtrar a linha
dados[1,]
dados[-1,]

# filtrar os dados relativos a espécie A
dados[dados$Especie == "A",]

# filtrar os dados cuja altura seja igual a 14
dados[dados$Altura == 14,]

# filtrar os dados da espécie B cuja altura seja igual a 14
dados[dados$Altura == 14 & dados$Especie == "B",]

# filtrar os dados cuja altura seja igual a 14 ou 13
dados[dados$Altura == 14 | dados$Altura == 13,]

# é possível trabalhar com todos os operadores lógicos como >, <, <=, >=, != e outros.
