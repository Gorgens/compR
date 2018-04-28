
#--------------------------------------------------------------------------------------------------
# Exemplo de uso do teste t
#
# Gorgens, Eric Bastos
# Departamento de Engenharia Florestal
# Universidade Federal dos Vales do Jequitinhonha e Mucuri - UFVJM
# Diamantina, Brazil
# eric.gorgens (at) ufvjm.edu.br
#
#--------------------------------------------------------------------------------------------------


require(stats)
## Classical example: Student's sleep data
## Formula interface
t.test(extra ~ group, data = sleep)
