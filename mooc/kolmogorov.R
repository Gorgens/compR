#--------------------------------------------------------------------------------------------------
# Comparando distribuicoes com o Kolmogorov-Smirnof
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# comparando tempo de florescimento de especies nativas e exoticas
 
df <- read.csv("flowering_alien_vs_indigen.csv", sep = ";") # o separador pode mudar de computador para computador
head(df)
names(df)

# explorando a distribuição graficamente.
require(ggplot2)
ggplot(df, aes(Flowering)) + geom_histogram() + facet_wrap(~Status, nrow = 2, ncol = 1)
 

# usando o KS-test,
ks.test(df$Flowering[df$Status == "indigen"],
        df$Flowering[df$Status == "Neophyt"])
