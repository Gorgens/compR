receita = c(0, 0, 0, 0, 0, 0, 0, 0, 80, 80, 80, 80, 960)
custo = c(325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

vet = function(
  receita = NA,
  custo = NA,
  i = 0.10,
  sensibilidade = TRUE
){
  require(magrittr)
  stopifnot(length(receita) == length(custo))
  horizonte = seq(0, length(receita) - 1, 1)
  
  if(sensibilidade){
    taxa = seq(0.01, i+0.2, 0.01)
    VFR = sapply(taxa, function(x)sum(receita * (1 + x)^horizonte))
    VFC = sapply(taxa, function(x)sum(custo * (1 + x)^horizonte))
    VETs = 
      taxa %>% 
      (function(x){
        (VFR - VFC)/((1+x)^(length(horizonte)-1)-1)
      })
    out = plot(taxa, VETs, type = 'l')
    abline(h = 0, col = 'red')
    return(out)
  } else {
    horizonte = seq(length(receita) - 1, 0, -1)
    VFR = sum(receita * (1 + i)^horizonte)
    VFC = sum(custo * (1 + i)^horizonte)
    return((VFR - VFC)/((1+i)^(length(horizonte)-1)-1))
  }
}