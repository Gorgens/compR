# ======================
#  REVISÃO - LINGUAGEM R
# ======================

### o que é R?
### script vs console
### painéis do RStudio
### ambiente R
### classes e funções
### pedindo ajuda - estrutura dos docs

?help

# tipos de dados

numeric = 0.5 # integer vs double
numeric

character = 'lidR' # char vs string
character

logico = FALSE # operadores lógicos
logico


# principais estruturas - "containers"

vetor = c(1,2,3,4,5,6,7,8,9) # ou 1:9
vetor

matriz = matrix(vetor, ncol = 3, byrow = TRUE)
matriz

data_frame = data.frame(matriz) # matrix vs data.frame
data_frame
names(data.frame)

lista = list(a=0.1, b=-2:5, c=matriz) # list vs atomic vector
lista

# indexação
vetor[4]
matriz[3,4]

vetor[c(1,5,7)]
matriz[1:3,1]
data_frame[,2]

data_frame$X1

# análise exploratória

mean(vetor) # mean, max, min, range, dim, length etc.
dim(matriz)
summary(data_frame)


# gráficos

x = 1:10
y = -0.5 + 3.3*x
plot(y ~ x)

plot(data_frame)


# funções úteis
a = runif(100, 12, 25)
plot(a)
hist(a)

apply(matriz, 2, max)
sapply(data_frame, max)


# pacotes

??MASS
??lidR
??raster

library(lidR)
require(rgl)
