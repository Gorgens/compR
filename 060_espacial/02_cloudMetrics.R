ctg = readLAScatalog("./2012/norm/")
opt_output_files(ctg) = "./2012/norm/{PlotID}")
opt_filter(ctg) = "-drop_z_below 0"

utmx = c(778213.068, 778634.64, 779460.208, 778939.547, 778833.454, 779459.317, 780117.275, 780806.438, 780796.631, 779089.326, 779795.428,
        778817.252, 780330.354, 778841.478, 779938.075, 779959.721, 779892.606, 780688.754, 780514.903, 779054.556, 779533.315, 780494.398)

utmy = c(9586851.835, 9583839.899, 9584151.939, 9586864.903, 9586262.22, 9586732.955, 9585502.626, 9586583.176, 9585955.53, 9584549.567,
        9584553.133, 9585339.165, 9584533.519, 9583971.847, 9584062.785, 9586538.227, 9586173.066, 9587055.693, 9585538.288, 9584983.748,
        9584911.533, 9584927.581)
r = 20

plots = clip_circle(ctg, x, y, r)

opt_independant_files(plots_ALS_clipped) = TRUE
opt_output_files(plots_ALS_clipped) = ""
plots_metrics = catalog_apply(plots_ALS_clipped, cloud_metrics, func = .stdmetrics_z)
plots_metrics = data.table::rbindlist(plots_metrics)
write.csv(plots_metrics, './2012/metrics2012.csv')
