# Criado por: Eric Bastos Gorgens
# Data de criação: 09/04/2020
# Versão 1

#install.packages("ExpDes.pt")
require(ExpDes.pt)

# Objetivo: Analisar um experimento em delineamento inteiramente casualizado
# Função matemática implícita: H = Hmed + Trat + Erro

# importar a base de dados
experimento = read.csv(file = 'dic.csv')

experimento$alturaTransformada = log(experimento$altura)

# explorar a base de dados. verificar se os dados foram corretamente importados
head(experimento)
tail(experimento)
summary(experimento)
str(experimento)

trat1 = subset(experimento, experimento$tratamento == "Substrato 1")
mean(trat1$altura)
sd(trat1$altura)

trat2 = subset(experimento, experimento$tratamento == "Substrato 2")
mean(trat2$altura)
sd(trat2$altura)

trat3 = subset(experimento, experimento$tratamento == "Substrato 3")
mean(trat3$altura)
sd(trat3$altura)

# explorar graficamente os dados
# H = f(TRAT)
# H é variável contínua
# TRAT é categórica

str(experimento)

# Caixas

boxplot(experimento$altura ~ experimento$tratamento)

# analisar o experimento

##??? Qual pacote e qual função usar?

dic(experimento$tratamento, experimento$altura, 
    quali = TRUE, mcomp = "tukey", nl = FALSE,
    hvar='bartlett', sigT = 0.05, sigF = 0.05)


