## Analise experimental e ggplot
## Criado por Eric Gorgens
## Criado em 28/04/2020

require(reshape2)
require(xlsx)
require(ggplot2)
require(dplyr)
require(magrittr)
require(ExpDes.pt)

# Reshape data

prot = read.xlsx('teste_germinacao.xlsx', 1)
prot %<>% melt(id=c("dia"))
names(prot) = c("dia", "rep", "protrusao")

polar = read.xlsx('teste_germinacao.xlsx', 2)
polar %<>% melt(id=c("dia"))
names(polar) = c("dia", "rep", "polarizacao")


folha = read.xlsx('teste_germinacao.xlsx', 3)
folha %<>% melt(id=c("dia"))
names(folha) = c("dia", "rep", "folha")

all = prot %>% full_join(., polar, by = c('dia', 'rep'))
all %<>% full_join(., folha, by = c('dia', 'rep'))


ggplot(all) + geom_point(aes(dia, protrusao)) + geom_smooth(aes(dia, protrusao)) 

ggplot(all) + geom_point(aes(dia, protrusao)) + geom_smooth(aes(dia, protrusao)) +
  geom_point(aes(dia, polarizacao), colour = 'red') + geom_smooth(aes(dia, polarizacao)) + 
  geom_point(aes(dia, folha), colour = 'green') + geom_smooth(aes(dia, folha))


byDia = all %>% group_by(dia) %>% summarize(meanProt = mean(protrusao), 
                                            meanPolar = mean(polarizacao),
                                            meanFolha = mean(folha))

ggplot(byDia) + geom_line(aes(dia, meanProt, colour = 'Protrusão'), size = 1) +
  geom_line(aes(dia, meanPolar, colour = 'Polarização'), size = 1) +
  geom_line(aes(dia, meanFolha, colour = 'Primeira Folha'), size = 1) +
  scale_color_manual(values = c(
    'Protrusão' = 'black',
    'Polarização' = 'red',
    'Primeira Folha' = 'green')) + labs(color = 'Estágio:') +
  theme_bw() + xlab("Dias") + ylab("# sementes") + theme(legend.position="bottom")
