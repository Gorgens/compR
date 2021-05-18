Ajuste Cadeia de Markov
========================================================
author: Prof. Eric Gorgens
date: 18/05/2021
autosize: true

Agenda
========================================================

Nossa conversa de hoje:

- Bullet 1
- Bullet 2
- Bullet 3


Inventário contínuo
========================================================


|parcela | arv|cientifico.nome       | dap.2012| dap.2014|
|:-------|---:|:---------------------|--------:|--------:|
|T01     |   2|Licania guianensis    |     10.3|     10.3|
|T01     |   5|Licania canescens     |     14.6|     14.9|
|T01     |   6|Anacardium spruceanum |     78.8|     78.9|
|T01     |   7|Protium paniculatum   |     14.7|     14.7|
|T01     |   9|Protium paniculatum   |     10.6|     10.6|
|T01     |  10|Pouteria hispida      |     27.1|     27.7|


Inventário contínuo
========================================================


```r
continuo = continuo %>%
  filter(comum.nome != 'morta') %>%
  filter(comum.nome != 'liana') %>%
  filter(dap.2012 > 10) %>%
  filter(dap.2014 > 10)
```


Distribuição diamétrica em 2012
========================================================


```r
intervaloClasse = 10.0
diametroMin = 10.0

continuo = continuo %>%
  mutate(cc.2012 = (floor(dap.2012/intervaloClasse) * intervaloClasse) + (intervaloClasse/2))
```


Distribuição diamétrica em 2012
========================================================

![plot of chunk unnamed-chunk-4](apres cadeia markov ajuste-figure/unnamed-chunk-4-1.png)


Distribuição diamétrica em 2014
========================================================


```r
continuo = continuo %>%
  mutate(cc.2014 = (floor(dap.2014/intervaloClasse) * intervaloClasse) + (intervaloClasse/2))
```


Distribuição diamétrica em 2014
========================================================

![plot of chunk unnamed-chunk-6](apres cadeia markov ajuste-figure/unnamed-chunk-6-1.png)


Matriz de frequência
========================================================


```r
require(tidyr)
tabFreq = continuo %>%
  group_by(cc.2012, cc.2014) %>%
  summarise(narv = n()) %>%
  pivot_wider(names_from = cc.2012,
              values_from = narv)
```


Matriz de frequência
========================================================


| cc.2014|   15|   25|  35|  45|  55| 65| 75| 85| 95| 105| 115| 125| 145| 155| 165| 205|
|-------:|----:|----:|---:|---:|---:|--:|--:|--:|--:|---:|---:|---:|---:|---:|---:|---:|
|      15| 6560|   NA|  NA|   2|  NA| NA| NA| NA| NA|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      25|  270| 2410|  31|   1|  NA| NA| NA| NA| NA|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      35|   NA|   90| 838|   2|  NA| NA| NA| NA| NA|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      45|   NA|   NA|  62| 402|   3| NA| NA| NA| NA|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      55|   NA|   NA|   1|  24| 241|  2| NA| NA| NA|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      65|   NA|   NA|  NA|   1|  17| 84|  3| NA| NA|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      75|   NA|   NA|  NA|  NA|   1|  9| 44| NA|  1|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      85|   NA|   NA|  NA|  NA|  NA|  1|  3| 37| NA|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|      95|   NA|   NA|  NA|  NA|  NA| NA| NA|  4| 16|  NA|  NA|  NA|  NA|  NA|  NA|  NA|
|     105|   NA|   NA|  NA|  NA|  NA| NA| NA| NA|  1|   4|  NA|  NA|  NA|  NA|  NA|  NA|
|     115|   NA|   NA|  NA|  NA|  NA| NA| NA| NA| NA|   1|   2|  NA|  NA|  NA|  NA|  NA|
|     125|   NA|   NA|  NA|  NA|  NA| NA| NA| NA| NA|  NA|  NA|   4|  NA|  NA|  NA|  NA|
|     145|   NA|   NA|  NA|  NA|  NA| NA| NA| NA| NA|  NA|  NA|  NA|   2|  NA|  NA|  NA|
|     155|   NA|   NA|  NA|  NA|  NA| NA| NA| NA| NA|  NA|  NA|  NA|  NA|   2|  NA|  NA|
|     185|   NA|   NA|  NA|  NA|  NA| NA| NA| NA| NA|  NA|  NA|  NA|  NA|  NA|   1|  NA|
|     205|   NA|   NA|  NA|  NA|  NA| NA| NA| NA| NA|  NA|  NA|  NA|  NA|  NA|  NA|   1|


Remover classes outliers
========================================================


```r
for(c in 2:dim(tabFreq)[2]){
  for(l in 1:dim(tabFreq)[1]){
    if(l < c-1){
      tabFreq[l, c] = 0
    }
    if(l > c){
      tabFreq[l, c] = 0
    }
  }
}
```


Matriz de frequência
========================================================


