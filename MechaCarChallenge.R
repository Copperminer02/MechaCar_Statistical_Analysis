#Deliverable 1. Multiple Linear Regression to Predict MPG from MechaCAr_mpg.csv datasets

# Load dplyr Package

library(dplyr)

#Read MechaCar_mpg.csv file from Resources Folder

MechaCar_Mpg <- read.csv(file="Resources/MechaCar_mpg.csv")

#Examine MechaCar_mpg Data Frame

head(MechaCar_Mpg)

#Perform multiple linear Regression predicting "mpg" from "vehicle_length", 
#"vehicle_weight","spoiler_angle", "ground_clearance" and "AWD"

mpg_mulr_reg <- lm (mpg ~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data = MechaCar_Mpg)

summary(mpg_mulr_reg)

#Deliverable 2. 

