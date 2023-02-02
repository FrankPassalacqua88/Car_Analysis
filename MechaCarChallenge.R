# part 1
library("dplyr")

MechCar_mpg <- read.csv("MechaCar_mpg.csv")

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechCar_mpg)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechCar_mpg))

#part 2
Suspension_Coil <- read.csv("Suspension_Coil.csv")

total_summary <- Suspension_Coil %>% summarise(mean(PSI), median(PSI), var(PSI), sd(PSI))

lot_summary  <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarise(mean(PSI), median(PSI), var(PSI), sd(PSI))

#part 3
t.test(Suspension_Coil$PSI, mu=1500)

lot1 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot1")
lot2 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot2")
lot3 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot3")

t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)
