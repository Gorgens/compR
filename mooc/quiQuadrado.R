#--------------------------------------------------------------------------------------------------
# Comparando distribuicoes com o Qui-quadrado
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# comparando tempo de florescimento de especies nativas e exoticas

df <- read.csv("flowering.csv", sep = ";") # o separador pode mudar de computador para computador
head(df)
names(df)

# explorando a distribuição graficamente.
require(ggplot2)
ggplot(df, aes(MesFlorescimento)) + geom_histogram() + facet_wrap(~Origem, nrow = 2, ncol = 1)

# e pelo teste Chi-quadrado.
m <- table(df$Origem, df$MesFlorescimento)

(Xsq <- chisq.test(m)) # Resumo do teste
Xsq$observed # Valores observados (o mesmo que matriz m)
Xsq$expected # Valores esperados segundo hipótese nula
Xsq$residuals # Resíduos de Pearson
Xsq$stdres # Resíduos padronizados
