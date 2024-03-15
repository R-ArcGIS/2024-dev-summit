library(sf)
library(arcgisbinding)

tool_exec <- function(in_params, out_params) {

  # Read Source Lines
  source_sf <- arc.open(in_params[["source_roads"]]) |>
    arc.select() |>
    arc.data2sf() |>
    st_cast("LINESTRING")

  # Read Target Lines
  target_sf <- arc.open(in_params[["tar_roads"]]) |>
    arc.select() |>
    arc.data2sf() |>
    st_cast("LINESTRING")

  # Development package:
  # https://github.com/nptscot/rnetmatch
  matches <- rnetmatch::rnet_match(
    target_sf, source_sf,
    dist_tolerance = in_params[["dist_tol"]],
    angle_tolerance = in_params[["angle_tol"]]
  )

  # write to output
  arc.write(out_params[["output"]], matches, overwrite = TRUE)

  # Return layer
  return(out_params)

}