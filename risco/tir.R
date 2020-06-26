receita = c(0, 0, 0, 0, 0, 0, 0, 0, 80, 80, 80, 80, 960)
custo = c(325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

tir = function(
  receita = NA,
  custo = NA,
  interacoes = 100
){
  stopifnot(length(receita) == length(custo))
  horizonte = seq(0, length(receita) - 1, 1)
  
  i = 1
  for(r in seq(1, interacoes, 1)){
    VPR = sum(receita / (1 + i)^horizonte)
    VPC = sum(custo / (1 + i)^horizonte)
    i = i * (1 + (VPR - VPC) / VPC)
  }
  
  return(i)
}