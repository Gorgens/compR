#--------------------------------------------------------------------------------------------------
# Explorando distribuicoes atraves do pacote ggplot2
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# O ggplot2 é um pacote grafico opcional


# Verifica disponibilidade e se existir ativa o pacote ggplot2
require(ggplot2)

# Para este exemplo criaremos um data frame ficticio
set.seed(22136) # fixa o gerador de numeros aleatorio para que os resultados sejam iguais para todos

df <- rbind(data.frame(group='A', tempo=rnorm(n=200, mean=10, sd=3), peso=rnorm(n=200, mean=100, sd=20)),
            data.frame(group='B', tempo=rnorm(n=200, mean=10, sd=3), peso=rnorm(n=200, mean=105, sd=20)))

head(df) # exibe primeiras linhas do data frame


#Criando um gráfico de dispersão do tempo em função do peso
ggplot(df, aes(tempo, peso)) + geom_point()

#Criando um gráfico de dispersão do peso em função do tempo
ggplot(df, aes(peso, tempo)) + geom_point()

# criando um boxplot
ggplot(df, aes(group, peso)) + geom_boxplot()

# criando um histograma
ggplot(df, aes(peso)) + geom_histogram(binwidth=15)

# criando um histograma para cada grupo e organiza numa mesma janela
ggplot(df, aes(peso)) + geom_histogram(binwidth=10) + facet_wrap(~group, nrow=2, ncol=1)

# criando um histograma para cada grupo num mesmo gráfico, mas com cores diferentes
ggplot(df, aes(peso, color = group)) + geom_histogram(binwidth=10)
