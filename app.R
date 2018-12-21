library(shiny)
library(tidyverse)
library(nhsAEscraper)
library(googlesheets)
library(taskscheduleR)

#code to download NHS England and Scotland data and upload it to the cloud

AE_Data <- nhsAEscraper::getAE_data(country = "England",
                                    directory = file.path("C:","Users","iconnorh","Desktop","Imogen",
                                                          "Rprojects","AE_app_cloud_storage", "data-raw","sitreps"))

#avoids bug that is caused by two of the cells (East Sussex Healthcare, Att_Type_2 and Att_All on 2016-01-01) which are not in integer format
AE_Data <- AE_Data %>%
  mutate(Att_Typ2 = as.integer(Att_Typ2), Att_All = as.integer(Att_All))
AE_Data_Scot <- nhsAEscraper::getAE_data(country = "Scotland",
                                         directory = file.path("C:","Users","iconnorh","Desktop","Imogen",
                                                               "Rprojects","AE_app_cloud_storage", "data-raw","sitreps"))

urls_of_data <- as.vector(nhsAEscraper::getAEdata_urls_monthly(country = "England"))
urls_of_Scotland_data <- as.vector(nhsAEscraper::getAEdata_urls_monthly(country = "Scotland"))

#AE_Data_cloud
#gs_title("AE_Data_cloud")
gs_key("1UGp3yYPigdO-qNYcaQtTScLmov9ojrZUZ3eQyCQA018")
write.csv(AE_Data,"AE_Data_cloud.csv", row.names = F)
gs_upload(file = "AE_Data_cloud.csv", overwrite = T)
file.remove("AE_Data_cloud.csv")

# AE_Data_Scot
#gs_title("AE_Data_Scot_cloud")
gs_key("1CqFtV5T8AOUEoXKvMtnHw5a3K2FN_hO1ilzv7wEa-hw")
write.csv(AE_Data_Scot,"AE_Data_Scot_cloud.csv", row.names = F)
gs_upload(file = "AE_Data_Scot_cloud.csv", overwrite = T)
file.remove("AE_Data_Scot_cloud.csv")

# urls_of_data
#gs_title("urls_of_data_cloud")
gs_key("1RloieVFGtJxUbFTwCZrvNskc0WcF0nnDiJaDDHiUYTc")
write.csv(urls_of_data,"urls_of_data_cloud.csv", row.names = F)
gs_upload(file = "urls_of_data_cloud.csv", overwrite = T)
file.remove("urls_of_data_cloud.csv")

# urls_of_Scotland_data
#gs_title("urls_of_Scotland_data_cloud")
gs_key("1Hw0k6vSID7J5LdFB5K7UIo22ooF7Fb6WTAHEuTDR4Jk")
write.csv(urls_of_Scotland_data,"urls_of_Scotland_data_cloud.csv", row.names = F)
gs_upload(file = "urls_of_Scotland_data_cloud.csv", overwrite = T)
file.remove("urls_of_Scotland_data_cloud.csv")

ui <- fluidPage()
server <- function(input, output) {}
shinyApp(ui = ui, server = server)