library(tidyverse)
library(stringi)
library(ggplot2)
library(lubridate)

df_offers <- read_csv("data/OtoDom_data.csv")

##  Address into streets, neighbourhoods, districts, cities, voivodeships
address<-df_offers$Address

streets<- unlist(stri_extract_all_regex(address, "[^,]+(?=,[^,]*,[^,]*,[^,]*,[^,]*$)"))
neighbourhoods <- stri_trim(unlist(stri_extract_all_regex(address, "[^,]+(?=,[^,]*,[^,]*,[^,]*$)")))
districts <- str_trim(unlist(stri_extract_all_regex(address, "[^,]+(?=,[^,]*,[^,]*$)")))
cities <- stri_trim(unlist(stri_extract_all_regex(address, "[^,]+(?=,[^,]*$)")))
voivodeships <- stri_trim(stri_extract_last_regex(address, "[^,]+$"))

unique_v <- stri_unique(voivodeships)
unique_c <- stri_unique(cities)
unique_d <- stri_unique(districts)
unique_n <- stri_unique(neighbourhoods)
unique_s <- stri_unique(streets)

## Price into value and currency
prices<-df_offers$Price
prices<- stri_replace_all_regex(prices, " ", "")
price_values <- unlist(stri_extract_all_regex(prices, "[0-9.,]+"))
price_values <- as.numeric(stri_replace_all(price_values, fixed =',', '.'))
price_currency <- unlist(stri_extract_all_regex(prices, "[^0-9.,]+"))

## Area into value and unit
area<-df_offers$Area
area<- stri_replace_all_regex(area, " ", "")
area_values <- unlist(stri_extract_all_regex(area, "[0-9.,]+"))
area_values <- as.numeric(stri_replace_all(area_values, fixed =',', '.'))
area_unit <- unlist(stri_extract_all_regex(area, "[^0-9.,]+"))

## Rent into value and unit/period (600 zł/miesiąc)
rent<-df_offers$Rent
rent<- stri_replace_all_regex(rent, " ", "")
rent_values <- unlist(stri_extract_all_regex(rent, "[0-9.,]+"))
rent_values <- as.numeric(stri_replace_all(rent_values, fixed =',', '.'))
rent_unit_period <- unlist(stri_extract_all_regex(rent, "[^0-9.,]+"))

## Deposit into value and unit
deposit<-df_offers$Deposit
deposit<- stri_replace_all_regex(deposit, " ", "")
deposit_values <- unlist(stri_extract_all_regex(deposit, "[0-9.,]+"))
deposit_values <- as.numeric(stri_replace_all(deposit_values, fixed =',', '.'))
deposit_unit <- unlist(stri_extract_all_regex(deposit, "[^0-9.,]+"))

## Floor into current and Max (np. 1/3)
floors <- df_offers$Floor
split_floor <- stri_split_regex(floors, "/")
floor_actual <- as.numeric(ifelse(lengths(split_floor) > 1, sapply(split_floor, function(x) x[1]), NA))
floor_max <- as.numeric(ifelse(lengths(split_floor) > 1, sapply(split_floor, function(x) x[2]), NA))


## Outside into balcony, terrace, garden
unique(df_offers$Outdoor)
outdoor <- df_offers$Outdoor
ft<- stri_replace_all_regex(outdoor, " ", "")
ft <- stri_split(ft, fixed=",")
outdoors <- stri_sort(unique(unlist(ft)))
balcony <- sapply(ft, function(x) as.numeric(outdoors[1] %in% x))
garden <- sapply(ft, function(x) as.numeric(outdoors[3] %in% x))
terrace <-sapply(ft, function(x) as.numeric(outdoors[4] %in% x))

