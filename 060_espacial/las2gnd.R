require(lidR)
require(raster)
require(dplyr)

# ground classification
ctg = readLAScatalog("./las/")
opt_chunk_buffer(ctg) = 30
#opt_chunk_size(ctg) = 500
opt_output_files(ctg) = "./gnd/{*}_gnd"
#mycsf = csf(sloop_smooth = TRUE, class_threshold = 1, cloth_resolution = 1, time_step = 1)
classified_ctg = classify_ground(ctg, csf())
