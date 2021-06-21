require(lidR)
require(raster)
require(dplyr)

# Testing code
# view = readLAS('./clean/szn_clean10.las')
# view = filter_poi(view, !duplicated(view@data, by = c("X", "Y")))
# las_check(view)
# plot(view)
# view %>% classify_ground(algorithm = csf(sloop_smooth = TRUE, class_threshold = 1, cloth_resolution = 1, time_step = 1)) %>%
#   grid_terrain(res = 2, algorithm = knnidw(k = 10L, p = 2)) %>% writeRaster('teste.tif')


# retile clouds
ctg = readLAScatalog("./las/")
opt_filter(ctg) = "-drop_withheld"
opt_chunk_size(ctg) = 500
opt_chunk_buffer(ctg) = 20
opt_output_files(ctg) = "./retile/szn_retile{ID}"
catalog_retile(ctg)


# noise clean
ctg = readLAScatalog("./las/")
opt_chunk_buffer(ctg) = 50
opt_output_files(ctg) = "./clean/szn_clean{ID}"
lasnoise = function(cluster, res = 5, n = 6){
  las = readLAS(cluster)
  las = filter_poi(las, !duplicated(las@data, by = c("X", "Y")))
  las = filter_poi(las, buffer == 0)
  las = filter_poi(las, Z >= 0)
  if (is.empty(las)) return(NULL)
  las = classify_noise(las, ivf(res = res, n = n))
  las = filter_poi(las, Classification != 18)
  return(las)
}
catalog_sapply(ctg, lasnoise)

# ground classification
ctg = readLAScatalog("./las/")
opt_chunk_buffer(ctg) = 10
#opt_chunk_size(ctg) = 500
opt_output_files(ctg) = "./gnd/szn_gnd{ID}"
mycsf = csf(sloop_smooth = TRUE, class_threshold = 1, cloth_resolution = 1, time_step = 1)
classified_ctg = classify_ground(ctg, mycsf)


# digital terrain model creation
ctg = readLAScatalog("./gnd/")
opt_chunk_buffer(ctg) = 100
opt_chunk_size(ctg) = 500
opt_output_files(ctg) = "./dtm/szn_dtm{ID}"
dtm_ctg = grid_terrain(ctg, res = 1, algorithm = knnidw(), na.rm = TRUE)

plot(dtm_ctg, main = 'Fazenda B MDT')
