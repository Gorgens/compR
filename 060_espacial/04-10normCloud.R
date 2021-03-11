#setwd('/home/gorgens/Documents/R gap dynamics')

require(lidR)
require(raster)

# ground classification
ctg = readLAScatalog("./2012/org/")
opt_chunk_buffer(ctg) = 30
opt_chunk_size(ctg) = 1000
opt_output_files(ctg) = "./2012/gnd/cau2012_gnd{ID}"
classified_ctg = classify_ground(ctg, csf())
rm(classified_ctg)

# digital terrain model creation
ctg = readLAScatalog("./2012/gnd/")
opt_chunk_buffer(ctg) = 30
opt_chunk_size(ctg) = 1000
opt_output_files(ctg) = "./2012/dtm/cau2012_dtm{ID}"
dtm_ctg = grid_terrain(ctg, res = 1, algorithm = tin())

# normalize cloud
ctg = readLAScatalog("./2012/gnd/")
opt_chunk_buffer(ctg) = 30
opt_chunk_size(ctg) = 500
opt_output_files(ctg) = "./2012/norm/cau2012_norm{ID}"
norm_ctg = normalize_height(ctg, dtm_ctg)
rm(dtm_ctg, norm_ctg)
