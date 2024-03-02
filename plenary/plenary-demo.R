library(arcgis)

# Store Feature Service URL
furl <- "https://services.arcgis.com/P3ePLMYs2RVChkJx/ArcGIS/rest/services/USA_Major_Cities_/FeatureServer/0"

# Create a FeatureLayer object
cities_fl <- arc_open(furl)
cities_fl # view

# Read from the FeatureLayer
pops <- arc_select(
  cities_fl,
  fields = c("state_abbr", "name", "population", "sqmi")
)

# preview it
pops

# Plot the geometry
plot(sf::st_geometry(pops))

# authorize to portal w/ named user
token <- auth_user()
set_arc_token(token)
token # view token

# publish item to private portal
# published <- publish_layer(pops, "USA City Pop")
published

# get service url
new_service_url <- published$services$encodedServiceURL

# connect to the new service
arc_open(new_service_url)


# {arcgisutils} -----------------------------------------------------------
# OAuth2 Code Flow
auth_code()

# Convert sf point to Esri JSON
pnt <- sf::st_point(c(3, 0.14, 0.00159))
jsn <- as_esri_geometry(pnt)
jsonify::pretty_json(jsn)
