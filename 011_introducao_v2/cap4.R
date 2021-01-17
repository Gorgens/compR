dados = read.csv('arvores.csv', sep = ',', dec = '.')
head(dados)

names(dados)
nrow(dados)
ncol(dados)
dim(dados)
head(dados)
tail(dados)
str(dados)
summary(dados)

dados[1,1]
dados[1,]
dados[10:20,]
dados[,2]
dados$dap

dados$cap = dados$dap * pi
names(dados)

emergentes = dados[dados$vert == 'E',]
dossel = dados[dados$vert == 'C',]
suprimidas = dados[dados$vert == 'S',]

emergentes_sub = subset(dados, vert == 'E')
dossel_sub = subset(dados, vert == 'C')
suprimidas_sub = subset(dados, vert == 'S')

dap50 = dados[dados$dap >= 50,]
dap50_sub = subset(dados, dap >= 50)


