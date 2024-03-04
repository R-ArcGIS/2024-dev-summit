\library(arcgis)

# Store Feature Service URL
furl <- "https://services.arcgis.com/P3ePLMYs2RVChkJx/ArcGIS/rest/services/USA_Major_Cities_/FeatureServer/0"

# open web page
browseURL(furl)

# Create a FeatureLayer object
cities_fl <- arc_open(furl)

# view
cities_fl

# view all fields
list_fields(cities_fl) |>
  tibble::as_tibble()

# Read from the FeatureLayer
pops <- arc_select(
  cities_fl,
  fields = c("state_abbr", "name", "population", "sqmi")
)

# preview it
pops

# authorize to portal
token <- auth_code()
set_arc_token(token)

# view token
token

# publish item to private portal
published <- publish_layer(pops, ids::adjective_animal())
published

# extract published URL
published_url <- published$services$encodedServiceURL

# open in the browser
browseURL(
  paste0(published_url, "?token=", token$access_token)
)

# connect to the new service
arc_open(published_url)

# FedData -----------------------------------------------------------------

suppressMessages(library(FedData))

PADUS <- get_padus(
  template = FedData::meve,
  label = "meve"
)

PADUS


# {arcgisutils} -----------------------------------------------------------
# OAuth2 Code Flow
auth_code()

# Convert sf point to Esri JSON
pnt <- sf::st_point(c(3, 0.14, 0.00159))
jsn <- as_esri_geometry(pnt)
jsonify::pretty_json(jsn)
