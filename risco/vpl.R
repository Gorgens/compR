receita = c(0, 0, 0, 0, 0, 0, 0, 0, 80, 80, 80, 80, 960)
custo = c(325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

vpl = function(
  receita = NA,
  custo = NA,
  i = 0.10,
  sensibilidade = TRUE
){
  stopifnot(length(receita) == length(custo))
  horizonte = seq(0, length(receita) - 1, 1)
  
  if(sensibilidade){
    taxa = seq(0.01, i+0.2, 0.01)
    VPR = sapply(taxa, function(x)sum(receita / (1 + x)^horizonte))
    VPC = sapply(taxa, function(x)sum(custo / (1 + x)^horizonte))
    VPLs = VPR - VPC
    out = plot(taxa, VPLs, type = 'l')
    abline(h = 0, col = 'red')
    return(out)
  }else{
    VPR = sum(receita / (1 + i)^horizonte)
    VPC = sum(custo / (1 + i)^horizonte)
    return(VPR - VPC)
  }
}