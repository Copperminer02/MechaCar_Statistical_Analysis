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

#Deliverable 2. Summary Statistics on Suspension Coils

#Read Suspension_Coil.csv file from Resources Folder

Suspension_Coil <- read.csv(file="Resources/Suspension_Coil.csv")

#Examine Suspension_Coil dataframe
head(Suspension_Coil)

#create total summary dataframe to hole Mean, Median, Variance and SD for PSI Column

total_summary <- summarize(Suspension_Coil,Mean=mean(PSI), Median = median(PSI), Variance =var(PSI), SD = sd(PSI))

# create summary statistics grouped by lot 

lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI), Median = median(PSI), Variance =var(PSI), SD = sd(PSI))

