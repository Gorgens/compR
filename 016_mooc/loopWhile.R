#--------------------------------------------------------------------------------------------------
# Looping While
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------


# O objetivo do looping é repetir uma determinada tarefa até que uma condição seja atendida

AllData = read.csv("lidar.csv", sep="")
  
Predictors2 = c("HMODE","HP30", "HP95","HP99") # metrics selection

scPred = scale(AllData[,names(AllData)%in%Predictors2])
scVol = scale(AllData$Volume)

require(nnet)
val <- 10
while (val > 0.08){
  mynet <- nnet(x=scPred, y=scVol, size = 30, skip=FALSE, linout=TRUE, 
                maxit = 150, MaxNWts = 2000)
  val <- mynet$value
}
