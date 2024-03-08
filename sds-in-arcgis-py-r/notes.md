# Spatial Data Science in ArcGIS Using Python and R

 - Thursday, Mar 14
 - 10:30 AM - 11:30 AM PDT (1:30 PM - 2:30 PM EDT)
 - Mesquite C | PSCC

## Description
Python and R are crucial in data science and provide powerful functionality that expands the capabilities of ArcGIS. This technical session will teach you how to integrate both open-source statistical packages with ArcGIS tools for spatial data science workflows. See how to take the guesswork out of transferring data between ArcGIS and the Python and R environments. The session will expect some knowledge of data manipulation in Python and R, as well as familiarity with running ArcPy geoprocessing tools.


## Notes 2024-02-28

powerful workflow to demonstrate:

 - unit of analysis is a GP tool,
 - ArcPy orchestrating all the things....
 - build an R GP tool, ArcPy can call it build it, model builder flow, ...
 - [server too!]

weak spots: serialization / deserialization, ….

 - reads, writes, reads, writes, … in memory, slows us down
 - Arrow each of these processes results of something in memory

DO A BASIC WORKFLOW, ...

Integration options:

 - stats side, could use [geostan](https://connordonegan.github.io/geostan/)
 - Josiah did work on [road segmentation package](https://cran.r-project.org/web/packages/stplanr/index.html)

PYSAL library
 - we don't have: measures of spatial segregation and inequality


[other things possibly: seaborn, data workflows (Airflow?), …]



# Broad outline 

FOUNDATIONS

GP

DEEP LEARNING
 - less exiting to present since it'll be well covered in the overall session content, but could touch on in slides

R + PYTHON
 - strengths and dual language power

FUTURE
 - "Road ahead", some context on where we are going next