## Eqiupment into dishwasher,refrigerator,furniture,oven,stove,washing_machine,tv
equipment <- df_offers$Equipment 
ft2<- stri_replace_all_regex(equipment, " ", "") #erase ws
ft2 <- stri_split(ft2, fixed=",")                #split ,
equipment <- stri_sort(unique(unlist(ft2)))                  #find unique
stove <- sapply(ft2, function(x) as.numeric(equipment[2] %in% x))
refrigerator <-sapply(ft2, function(x) as.numeric(equipment[3] %in% x))
furniture <- sapply(ft2, function(x) as.numeric(equipment[4] %in% x))
oven <- sapply(ft2, function(x) as.numeric(equipment[5] %in% x))
washing_machine <- sapply(ft2, function(x) as.numeric(equipment[6] %in% x))
tv <- sapply(ft2, function(x) as.numeric(equipment[7] %in% x))
dishwasher <- sapply(ft2, function(x) as.numeric(equipment[8] %in% x))

## Security into teren_zamkniety,intercom_videophone,monitoring_security,drzwi_okna,rolety,system
security <- df_offers$Security
ft3<- stri_replace_all_regex(security, " ", "") #erase ws
ft3 <- stri_split(ft3, fixed=",")                #split ,
security <- stri_sort(unique(unlist(ft3)))                #find unique

intercom_videophone <-sapply(ft3, function(x) as.numeric(security[2] %in% x))
anti_burglary_doors_windows <- sapply(ft3, function(x) as.numeric(security[3] %in% x))
monitoring_security <- sapply(ft3, function(x) as.numeric(security[4] %in% x))
anti_burglary_rollers <- sapply(ft3, function(x) as.numeric(security[5] %in% x))
alarm_system <- sapply(ft3, function(x) as.numeric(security[6] %in% x))
closed_area <- sapply(ft3, function(x) as.numeric(security[7] %in% x))

## Parking - yes or no
parking <- df_offers$Parking
ft4<- stri_replace_all_regex(parking, " ", "") #erase ws
ft4 <- stri_split(ft4, fixed=",")               #split
parking <- stri_sort(unique(unlist(ft4)))       #find unique
garage_parking <- sapply(ft4, function(x) as.numeric(parking[2] %in% x))


## Additional_info into air_conditioning,kuchnia,basement,niepalacy,utility_room,two_story
add <- df_offers$AdditionalInfo
ft5<- stri_replace_all_regex(add, " ", "") #erase ws
ft5 <- stri_split(ft5, fixed=",")                #split ,
add <- stri_sort(unique(unlist(ft5)))                  #find unique
two_story <- sapply(ft5, function(x) as.numeric(add[2] %in% x))
air_conditioning <- sapply(ft5, function(x) as.numeric(add[3] %in% x))
separate_kitchen <-sapply(ft5, function(x) as.numeric(add[4] %in% x))
basement <- sapply(ft5, function(x) as.numeric(add[5] %in% x))
utility_room <- sapply(ft5, function(x) as.numeric(add[6] %in% x))
only_nonsmokers <- sapply(ft5, function(x) as.numeric(add[7] %in% x))

# Lift into 1 and 0
lift <- df_offers$Lift
lift <- stri_replace_all_regex(lift, "tak", "1")
lift <- stri_replace_all_regex(lift, "nie", "0")
lift <-as.numeric(lift)

## Media into Cable_TV, Internet, Telephone
media <- df_offers$Media # 
ft6<- stri_replace_all_regex(media, " ", "") #erase ws
ft6 <- stri_split(ft6, fixed=",")                #split ,
media <- stri_sort(unique(unlist(ft6)))                  #find unique
internet <- sapply(ft6, function(x) as.numeric(media[2] %in% x))
telephone <- sapply(ft6, function(x) as.numeric(media[3] %in% x))
cable_tv <-sapply(ft6, function(x) as.numeric(media[4] %in% x))

## Building year
building_year <- df_offers$BuildYear
building_year[nchar(building_year) != 4] <- "brak informacji"
building_year[as.numeric(building_year) > 2024] <-"brak informacji"
sort(unique(building_year))
build_year_range <- cut(as.numeric(building_year),
                        breaks = c(seq(1870, 2025, 10), Inf),
                        labels = paste(seq(1870, 2020, 10), seq(1879, 2029, 10), sep = "-"),
                        include.lowest = TRUE)


