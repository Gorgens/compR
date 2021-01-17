#--------------------------------------------------------------------------------------------------
# Pacote grafico básico do R
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# Fonte do exemplo: http://ecologia.ib.usp.br/bie5782/doku.php?id=bie5782:03_apostila:05a-graficos)

# Criando data frame com os dados
df1 = data.frame(riqueza = c(15,18,22,24,25,30,31,34,37,39,41,45),
                  area = c(2,4.5,6,10,30,34,50,56,60,77.5,80,85),
                  categoria = rep(c("pequeno", "grande"), each=6))

head(df1) # mostra o cabecalho e as primeiras linhas do arquivo

# Grafico de dispersao
?plot

plot(riqueza~area, data = df1)
plot(df1$area, df1$riqueza) # escrita alternativa

# Especificando outros parâmetros
plot(riqueza~area, data = df1, xlab="Area (m²)", ylab="Riqueza (# espécies)",
      xlim=c(0,90), ylim=c(0,90), main="Riqueza = f(area)")

# Adicionando uma linha de tendência linear
abline(lm(riqueza~area, data = df1))


# Criando um boxplot
boxplot(riqueza~categoria, data = df1)

# Criando um grafico de barras
barplot(df1$riqueza)

# Criando um histograma
hist(df1$riqueza)


?hist
