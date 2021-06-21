require(lidR)
require(raster)
require(dplyr)

# digital terrain model creation
ctg = readLAScatalog("./gnd/")
opt_chunk_buffer(ctg) = 100
opt_chunk_size(ctg) = 500
opt_output_files(ctg) = "./dtm/{*}_dtm"
dtm_ctg = grid_terrain(ctg, res = 1, algorithm = knnidw(), na.rm = TRUE)
