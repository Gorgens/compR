# Manipulacao de dataframe
# Eric Bastos Gorgens
# criado em: 14/04/2020

df = read.csv('./youtube a4/inventario.csv')

names(df)
head(df)
summary(df)

# transformar valores de altura 0 em NA
df[df$ht == 0,"ht"] = NA
summary(df)

# verificar e ajustar classes de objetos
str(df)
df$dataplantio = as.Date(df$dataplantio, format = '%d/%m/%Y')
df$datamedicao = as.Date(df$datamedicao, format = '%d/%m/%Y')
str(df)

# Obter a altura dominante por parcela

dfHd = df[df$obs == "D",]

unique(dfHd$talhao)
unique(dfHd$parcela)

dfHd$chave = paste(dfHd$talhao, ".", dfHd$parcela, sep = "")
hdMean = data.frame(chave = names(tapply(dfHd$ht, dfHd$chave, mean)),
                       Hd = tapply(dfHd$ht, dfHd$chave, mean))

df$chave = paste(df$talhao, ".", df$parcela, sep = "")
df2 = merge(df, hdMean, by = 'chave')

# Estimar altura das arvores que nao foram medidas

dfCoef = data.frame(talhao = c(2, 3, 4),
				   b0 = c(1.441593, 0.682470, 1.278235), 
				   b1 = c(-5.593725, -4.306083, -5.21543),
				   b2 = c(0.661824, 0.872517, 0.7234712))

df3 = merge(df2, dfCoef, by = 'talhao')

df3$HtEst = ifelse(is.na(df3$ht), 
                   exp(df3$b0 + df3$b1 * (1/df3$dap) + df3$b2 * log(df3$Hd)), 
                   df3$ht)

#write.csv(df, 'df_processed.csv')
