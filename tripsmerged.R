library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(janitor)
library(lubridate)
library(viridis)


#importing all csv files and combining them

file_names <- list.files(pattern = "*.csv") 

trips <- read.csv(file_names[1], header = TRUE, sep = ",")


# cleaning column names

trips_clean <- clean_names(trips)


# checking data types of columns are correct

str(trips_clean)

# changing the data type

trips_clean$started_at <- ymd_hms(trips_clean$started_at)
str(trips_clean)

trips_clean$ended_at <- ymd_hms(trips_clean$ended_at)
str(trips_clean)

#add ride_duration column

trips_clean <- mutate(trips_clean, ride_length = ended_at - started_at)

#add weekday column

trips_clean <- mutate(trips_clean, day_of_week = wday(trips_clean$started_at, label = TRUE))

# calculate mean of ride_length

mean_ride_length <- mean(trips_clean$ride_length)


# calculate max of ride_length

max_ride_length <- max(trips_clean$ride_length)

# calculate average ride length for members and casual riders saved in a data frame

casual_member_length <- group_by(trips_clean, member_casual) %>% 
  summarise(m = mean(ride_length)) %>% 
  na.omit()


# average ride_length for users by day_of_week

trips_by_dow <- count(trips_clean, day_of_week, wt = NULL, sort = TRUE, name = "amount_trips")

# /// VISUALISATION ///

# show difference between member_length and casual_length

ggplot(data = casual_member_length) +
  geom_bar(mapping = aes(x = member_casual, y = m, fill = "member_casual"), width = 0.5, stat= "identity") +
  labs(title = "Difference between average ride length in members and casual users", x = "member type", y = "Average ride length in seconds") +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_fill_viridis(discrete = TRUE)

# show most popular days of the week


ggplot(data = trips_by_dow) +
  geom_bar(mapping = aes(x = day_of_week, y = amount_trips, fill = day_of_week), width = 0.5, stat = "identity") +
  labs(title = "Most popular day of the week", x = "Day Of The Week", y = "Amount of Trips", ) +
  theme_minimal() +
  theme(legend.position = "none") +
  scale_fill_viridis(discrete = TRUE)
