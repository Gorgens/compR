#--------------------------------------------------------------------------------------------------
# Análise de correlação visual
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------
data(mtcars)
head(mtcars)

require(corrgram) # ativa pacote
# install.packages("corrgram") # Comando para instalar o pacote
corrgram(mtcars, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pts, text.panel=panel.txt,
         main="Correlograma") 
