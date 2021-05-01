## Distribuição diamétrica
require(plotly)
require(dplyr)

# Considere uma base de dados multinível em que:
# árvores entre 10 e 35 cm foram medidas em parcelas de 2x500 metros
# árvores iguais ou maiores que 35 cm foram medidas em parcelas de 20 x 500 metros.

# Vamos calcular a distribuição diamétrica.

inventario = read.csv('./dados/inventarioMultinivelArea1.csv')
head(inventario)
nparcelas = length(unique(inventario$parcela))

# Centro de classe

intervaloClasse = 10.0
diametroMin = 10.0

inventario = subset(inventario, dap2012 > diametroMin)
inventario$centroClasse = floor(inventario$dap2012 / intervaloClasse) * intervaloClasse + (intervaloClasse/2)

# A questão do multinível
# A comunidade é amostrada em duas fases:
# árvores entre 10 e 35 cm foram medidas em parcelas de 2x500 metros
# árvores iguais ou maiores que 35 cm foram medidas em parcelas de 20 x 500 metros.

nivel1 = subset(inventario, dap2012 < 35.0 & dap2012 > diametroMin)
nivel2 = subset(inventario, dap2012 >= 35.0)

area1 = 10000 / 1000
nivel1 = subset(nivel1, comum != 'morta')
freqDiam1 = nivel1 %>% 
  group_by(parcela, centroClasse) %>%
  summarise(freq = n()*area1) %>%
  group_by(centroClasse) %>%
  summarise(freq = sum(freq)/nparcelas)

area2 = 10000 / 10000
nivel2 = subset(nivel2, comum != 'morta')
freqDiam2 = nivel2 %>% 
  group_by(parcela, centroClasse) %>%
  summarise(freq = n()*area1) %>%
  group_by(centroClasse) %>%
  summarise(freq = sum(freq)/nparcelas)

# Unindo multinível

distDiam = merge(freqDiam1, freqDiam2, by = 'centroClasse', all = TRUE)
distDiam$freq.x = ifelse(is.na(distDiam$freq.x),0,distDiam$freq.x)
distDiam$freq.y = ifelse(is.na(distDiam$freq.y),0,distDiam$freq.y)
distDiam$freqArv = distDiam$freq.x + distDiam$freq.y

# Criar gráfico da distribuição diamétrica

fig = plot_ly(
  x = distDiam$centroClasse,
  y = distDiam$freqArv,
  name = "Distribuição Diamétrica",
  type = "bar"
)

print(fig)
