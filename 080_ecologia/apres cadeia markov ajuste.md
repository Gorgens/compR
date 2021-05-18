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
