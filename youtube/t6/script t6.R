## Análise de um teste de germinação (reshape + ggplot)
## Criado por: Eric Gorgens
## Criando em: 30/04/2020

require(dplyr)
require(magrittr)
require(reshape2)
require(ggplot2)
require(xlsx)

# Importação e organização da base dados

prot = read.xlsx('teste_germinacao.xlsx', 1)
prot %<>% melt(id=c("dia"))
names(prot) = c("dias", "rep", "protrusao")

polar = read.xlsx('teste_germinacao.xlsx', 2)
polar %<>% melt(id=c("dia"))
names(polar) = c("dias", "rep", "polarizacao")
  
folhas = read.xlsx('teste_germinacao.xlsx', 3)
folhas %<>% melt(id=c("dia"))
names(folhas) = c("dias", "rep", "folhas")

all = prot %>% full_join(., polar, by = c('dias', 'rep'))
all %<>% full_join(., folhas, by = c('dias', 'rep'))

# média dos estágios por dia

bydia = all %>% group_by(dias) %>% summarise(meanProt = mean(protrusao),
                                            meanPolar = mean(polarizacao),
                                            meanFolha = mean(folhas))


# gráfico de linhas

# gráfico para base 'all'
# protrusao = f(dias) -> gráfico de dispersão (dois dados numéricos)

ggplot(all) + geom_point(aes(dias, protrusao), colour = "black") + geom_smooth(aes(dias, protrusao), colour = "black") +
  geom_point(aes(dias, polarizacao), colour = "green") + geom_smooth(aes(dias, polarizacao), colour = "green") +
  geom_point(aes(dias, folhas), colour = "red") + geom_smooth(aes(dias, folhas), colour = "red")


# gráfico para base 'bydia'
ggplot(bydia) + geom_line(aes(dias, meanProt, colour = "Protrusão")) + 
  geom_point(aes(dias, meanProt), colour = "black") +
  geom_line(aes(dias, meanPolar, colour = "Polarização")) + 
  geom_point(aes(dias, meanPolar), colour = "red") +
  geom_line(aes(dias, meanFolha, colour = "Primeira folha")) + 
  geom_point(aes(dias, meanFolha), colour = "blue") +
  scale_color_manual(values = c('Protrusão' = 'black', 
                                'Polarização' = 'red', 
                                'Primeira folha' = 'blue')) +
  theme_minimal() + ylab("Taxa de germinação")


bydia %<>% melt(id="dias")

ggplot(bydia, aes(dias, value) ) + geom_point(aes(colour = factor(variable)))
