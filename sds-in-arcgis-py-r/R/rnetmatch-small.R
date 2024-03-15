library(sf)
library(rnetmatch)

# Read in Data
source_lines <- st_read(
  dsn = "sds-in-arcgis-py-r/demo.gdb",
  layer = "source_lines"
) |> st_cast("LINESTRING")

target_lines <- st_read(
  dsn = "sds-in-arcgis-py-r/demo.gdb",
  layer = "target_lines"
) |> st_cast("LINESTRING")

# Make ugly plot
plot(target_lines$SHAPE, lwd = 2)
plot(
  source_lines$SHAPE, lwd = 1,  
  add = TRUE, col = "red"
)

# identify matches between LineStrings
res <- rnet_match(source_lines, target_lines, 10, 5) 

# preview results
head(res)
