library(sf)
library(arcgisbinding)
# arc.check_product()

tool_exec <- function(in_params, out_params) {
  
  source_sf <- arc.open(in_params[["source_roads"]]) |> 
    arc.select() |> 
    arc.data2sf() |>
    st_cast("LINESTRING")
  
  target_sf <- arc.open(in_params[["tar_roads"]]) |> 
    arc.select() |> 
    arc.data2sf() |> 
    st_cast("LINESTRING")
  
  matches <- rnetmatch::rnet_match(
    target_sf, source_sf,
    dist_tolerance = in_params[["dist_tol"]],
    angle_tolerance = in_params[["angle_tol"]]
  )
  
  arc.write(out_params[["output"]], matches, overwrite = TRUE)
  
  return(out_params)
}