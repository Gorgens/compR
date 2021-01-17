library(lidR)
rm(list = ls(globalenv()))
gc()

# =====================
#  INVENTÁRIO FLORESTAL
# =====================

las = readLAS("data/MixedEucaNat_normalized.laz")

# extraindo dados por parcela
n = 3

set.seed(1)
x = runif(n, min(las$X), max(las$X))

set.seed(1)
y = runif(n, min(las$Y), max(las$Y))

lasplots = lasclipCircle(las, x, y, 10)

?lasmetrics

lasmetrics(lasplots[[1]], mean(Z))
lasmetrics(lasplots[[2]], quantile(Z, c(0.1, 0.5, 0.9)))

?.stdmetrics

zmetrics  = lasmetrics(lasplots[[3]], stdmetrics_z(Z))
zmetrics2 = lasmetrics(lasplots[[3]], .stdmetrics_z)

length(zmetrics)
length(zmetrics2)

zmetrics


# extraindo dados da área toda

?grid_metrics

hmean = grid_metrics(las, mean(Z), 10)
hmean
plot(hmean)

pixelside = sqrt( pi * 10^2 )
zgrid = grid_metrics(las, .stdmetrics_z, pixelside)

plot(zgrid)
nlayers(zgrid)

names(zgrid)
plot(zgrid, 'zmean')


# usando função customizada

func = function(h, i){ 3.3*max(h)^2 * mean(i)/max(i) }
funcgrid = grid_metrics(las, func(Z, Intensity), 10)
plot(funcgrid)

rdm = function(z){
  zbase = z[z < 5]
  n = length(zbase)
  density = ifelse(n == 0, 2, length(zbase[zbase > 1]) / n )
  return(density)
}
rdmgrid = grid_metrics(las, rdm(Z), 1)
plot(rdmgrid, main='rdm')
