require(dplyr)
require(tidyr)

nSp = 10
nparcela = 30
narv = 60
area = 0.1
floresta = data.frame(parcela=integer(),
                      sp=character(),
                      dap=double(),
                      altura=double(),
                      as=double())

for(p in seq(nparcela)){
  parcela = data.frame(parcela = rep(p, narv), sp = rep(0, narv) , dap = rep(0, narv), altura = rep(0, narv), as = rep(0, narv))
  for(i in seq(narv)){
    parcela$sp[i] = paste0('sp',as.character(floor(rgamma(1, 0.5, scale = nSp/2))+1))
    parcela$dap[i] = rgamma(1, 0.8, scale = 50)
    b0 = -8.8722
    b1 = 3.4217
    b2 = 0.1382
    parcela$altura[i] = (((parcela$dap[i]^2)/(b0 + b1 * parcela$dap[i] + b2 * parcela$dap[i]^2))^2)+1.3
    parcela$as[i] = pi * parcela$dap[i]^2 / 40000
  }
  floresta = rbind(floresta, parcela)
}

densidade = floresta %>%
  group_by(parcela, sp) %>%
  summarise(n = n()/area) %>%
  group_by(sp) %>%
  summarise(DA = mean(n))

densidade$DR = densidade$DA / sum(densidade$DA)


dominancia = floresta %>%
  group_by(parcela, sp) %>%
  summarise(AB = sum(as)/area) %>%
  group_by(sp) %>%
  summarise(DoA = mean(AB))

dominancia$DoR = dominancia$DoA / sum(dominancia$DoA)

frequencia = floresta %>% 
  group_by(parcela, sp) %>%
  summarise(N = n()) %>%
  group_by(sp) %>%
  summarise(FA = n())

frequencia$FR = frequencia$FA / sum(frequencia$FA)