## Create a data frame
df <- data.frame(Link = df_offers$Link,
                 Street=streets, 
                 Neighbourhood = neighbourhoods, 
                 District = districts, 
                 City = cities, 
                 Voivodeship = voivodeships,
                 Description = df_offers$Description,
                 Title = df_offers$Title,
                 Price_Value = price_values,
                 Price_Currency = price_currency,
                 Count_photos = df_offers$CountPhotos,
                 Area_Value = area_values,
                 Area_Unit = area_unit,
                 Rent_Value = rent_values,
                 Rent_Unit_Period = rent_unit_period,
                 No_Rooms = df_offers$RoomNumber,
                 Deposit_Value = deposit_values,
                 Deposit_Unit = deposit_unit,
                 Floor_actual = floor_actual,
                 Floor_max = floor_max,
                 Building_Type = df_offers$BuildingType,
                 Balcony = balcony, 
                 Terrace = terrace, 
                 Garden = garden,
                 Construction_Status = df_offers$ConstructionStatus,
                 Advertiser_Type = df_offers$AdvertiserType,
                 Rent_To_Students = df_offers$RentToStudents,
                 Dishwasher = dishwasher,
                 Refrigerator = refrigerator,
                 Furniture = furniture,
                 Oven = oven,
                 Stove = stove,
                 Washing_machine = washing_machine,
                 Tv = tv,
                 Cable_TV = cable_tv, 
                 Internet = internet, 
                 Telephone = telephone,
                 Heating = df_offers$Heating,
                 Closed_area = closed_area,
                 Intercom_videophone = intercom_videophone,
                 Monitoring_security = monitoring_security,
                 Anti_burglary_doors_windows = anti_burglary_doors_windows,
                 Anti_burglary_rollers = anti_burglary_rollers,
                 Alarm_system = alarm_system,
                 Windows_Type = df_offers$Windows,
                 Lift = lift, 
                 Garage_Parking = garage_parking,
                 Build_Year = building_year,
                 Build_Year_Range = build_year_range,
                 Building_Material = df_offers$BuildingMaterial,
                 Air_conditioning = air_conditioning,
                 Separate_kitchen = separate_kitchen,
                 Basement = basement,
                 Only_nonsmokers = only_nonsmokers,
                 Utility_room = utility_room,
                 Two_story = two_story
                 )



## Checking the unique units
unique(df$Deposit_Unit)
unique(df$Price_Currency)
unique(df$Rent_Unit_Period)

# Changing into one unit (PLN)
df <- df %>%
  mutate(Price_Value = if_else(Price_Currency == "EUR", Price_Value * 4.3484, Price_Value)) %>%
  mutate(Price_Currency = if_else(Price_Currency == "EUR", "zł", Price_Currency)) %>%
  mutate(Rent_Value = if_else(Rent_Unit_Period == "EUR/miesiąc", Rent_Value * 4.3484, Rent_Value)) %>%
  mutate(Rent_Unit_Period = if_else(Rent_Unit_Period == "EUR/miesiąc", "zł/miesiąc", Rent_Unit_Period))%>%
  mutate(Deposit_Value = if_else(Deposit_Unit == "EUR", Deposit_Value * 4.3484, Deposit_Value)) %>%
  mutate(Deposit_Unit = if_else(Deposit_Unit == "EUR", "zł", Deposit_Unit))

## Checking the unique units
unique(df$Deposit_Unit)
unique(df$Price_Currency)
unique(df$Rent_Unit_Period)

#write_csv(df, file = "data/Oto_Dom_cleaned.csv")

df2 <- data.frame(Link = df_offers$Link,
                 District = districts, 
                 Price_Value = price_values,
                 Area_Value = area_values
)



# Changing into one unit (PLN)
df2 <- df %>%
  mutate(Price_Value = if_else(Price_Currency == "EUR", Price_Value * 4.3484, Price_Value)) %>%
  mutate(Price_Currency = if_else(Price_Currency == "EUR", "zł", Price_Currency)) 

df2 <- data.frame(Link = df_offers$Link,
                  District = districts, 
                  Price_Value = price_values,
                  Area_Value = area_values
)

write_csv(df2, file = "data/Oto_Dom_matlab.csv")

