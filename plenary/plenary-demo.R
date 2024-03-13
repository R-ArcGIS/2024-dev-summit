library(arcgis)

# Connect to USA Major Cities
cities_fl <- arc_open(
  "https://services.arcgis.com/P3ePLMYs2RVChkJx/ArcGIS/rest/services/USA_Major_Cities_/FeatureServer/0"
)

cities_fl

# Explore Fields ----------------------------------------

fields <- list_fields(cities_fl)
dplyr::glimpse(fields)

# Query Feature Service ---------------------------------

pops <- arc_select(
  cities_fl,
  fields = c(
    "state_abbr", "name", "population", "sqmi"
  )
)

pops

# Connect to Portal -------------------------------------

# OAuth2 Code Flow
token <- auth_code()
set_arc_token(token)
token

# Calculate population density ---------------------------

to_publish <- dplyr::mutate(
  pops,
  pop_density = POPULATION / SQMI
)

to_publish


# Publish population density -----------------------------

# publish item to private portal
published <- publish_layer(
  to_publish, "Population Density"
)

published

# connect to the new service
arc_open(
  paste0(published$services$encodedServiceURL, "/0")
)

# {arcgisutils} ------------------------------------------

# Standardized Authorization
auth_user()   # Named User
auth_client() # OAuth2 Client

# {sf} -> Esri JSON
jsn <- as_esri_featureset(to_publish[1,])
jsonify::pretty_json(jsn)

# Esri JSON -> {sf}
parse_esri_json(jsn)

# rOpenSci {FedData} ------------------------------------

# USGS Protected Areas 
PADUS <- FedData::get_padus(
  template = FedData::meve,
  label = "meve",
  extraction.dir = "output"
)

dplyr::glimpse(PADUS$Manager_Name)




