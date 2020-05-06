require(magrittr)
require(dplyr)
require(ggplot2)


# Importar base de dados
inv = read.csv('inventario2012.csv')
names(inv)

# Criar histograma no ggplot
ggplot(inv) + geom_histogram(aes(dap2012))


# Ajustar breaks para 10 cm
ggplot(inv) + geom_histogram(aes(dap2012), binwidth = 10)

# Ajustar nome dos eixos
ggplot(inv) + geom_histogram(aes(dap2012), binwidth = 10) + 
  xlab('Centro de classe (cm)') + ylab('# árvores')

# Ajustar tema
ggplot(inv) + geom_histogram(aes(dap2012), binwidth = 10) + 
  xlab('Centro de classe (cm)') + ylab('# árvores') +
  theme_light()

# Um gráfico para cada espécie

for(sp in unique(inv$cientifico)){
  invTemp = inv %>% filter(cientifico == sp)
  png(paste('./plot/',sp,'.png', sep = ""), width = 10, height = 7, units = 'cm', res = 72)
  g = ggplot(invTemp) + geom_histogram(aes(dap2012), binwidth = 10) + 
    xlab('Centro de classe (cm)') + ylab('# árvores') +
    theme_light()
  print(g)
  dev.off()
}

