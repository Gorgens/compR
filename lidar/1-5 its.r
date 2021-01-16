library(lidR)
rm(list = ls(globalenv()))
gc()

# ===================================
#  SEGMENTAÇÃO DE ÁRVORES INDIVIDUAIS
# ===================================

las = readLAS("data/MixedEucaNat_normalized.laz")
col1 = height.colors(50)
col2 = pastel.colors(900)

# baseado em CHM
chm = grid_canopy(las, 0.5, p2r(0.15))
plot(chm, col = col1)

# smooth
kernel = matrix(1,3,3)
schm = raster::focal(chm, w = kernel, fun = median, na.rm = TRUE)
plot(schm, col = height.colors(30))


# detecção das árvores

?tree_detection

ttops = tree_detection(schm, lmf(2.5))
head(ttops)

x11()
plot(schm, col = col1)
plot(ttops, col = "black", add = T)


# segmentação

?lastrees

las = lastrees(las, dalponte2016(schm, ttops))

plot(las, color = "treeID", colorPalette = col2)

tree25 = lasfilter(las, treeID == 25)
tree125 = lasfilter(las, treeID == 125)

plot(tree25)
plot(tree125)

# resultado em raster
trees = dalponte2016(chm = chm, treetops = ttops)()

plot(trees, col = col2)
plot(ttops, add = TRUE)

# visualização em 3D
ttops = tree_detection(las, lmf(3, hmin = 5))
x = plot(las)
add_treetops3d(x, ttops)


# segmentação direto na nuvem

las = lastrees(las, li2012())

plot(las, color = "treeID", colorPalette = col2)


# métricas por árvore

ttops = tree_detection(schm, lmf(2.5))
las = lastrees(las, dalponte2016(schm, ttops))

plot(las, color = "treeID", colorPalette = col2)

?tree_metrics

metrics = tree_metrics(las, list(n = length(Z), h = max(Z)))
metrics
head(metrics@data)
spplot(metrics, "n")
spplot(metrics, "h")

# função customizada
treearea = function(x, y){
  ch = chull(x,y)
  ch = c(ch, ch[1])
  coords = data.frame(x = x[ch], y = y[ch])
  p  = sp::Polygon(coords)
  area = p@area
  return(list(A = area))
}

metrics = tree_metrics(las, treearea(X,Y))
metrics
spplot(metrics, "A")

metrics = tree_metrics(las, .stdtreemetrics)
metrics


# delineamento de copa

?tree_hulls

cvx_hulls = tree_hulls(las)
cvx_hulls

plot(cvx_hulls)
plot(ttops, add = TRUE)

cvx_hulls$A = metrics$convhull_area

spplot(cvx_hulls, "A")
