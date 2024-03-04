# Whats new in R and ArcGIS
Josiah ParryNick Giner

Topics to cover:

## What is new

- [ ] `{arcgis}` metapackage
  - a new focus on supporting broader ArcGIS Location Services natively
    from R
  - web GIS is growing need to provide access via R
- [ ] `{arcgislayers}` for reading
- [ ] `{arcgisutils}` for authorizing to your organization
- [ ] Future plans:
  - geocoding first
  - unsure what will have the most impact after that, would like to hear
    from folks in the audience ngl
- [ ] `{arcgisbinding}` embedded R scripts
  - this means that toolboxes using R scripts are now portable
    - you can share just the toolbox and don’t have to have people copy
      files over to support the tool box

## Workflows to illustrate

### `{arcgis}`

- arcgis read, auth, write
  - truncate and append workflow?

### `{arcgisbinding}`

- embedded GP R-script tool

- call GP tool using arcpy

- make model builder with the new tool

- illustrate reading from SDE file for large geodatabase reading

## Future paths:

### Location services

- Support additional location services
  - geocoding is next
  - after that? places, routing? What say ye? analysis?
  - generic GP service calling?

### ArcGIS Pro

- lightweight arcpy bindings
- ArcGIS Toolboxes from pure R code
  - e.g. roxygen style comments
  - similar to pyt file