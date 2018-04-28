#--------------------------------------------------------------------------------------------------
# Memória e histórico
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------

# Aula 7
#--------------------------------------------------------
# Manipulando objetdos na memória
a = 2
2 + 2
a + 2
b = a + a

ls() # retorna lista de objetos carregados na memória
rm(a) # deleta objeto a da memória

#--------------------------------------------------------
# Administrando histórico
history() # mostra os últimos 25 commandos
savehistory(file="myfile") # salva o histórico com a extensão padrão ".Rhistory"
loadhistory(file="myfile") # recupera um histórico salvo em extensão padrão ".Rhistory"
