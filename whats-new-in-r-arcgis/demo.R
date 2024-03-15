library(arcgis)


# Read Services -----------------------------------------------------------
# Living Atlas USA Major Cities
# https://esriinc.maps.arcgis.com/home/item.html?id=9df5e769bfe8412b8de36a2e618c7672

# store FeatureLayer url
furl <- "https://services.arcgis.com/P3ePLMYs2RVChkJx/ArcGIS/rest/services/USA_Major_Cities_/FeatureServer/0"

# create a reference to it
cities_fl <- arc_open(furl)
cities_fl

# Read from it:
arc_select(cities_fl)

# Private Data ------------------------------------------------------------
# NOTE: this will not work with your machine
# use a different private layer

# Zip Codes
furl <- "https://services1.arcgis.com/hLJbHVT9ZrDIzK0I/arcgis/rest/services/USA_Zip_Code_Locations/FeatureServer/0"

# We expect an error because we haven't authorized
arc_open(furl)


# Authorization -----------------------------------------------------------
# Tutorial
# https://r.esri.com/r-bridge-site/location-services/connecting-to-a-portal.html
# Doc: https://r.esri.com/arcgisutils/reference/auth.html

# Different Auth Functions
code_tkn <- auth_code()     # Interactive and very safe
client_tkn <- auth_client() # Non-interactive limited
user_tkn <- auth_user()     # Non-interactive security risk


# Set token to be used
set_arc_token(code_tkn)

# How do we handle tokens?
# ?arc_open()

# View token
arc_token()

# Multiple Portals / Orgs
set_arc_token(
  code = code_tkn,
  client = client_tkn,
  user = user_tkn
)

# Use a specific token
flayer <- arc_open(furl, token = arc_token("user"))
flayer

# Adding Features ---------------------------------------------------------

library(sf)

# Add new features to existing services
to_add <- sf::read_sf("whats-new-in-r-arcgis/data/missing-zip-codes.shp")
add_results <- add_features(flayer, to_add)


# Publishing --------------------------------------------------------------

# Create a new service
publish_layer(to_add, "Missing Zip Code Points")

# Community ---------------------------------------------------------------

# GitHub discussions: https://github.com/R-ArcGIS/arcgislayers/discussions
# Report site/doc issues: https://r.esri.com/r-bridge-site
# Contribute: https://github.com/R-ArcGIS/arcgislayers/graphs/contributors


# Geoprocessing Tools -----------------------------------------------------

# https://r.esri.com/r-bridge-site/geoprocessing-tools.html#overview


