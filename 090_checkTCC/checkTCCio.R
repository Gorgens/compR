require(svDialogs)

quests = read.csv('tcc check list.csv', sep = ';', dec = '.', encoding = 'UTF-8')

sink("gustavo.txt")

aluno = 'Gustavo Ragosino da Silveira'
cat('Informo que o trabalho de conclusão de curso apresentado pelo(a) aluno(a) ')
cat(aluno)
cat(' precisa de algumas correções referentes ao padrão de normalização da UFVJM a saber:')
cat("\n")
for(q in quests$Check){
    out = winDialog(type = c("yesno"), paste0(quests[q,2]))
    if(out == 'NO'){
      cat('- ')
      cat(quests[q,3])
      cat("\n")
    } else {next}
}
cat('As normas da UFVJM podem ser consultadas em  http://acervo.ufvjm.edu.br/jspui/bitstream/1/936/15/manual_normalizacao_2019.pdf')
cat("\n")
cat('Após as correções, o documento deve ser novamente incluído no SEI e um novo ofício de encaminhamento deve ser assinado. Para o aluno ser aprovado toda a documentação deve estar completa até a data de finalização do semestre.')
cat("\n")
sink()
