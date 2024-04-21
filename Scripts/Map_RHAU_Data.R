library(here)
library(sf)
library(ggplot2)
library(ggmap)
library(stringr)
library(lubridate)

# This is Sarah's Google Key
# Each person needs to obtain their own key 
#register_google(key = "XXXXXX", write = TRUE)

# Get a Google map 
# Probably ways to make this prettier... 
map1 <- get_googlemap(center = c(lon = -122.9, lat = 48.3), zoom = 10, maptype = "satellite")
map2 <- get_googlemap(center = c(lon = -122.9, lat = 48.1), zoom = 9, maptype = "satellite")
map3 <- get_googlemap(center = c(lon = -122.9, lat = 48.1), zoom = 10, maptype = "satellite")

# Read in individual RHAU_data
RHAU_45653 <- read.csv("Data/RHAU_data/RHAU_tags/Processed_data/CSV/Obs180723_103802_Tag45653.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
RHAU_45653 <- RHAU_45653[which(RHAU_45653[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(RHAU_45653) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(RHAU_45653$YEAR, RHAU_45653$MONTH, RHAU_45653$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(RHAU_45653$HOUR, RHAU_45653$MINUTE, RHAU_45653$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
RHAU_45653$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual RHAU_data
RHAU_45659 <- read.csv("Data/RHAU_data/RHAU_tags/Processed_data/CSV/Obs180723_103802_Tag45659.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
RHAU_45659 <- RHAU_45659[which(RHAU_45659[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(RHAU_45659) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(RHAU_45659$YEAR, RHAU_45659$MONTH, RHAU_45659$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(RHAU_45659$HOUR, RHAU_45659$MINUTE, RHAU_45659$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
RHAU_45659$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual RHAU_data
RHAU_45701 <- read.csv("Data/RHAU_data/RHAU_tags/Processed_data/CSV/Obs180723_103802_Tag45701.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
RHAU_45701 <- RHAU_45701[which(RHAU_45701[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(RHAU_45701) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(RHAU_45701$YEAR, RHAU_45701$MONTH, RHAU_45701$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(RHAU_45701$HOUR, RHAU_45701$MINUTE, RHAU_45701$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
RHAU_45701$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual RHAU_data
RHAU_44149 <- read.csv("Data/RHAU_data/RHAU_tags/Processed_data/CSV/Obs230622_102607_Tag44149.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
RHAU_44149 <- RHAU_44149[which(RHAU_44149[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(RHAU_44149) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(RHAU_44149$YEAR, RHAU_44149$MONTH, RHAU_44149$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(RHAU_44149$HOUR, RHAU_44149$MINUTE, RHAU_44149$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
RHAU_44149$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual RHAU_data
RHAU_45663 <- read.csv("Data/RHAU_data/RHAU_tags/Processed_data/CSV/Obs260723_112505_Tag45663.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
RHAU_45663 <- RHAU_45663[which(RHAU_45663[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(RHAU_45663) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(RHAU_45663$YEAR, RHAU_45663$MONTH, RHAU_45663$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(RHAU_45663$HOUR, RHAU_45663$MINUTE, RHAU_45663$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
RHAU_45663$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual RHAU_data
RHAU_45672 <- read.csv("Data/RHAU_data/RHAU_tags/Processed_data/CSV/Obs260723_112505_Tag45672.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
RHAU_45672 <- RHAU_45672[which(RHAU_45672[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(RHAU_45672) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(RHAU_45672$YEAR, RHAU_45672$MONTH, RHAU_45672$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(RHAU_45672$HOUR, RHAU_45672$MINUTE, RHAU_45672$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
RHAU_45672$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual RHAU_data
RHAU_45695 <- read.csv("Data/RHAU_data/RHAU_tags/Processed_data/CSV/Obs260723_112505_Tag45695.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
RHAU_45695 <- RHAU_45695[which(RHAU_45695[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(RHAU_45695) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(RHAU_45695$YEAR, RHAU_45695$MONTH, RHAU_45695$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(RHAU_45695$HOUR, RHAU_45695$MINUTE, RHAU_45695$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
RHAU_45695$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())


#MAKE MAPS 

#set up title for map 
title45653 <- paste("RHAU Tag 45653,",nrow(RHAU_45653),"locs,",min(RHAU_45653$DATE.TIME),"to",max(RHAU_45653$DATE.TIME),sep=" ")

map45653 <- 
  ggmap(map1) +   
  geom_point(data = RHAU_45653[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45653) +
  theme(panel.background = element_rect(fill = "white"), 
      panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
      plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_RHAU45653.png",width = 4, scale = 2.5)


#set up title for map 
title45659 <- paste("RHAU Tag 45659,",nrow(RHAU_45659),"locs,",min(RHAU_45659$DATE.TIME),"to",max(RHAU_45659$DATE.TIME),sep=" ")

map45659 <- 
  ggmap(map2) +   
  geom_point(data = RHAU_45659[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45659) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_RHAU45659.png",width = 4, scale = 2.5)


#set up title for map 
title45701 <- paste("RHAU Tag 45701,",nrow(RHAU_45701),"locs,",min(RHAU_45701$DATE.TIME),"to", max(RHAU_45701$DATE.TIME),sep=" ")


map45701 <- 
  ggmap(map1) +   
  geom_point(data = RHAU_45701[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45701) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_RHAU45701.png",width = 4, scale = 2.5)


#set up title for map 
title44149 <- paste("RHAU Tag 44149,",nrow(RHAU_44149),"locs,",min(RHAU_44149$DATE.TIME),"to",max(RHAU_44149$DATE.TIME),sep=" ")

map44149 <- 
  ggmap(map1) +   
  geom_point(data = RHAU_44149[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title44149) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_RHAU44149.png",width = 4, scale = 2.5)


#set up title for map 
title45663 <- paste("RHAU Tag 45663,",nrow(RHAU_45663),"locs,",min(RHAU_45663$DATE.TIME),"to",max(RHAU_45663$DATE.TIME),sep=" ")

map45663 <- 
  ggmap(map1) +   
  geom_point(data = RHAU_45663[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45663) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_RHAU45663.png",width = 4, scale = 2.5)


#set up title for map 
title45672 <- paste("RHAU Tag 45672,",nrow(RHAU_45672),"locs,",min(RHAU_45672$DATE.TIME),"to",max(RHAU_45672$DATE.TIME),sep=" ")

map45672 <-
  ggmap(map3) +   
  geom_point(data = RHAU_45672[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45672) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_RHAU45672.png",width = 4, scale = 2.5)


#set up title for map 
title45695 <- paste("RHAU Tag 45695,",nrow(RHAU_45695),"locs,",min(RHAU_45695$DATE.TIME),"to",max(RHAU_45695$DATE.TIME),sep=" ")

map45695 <-
  ggmap(map1) +   
  geom_point(data = RHAU_45695[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45695) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_RHAU45695.png",width = 4, scale = 2.5)

