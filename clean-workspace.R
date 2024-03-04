cw <- function() {
  unloadNamespace("arcgislayers")
  unloadNamespace("arcgisutils")
  unloadNamespace("arcgis")
  unloadNamespace("FedData")
  rm(list = setdiff(ls(1), "cw"), envir = globalenv())
}


