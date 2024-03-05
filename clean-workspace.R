cw <- function() {
  unloadNamespace("arcgislayers")
  unloadNamespace("arcgisutils")
  unloadNamespace("arcgis")
  unloadNamespace("FedData")
  rm(list = setdiff(ls(1), "cw"), envir = globalenv())
}


# Delete existing Feature Services for USA cities
# Make sure windows are the correct size 
# Make this clean up part of the demo
# shut off teams - turn off all demos
# Can i hide my dock?
# screen size
# collapse all sections