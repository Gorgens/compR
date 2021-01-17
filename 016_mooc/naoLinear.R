#--------------------------------------------------------------------------------------------------
# Ajustando um modelo de regressao nao linear
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# Trabalharemos com uma base de ANATRO de diferentes especies

# Importando os dados
nonlinear = read.csv("NonLinear.csv", sep=",", header=TRUE)
head(nonlinear)

# Criando um gráfico com todos os dados
plot(nonlinear$idade, nonlinear$diametro, main = "Geral", xlab = "Idade (anos)", ylab = "Diâmetro (cm)")

# Define chute inicial para o modelo não linear de Richards
chute_a = max(nonlinear$diametro)

# Ajusta modelo não linear de Richards.
func = nls(diametro~a*(1-exp(-b*idade))^c,data=nonlinear, start=list(a=chute_a, b=0.05, c=1.0))

# Análise de variância da regressão não linear.
summary(func)

