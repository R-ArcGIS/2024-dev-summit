res <- arc_read("https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/USA_ZIP_Code_Points_analysis/FeatureServer/0", n_max = 1e10)

n <- nrow(res)
r <- 10000

to_pub <- res[1:(n-r),]
to_save <- res[((n-r)+1):n,]

sf::st_write(to_pub, "whats-new-in-r-arcgis/notmissing-zip-codes.shp")
sf::st_write(to_save, "whats-new-in-r-arcgis/missing-zip-codes.shp")

# set_arc_token(auth_user())
# There's a C stack limit we're reaching here when publishing
# probably from it being toooo big
# publish_layer(to_pub, "USA Zip Code Points")

