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

# Vamos combinar o looping FOR com a criação de uma função para ser chamada dentro de outra função.

# Importando os dados
nonlinear = read.csv("NonLinear.csv", sep=",", header=TRUE)
head(nonlinear)

# Cria uma funcao para implementar o modelo de Richards no comando curve()
func2 <- function(x) {
  a<-cfunc[1] ; b<-cfunc[2] ; c<-cfunc[3]
  (a*(1-exp(-b*x))^c)
}

# Definindo lista de progênies que irão participar da análise
clones = levels(as.factor(nonlinear$progenie))
clones  =  as.numeric(clones)


# Ajustando o modelo de Richard por progênie e adiciona a curva ao gráfico de dispersão.

for (i in clones) {
  # cria um subset com os dados da progenie i
  temp = subset(nonlinear, progenie==i)
  
  # Ajusta o modelo de Richards para a progenie i
  chute_a = max(temp$diametro)
  func = nls(diametro~a*(1-exp(-b*idade))^c,data=temp, start=list(a=chute_a, b=0.05, c=1.0))
  
  # Salva os parametros da funcao de Richards
  cfunc = coef(func)
  
  # Cria o grafico de dispersao
  plot(temp$idade, temp$diametro, main = paste("Progênie = ",i), xlab = "Idade (anos)", ylab = "Diâmetro (cm)")
  
  # Adiciona o respectivo modelo de Richard ao grafico de dispersao
  curve(func2, from=1, to=8,add=TRUE)
}