| cc.2014|   15|   25|  35|  45|  55| 65| 75| 85| 95| 105| 115| 125| 145| 155| 165| 205|
|-------:|----:|----:|---:|---:|---:|--:|--:|--:|--:|---:|---:|---:|---:|---:|---:|---:|
|      15| 6560|    0|   0|   0|   0|  0|  0|  0|  0|   0|   0|   0|   0|   0|   0|   0|
|      25|  270| 2410|   0|   0|   0|  0|  0|  0|  0|   0|   0|   0|   0|   0|   0|   0|
|      35|    0|   90| 838|   0|   0|  0|  0|  0|  0|   0|   0|   0|   0|   0|   0|   0|
|      45|    0|    0|  62| 402|   0|  0|  0|  0|  0|   0|   0|   0|   0|   0|   0|   0|
|      55|    0|    0|   0|  24| 241|  0|  0|  0|  0|   0|   0|   0|   0|   0|   0|   0|
|      65|    0|    0|   0|   0|  17| 84|  0|  0|  0|   0|   0|   0|   0|   0|   0|   0|
|      75|    0|    0|   0|   0|   0|  9| 44|  0|  0|   0|   0|   0|   0|   0|   0|   0|
|      85|    0|    0|   0|   0|   0|  0|  3| 37|  0|   0|   0|   0|   0|   0|   0|   0|
|      95|    0|    0|   0|   0|   0|  0|  0|  4| 16|   0|   0|   0|   0|   0|   0|   0|
|     105|    0|    0|   0|   0|   0|  0|  0|  0|  1|   4|   0|   0|   0|   0|   0|   0|
|     115|    0|    0|   0|   0|   0|  0|  0|  0|  0|   1|   2|   0|   0|   0|   0|   0|
|     125|    0|    0|   0|   0|   0|  0|  0|  0|  0|   0|  NA|   4|   0|   0|   0|   0|
|     145|    0|    0|   0|   0|   0|  0|  0|  0|  0|   0|   0|  NA|   2|   0|   0|   0|
|     155|    0|    0|   0|   0|   0|  0|  0|  0|  0|   0|   0|   0|  NA|   2|   0|   0|
|     185|    0|    0|   0|   0|   0|  0|  0|  0|  0|   0|   0|   0|   0|  NA|   1|   0|
|     205|    0|    0|   0|   0|   0|  0|  0|  0|  0|   0|   0|   0|   0|   0|  NA|   1|

Remover classes sem passagem
========================================================


```r
classeCorte = 85
colCorte = ceiling(classeCorte / intervaloClasse)
linhaCorte = ceiling(classeCorte / intervaloClasse)

tabFreq = tabFreq[1:linhaCorte, 1:colCorte]
tabFreq2 = tabFreq %>%
  select(-cc.2014) %>%
  as.data.frame()
row.names(tabFreq2) = tabFreq$cc.2014
```


Matriz de frequência
========================================================


|   |   15|   25|  35|  45|  55| 65| 75| 85|
|:--|----:|----:|---:|---:|---:|--:|--:|--:|
|15 | 6560|    0|   0|   0|   0|  0|  0|  0|
|25 |  270| 2410|   0|   0|   0|  0|  0|  0|
|35 |    0|   90| 838|   0|   0|  0|  0|  0|
|45 |    0|    0|  62| 402|   0|  0|  0|  0|
|55 |    0|    0|   0|  24| 241|  0|  0|  0|
|65 |    0|    0|   0|   0|  17| 84|  0|  0|
|75 |    0|    0|   0|   0|   0|  9| 44|  0|
|85 |    0|    0|   0|   0|   0|  0|  3| 37|
|95 |    0|    0|   0|   0|   0|  0|  0|  4|


Matriz de probabilidade
========================================================


```r
tabProb = apply(tabFreq2,2,function(x){round(x/sum(x), 2)})
```


Matriz de probabilidade
========================================================


|   |   15|   25|   35|   45|   55|  65|   75|  85|
|:--|----:|----:|----:|----:|----:|---:|----:|---:|
|15 | 0.96| 0.00| 0.00| 0.00| 0.00| 0.0| 0.00| 0.0|
|25 | 0.04| 0.96| 0.00| 0.00| 0.00| 0.0| 0.00| 0.0|
|35 | 0.00| 0.04| 0.93| 0.00| 0.00| 0.0| 0.00| 0.0|
|45 | 0.00| 0.00| 0.07| 0.94| 0.00| 0.0| 0.00| 0.0|
|55 | 0.00| 0.00| 0.00| 0.06| 0.93| 0.0| 0.00| 0.0|
|65 | 0.00| 0.00| 0.00| 0.00| 0.07| 0.9| 0.00| 0.0|
|75 | 0.00| 0.00| 0.00| 0.00| 0.00| 0.1| 0.94| 0.0|
|85 | 0.00| 0.00| 0.00| 0.00| 0.00| 0.0| 0.06| 0.9|
|95 | 0.00| 0.00| 0.00| 0.00| 0.00| 0.0| 0.00| 0.1|
