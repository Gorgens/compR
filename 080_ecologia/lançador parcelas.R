floresta = read.csv('./dados/populationSpace v2.csv', header = FALSE)

dados = floresta[-1, -1]
row.names(dados) = floresta[-1,1]
names(dados) = floresta[1,-1]

nparcelas = 30
x = sample(names(dados), nparcelas)
y = sample(row.names(dados), nparcelas)

inventario = data.frame(x, y, vol = 0)

for(i in row.names(inventario)){
  print(i)
  j = as.numeric(i)
  print(j)
  inventario$vol[j] = dados[as.numeric(inventario$y[j]), 
                         as.numeric(inventario$x[j])]
}

