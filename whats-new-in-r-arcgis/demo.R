library(arcgis) # https://cran.r-project.org/package=arcgis


# Read Services -----------------------------------------------------------
# https://esriinc.maps.arcgis.com/home/item.html?id=9df5e769bfe8412b8de36a2e618c7672

# store FeatureLayer url
furl <-   ""

# create a reference to it
cities_fl <- arc_open(furl)
cities_fl


# Private Data ------------------------------------------------------------

# Zip Codes
# https://analysis-1.maps.arcgis.com/home/item.html?id=bce6b7648a7a4873ba959dce0d3c3f1b

furl <- "https://services1.arcgis.com/hLJbHVT9ZrDIzK0I/arcgis/rest/services/USA_Zip_Code_Locations/FeatureServer/0"

arc_open(furl)


# Authorization -----------------------------------------------------------
# Tutorial
# https://r.esri.com/r-bridge-site/location-services/connecting-to-a-portal.html
# Doc: https://r.esri.com/arcgisutils/reference/auth.html

# Different Auth Functions
code_tkn <- auth_code()   # Interactive and very safe
client_tkn <- auth_client() # Non-interactive limited
user_tkn <- auth_user()   # Non-interactive security risk


# Set token to be used
set_arc_token(code_tkn)

# How do we handle tokens?
?arc_open()

# View token
arc_token()

# Multiple Portals / Orgs
set_arc_token(
  code = code_tkn,
  client = client_tkn,
  user = user_tkn
)


# Use a specifc token
arc_open(furl, token = arc_token("user"))


# Publishing --------------------------------------------------------------


