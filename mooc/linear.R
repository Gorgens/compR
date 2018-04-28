#--------------------------------------------------------------------------------------------------
# Regressao linear
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# Neste arquivo temos o peso de serrapilheira e braquiaria (dividido em total e aéreo) e abertura de dossel.
# Deseja-se investigar se o nivel de abertura de dossel influencia no desenvolvimento da braquiaria.

d = read.csv("linear.csv", header=TRUE)

head(d)

# Braquiaria em funcao da abertura
plot(d$Braquiaria~d$Abertura)

# Ajusta a regressão
reg = lm(Braquiaria~Abertura, data=d)

# Adiciona a regressão ao gráfico
abline(reg)

# Resultados do ajuste da regressão
summary(reg)
anova(reg)
plot(reg)

# Braquiaria em funcao da abertura sem o intercepto
plot(d$Braquiaria~d$Abertura)

# Ajusta a regressão sem o intercepto
reg0 = lm(Braquiaria~Abertura-1, data=d)

#Adiciona a regressão ao gráfico
abline(reg0)

# Resultados da regressão
summary(reg0)
anova(reg0)
plot(reg0)
