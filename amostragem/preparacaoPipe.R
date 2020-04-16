# Manipulacao de dataframe
# Eric Bastos Gorgens
# criado em: 14/04/2020

require(magrittr)
require(dplyr)

# importar base de dados
df = read.csv('./youtube a4/inventario.csv')

# transformar valores de altura 0 em NA
df[df$ht == 0,"ht"] = NA
summary(df)

# verificar e ajustar classes de objetos
str(df)
df$dataplantio %<>% as.Date(format = '%d/%m/%Y')
df$datamedicao %<>% as.Date(format = '%d/%m/%Y')
str(df)

# Obter a altura dominante por parcela
df2 = df %>%
  filter(obs == "D") %>%
  group_by(talhao, parcela) %>%
  summarize(hd = mean(ht)) %>%
  left_join(df, ., by=c('talhao', 'parcela'))

# Estimar altura das Ã¡rvores que nÃ£o foram medidas

dfCoef = data.frame(talhao = c(2, 3, 4),
                    b0 = c(1.441593, 0.682470, 1.278235), 
                    b1 = c(-5.593725, -4.306083, -5.21543),
                    b2 = c(0.661824, 0.872517, 0.7234712))

df3 = dfCoef %>% left_join(df2, ., by="talhao") %>% 
  mutate(ht_est = ifelse(is.na(ht),
                         exp(b0 + b1 * (1/dap) + b2 * log(hd)),
                         ht))
