x = 2
y <- 6

z = 20.7

a = 12.3
str(a)
length(a)

a = 2
b = c(1, 2, 3)
idade = c(2, 4, 3)
experiencia = c("Pequena", "Media", "Alta")

length(a)
length(b)
length(idade)
length(experiencia)

arv = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
dap = c(22.9, 22.5, 21.7, 22.4, 24.2, 23.8, 21.7, 22.4, 27.0, 24.1)
altura = c(32.5, 31.7, 32.5, 29.8, 33.8, 31.4, 33.9, 35.7, 32.7, 29.8)
matriz = cbind(arv, dap, altura)

dim(matriz)
matriz

matriz[1,1]
matriz[1,]
matriz[,2]
matriz[2,1:2]

arv = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
especie = c('sp1', 'sp1', 'sp1', 'sp2', 'sp5', 'sp1', 'sp6', 'sp4', 'sp4', 'sp3')
dap = c(22.9, 22.5, 21.7, 22.4, 24.2, 23.8, 21.7, 22.4, 27.0, 24.1)
altura = c(32.5, 31.7, 32.5, 29.8, 33.8, 31.4, 33.9, 35.7, 32.7, 29.8)
df = data.frame(arv, especie, dap, altura)

dim(df)
head(df)
tail(df)
names(df)
summary(df)
df[3,3]
df[1,]
df[1:3,]

subset(df, df$arv==4)
df[df$arv==4,]

subset(df, df$especie == 'sp1', select = c('dap'))
df[df$especie=='sp1', 3]

idade = c(24, 35, 34, 10)
nome = c('Andre', 'Eric', 'Polly', 'Ellie')
tempo = 2
fim = TRUE
data(mtcars)
minhaLista = list(idade, nome, tempo, fim, mtcars)

minhaLista[[3]]
minhaLista[[4]]

ls()
rm(fim)
rm(list = ls(all=TRUE))

a = 2
b = 100
c = c(1, 2, 3, 4, 5)

a + 10
a + b
a + b + 102
d = c + 10
print(d)

a - 10
a - b
a + b - 102
c - 10
e = b - a

b/10
a/b
a + b/10
(a + b)/10

b*10
a*b
a + b*10
(a + b)*10

a^2
a^-1
c^2

10%%2
e%%3
11%%3

4^(1/2)
sqrt(4)
8^(1/3)

log(10)
log(10, 10)
log(8, 2)

peso = 80
altura = 1.87
imc = peso / altura^2
print(imc)

diametro = 20
altura = 23
s = pi * diametro^2 / 40000
volCilindro = s * altura
print(volCilindro)

if(altura >= 20){
  s = pi * diametro^2 / 40000
  volume = s * altura * fatorForma
} else {
  volume = 0
}

dap1 = 10.2
dap2 = 14.3
ht1 = 15
ht2 = 15
incremento = 4.3
parcela1 = c(10, 14, 12, 16)
parcela2 = c(11, 11, 11, 11)
parcela3 = c(18, 13, 11, 12)

dap1 == dap2
ht1 == ht2

length(parcela1) != 1
dap2 != (10 + incremento)

length(parcela1) > 3
dap1 > incremento
length(parcela1) > length(parcela2)

length(parcela3) >= 4
4 >= length(parcela2)
length(parcela1) >= length(parcela2)

dap1 < dap2
dap2 < dap1 + incremento
ht1 < ht2

dap1 <= dap2
dap1 <= dap2 + incremento
ht2 <= ht1

elemento = 10
elemento %in% parcela1

referencia = 10
arvore1 = 20
arvore2 = 10
arvore3 = 10

referencia == arvore1
referencia == arvore2
(referencia == arvore1) & (referencia == arvore2)

referencia == arvore2
referencia == arvore3
(referencia == arvore2) & (referencia == arvore3)

referencia == arvore1
referencia == arvore2
(referencia == arvore1) | (referencia == arvore2)

referencia == arvore1
referencia > arvore2
(referencia == arvore1) | (referencia > arvore2)
