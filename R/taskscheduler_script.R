library(tidyverse)
library(nhsAEscraper)
library(googlesheets)
library(taskscheduleR)

#myscript <- system.file("store_to_cloud.R", package = "taskscheduleR")
myscript <- file.path("C:","Users","iconnorh","Desktop","Imogen","Rprojects","AE_app_cloud_storage","R","store_to_cloud.R")
#myscript <- file.path("C:","Users","iconnorh","Desktop","Imogen","Rprojects","AE_app_cloud_storage","R","hello_world.R")

taskscheduler_create(taskname = "run_store_to_cloud", rscript = myscript, 
                     schedule = "MINUTE", starttime = "10:00", modifier = 2)
