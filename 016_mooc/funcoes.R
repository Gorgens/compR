#--------------------------------------------------------------------------------------------------
# Criando funções
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------


# A função permite criar uma sequencia de código que será ativada conforme demanda do programador, 
# pegando entrada(s) e transformando num saída(s), a partir de parâmetros que influenciam seu comportamento.
# Uma função pode ser chamada dentro de outra função

# criando uma função para estimar o diâmetro com base num modelo de Richard qualquer
est_diametro <- function(x, a, b, c) {
  (a*(1-exp(-b*x))^c)
}


# Estima diametrio aos 10 anos de idade
est_diametro(10, 15.18, 0.33, 0.98)
 
 
