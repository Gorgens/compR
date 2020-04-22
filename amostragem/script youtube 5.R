# Revisao de alguns conceitos
# Criado por: Eric Gorgens
# Criado em: 23/04/2020

require(dplyr)
require(xlsx)
require(magrittr)

# Revisar importacao de arquivos

## Importar csv

arv1 = read.csv('arvores_v1.csv')

arv2 = read.csv('arvores_v2.csv')
arv2 = read.csv('arvores_v2.csv', sep = ';')

arv3 = read.csv('arvores_v3.csv')
arv3 = read.csv('arvores_v3.csv', sep = ';')
arv3 = read.csv('arvores_v3.csv', sep = ';', dec = ',')

## Importar Excel

arv4 = read.xlsx('arvores.xlsx')
arv4 = read.xlsx('arvores.xlsx', sheetIndex = 1)


# Revisar dataframe

## Pareamento de medições

inv2012 = read.csv('inventario2012.csv')
  head(inv2012)
  hist(inv2012$dap2012, ylim = c(0, 500))
  
inv2014 = read.csv('inventario2014.csv')
  head(inv2014)
  hist(inv2014$dap2014, ylim = c(0, 500))
  
invPareado = inv2012 %>% full_join(., inv2014, by = c('parcela', 'arvore'), )

morreram = invPareado %>% filter(!is.na(dap2012) & is.na(dap2014))
morreram = invPareado %>% filter(!is.na(dap2012) & 
                                   is.na(dap2014) & 
                                   comum.x != 'morta')

ingressaram = invPareado %>% filter(is.na(dap2012) &
                                      !is.na(dap2014))

invPareado %<>% mutate(incAnnual = (dap2014 - dap2012)/2)
  hist(invPareado$incAnnual, breaks = 100, main =)
