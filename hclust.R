library(arcgisbinding)

tool_exec <- function(in_params, out_params) {
  
  # Input FeatureClass
  in_fp <- in_params[["in_fclass"]]
  
  # Input Variables
  vars <- unlist(in_params[["vars"]])
  
  # Update Progressor 
  arc.progress_label("Reading layer")
  arc.progress_pos(10)
  
  # Read in FP to sf object
  in_sf <- arc.open(in_fp) |>
    arc.select() |>
    arc.data2sf()
  
  # we can be confident that the variables 
  # are always present b/c we make vars dependent 
  # upon in_fclass
  arc.progress_label("Creating distance matrix")
  arc.progress_pos(35)
  dist_mat <- dist(
    sf::st_drop_geometry(in_sf)[vars],           # Select variables
    method = tolower(in_params[["dist_method"]]) # Distance method
  )
  
  # update progressor 
  arc.progress_label("Calculating clusters")
  arc.progress_pos(65)
  
  # Hierarchical Clustering
  clusts <- hclust(
    dist_mat, 
    method = in_params[["agg_method"]]
  )
  
  # cut the clusters
  clusters <- cutree(clusts, k = in_params[["n"]])
  
  # assign back to input
  in_sf[["cluster_result"]] <- clusters
  
  # update progressor 
  arc.progress_label("Writing results")
  arc.progress_pos(95)
  
  # Extract output name
  out_fp <- out_params[["out_fclass"]]
  
  # write to output
  sf::st_write(
    in_sf[, -1],           # Drop OBJECT ID 
    dsn = dirname(out_fp), # Extract GDB name
    basename(out_fp),      # Extract layer name
    driver = "OpenFileGDB",
    delete_layer = TRUE
  )
  
  # Return output
  out_params
  
}