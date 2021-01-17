# Criar uma função
# Criado por: Eric Gorgens
# Criando em 13/05/2020
# Ref: https://www.scielo.br/scielo.php?pid=S0034-737X2014000500005&script=sci_arttext
###############################################

# Calcular volume de uma parcela

data = read.csv('inventario2012.csv')

plot = 'T01'
area = 10000

b0 = -9.508421
b1 = 2.013940
b2 = 0.878799

file[, "volume"] = exp(b0 + b1 * log(file[, "dap2012"]) + b2 * log(file[, "ht"]))
parcFilt = subset(file, parcela == plot)
vol_ha = sum(parcFilt$volume)*10000/area        

# Transformando em função

volHa = function(file, plot, area){
  b0 = -9.508421
  b1 = 2.013940
  b2 = 0.878799
  
  file$volume = exp(b0 + b1 * log(file$dap2012) + b2 * log(file$ht))
  parcFilt = subset(file, parcela == plot)
  return(sum(parcFilt$volume)*10000/area)
}


volHa(data, 'T01', 10000)

# Looping FOR

for (i in unique(data$parcela)){
  print(volHa(data, i, 10000))
}
