#--------------------------------------------------------------------------------------------------
# Estudo das pressuposicoes
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# Importando base
df = read.csv("lidar.csv", header=TRUE, sep="")
names(df)

#-------------------------------------------------------------
# Normalidade

# metodo grafico
qqnorm(df$Volume)
qqline(df$Volume)

#teste de Shapiro
shapiro.test(df$Volume)

#teste de Lilliefors
require(nortest)
lillie.test(df$Volume)

#-------------------------------------------------------------
# Homogeneidade de variancia

# Teste de Breusch-Pagan-Godfrey
require(lmtest)
bptest(Volume ~ Height, data=df)
