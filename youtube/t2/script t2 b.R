# Criado: Eric Gorgens
# Em: 02/04/2020

# Objetivo: Verificar se existe diferença entre as árvores nos diferentes estratos da floresta.

inventario = read.csv('arvore.csv')

  # dimensaoInventario = dim(inventario)
  # primeirasLinhas = head(inventario)
  # ultimasLinhas = tail(inventario)
  # colunas = ncol(inventario)
  # linhas = nrow(inventario)

inventario$as = pi * inventario$dap^2 / 40000
inventario$volCil = inventario$as * inventario$alt

# dap = f(vert) 
boxplot(inventario$dap~inventario$vert)

# alt = f(vert) 
boxplot(inventario$alt~inventario$vert)

# as = f(vert) 
boxplot(inventario$as~inventario$vert)

# volCil = f(vert) 
boxplot(inventario$volCil~inventario$vert, 
        xlab = "Posição vertical", 
        ylab = "Altura (m)")

#comparar S com E
filtroSE = subset(inventario, inventario$vert == "E" | inventario$vert == "S")
t.test(filtroSE$dap~filtroSE$vert)

#comparar S com C
filtroSC = subset(inventario, inventario$vert == "C" | inventario$vert == "S")
t.test(filtroSC$dap~filtroSC$vert)

# alt = f(dap)
plot(inventario$alt~inventario$dap,
     xlab = "DAP (cm)",
     ylab = "Altura (m)")

reg = lm(alt ~ dap, data = inventario)
summary(reg)
aov(reg)
