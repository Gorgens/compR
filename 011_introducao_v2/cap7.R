especie = 'pinus'
dap = 23
h = 21
vol = 0.00006 * dap^1.8 * h^1.01
print(vol)

especie = 'eucalipto'
dap = 15
h = 23
vol = 0.0071 + 0.000003*dap^2*h
print(vol)


if(especie == 'pinus'){
  vol = 0.00006 * dap^1.8 * h^1.01
} else {
  vol = 0.0071 + 0.000003*dap^2*h
}

if(especie == 'pinus'){
  vol = 0.00006 * dap^1.8 * h^1.01
} else if(especie == 'eucalipto'){
  vol = 0.0071 + 0.000003*dap^2*h
} else {
  print("Não há equação desta espécie")
}

especie = 'pinus'
dap = 23
h = 21
if(especie == 'pinus'){
  vol = 0.00006 * dap^1.8 * h^1.01
  print(vol)
} else if(especie == 'eucalipto'){
  vol = 0.0071 + 0.000003*dap^2*h
  print(vol)
} else {
  print("Não há equação desta espécie")
}


arvores = read.csv('arvores.csv', sep = ',', dec = '.')
sumDap = 0
sumH = 0

for(a in 1:dim(arvores)[1]){
  sumH = sumH + arvores$alt[a]
  sumDap = sumDap + arvores$dap[a]
}
print(sumDap / dim(arvores)[1])
print(sumH / dim(arvores)[1])

apply(arvores[,c('dap', 'alt')], 2, mean)

fun = function(x){
  x*pi
}
resSapply = sapply(arvores[,2:3], fun)
resLapply = lapply(arvores[,2:3], fun)

str(resSapply)
str(resLapply)