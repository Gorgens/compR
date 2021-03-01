require(lidR)
require(ForestGapR)
require(raster)

# Load data and check extention
ctg = readLAScatalog("./zf2a/")
plot(ctg)

# if necessary retile
opt_chunk_buffer(ctg) = 0
opt_chunk_size(ctg) = 1000
opt_output_files(ctg) = "./zf2a_retile/NP_T-403_tile{ID}"
newctg = catalog_retile(ctg)

