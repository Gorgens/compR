require(plotly)

canvasX = 100
canvasY = 100

sp = 100
pop = 1000
#padrao = 1 #Uniforme
padrao = 2 #Desuniforme
#prob = c(0.3, 0.5, 0.1, 0.1)

especie = c()
coordx = c()
coordy = c()

for(i in seq(1, pop)){
  if(padrao == 1){
    especie[i] = sample(1:sp, 1)
  } else if(padrao == 2){
    especie[i] = sample(1:sp, 1, prob = sp:1)
  } else {
    break
  }
  coordx[i] = runif(1, 0, canvasX)
  coordy[i] = runif(1, 0, canvasY)
}

comunidade = data.frame(especie = especie, coordx = coordx, coordy = coordy)
termo1 = -1 * table(comunidade$especie)/length(comunidade$especie)
termo2 = log(table(comunidade$especie)/length(comunidade$especie))
H = sum(termo1 * termo2)

p = plot_ly(data = comunidade, x = ~coordx, y = ~coordy, color = factor(especie), 
            type = 'scatter', mode = 'markers')
p = layout(p, title = paste("H': ", round(H, 2)))
p


