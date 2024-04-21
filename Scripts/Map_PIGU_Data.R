library(here)
library(sf)
library(ggplot2)
library(ggmap)
library(stringr)
library(lubridate)

# This is Sarah's Google Key
# Each person needs to obtain their own key 
register_google(key = "AIzaSyDfvu_AsLHCTH1VSAi5WAi8pTzjofpI2L4", write = TRUE)

# Get a Google map 
# Probably ways to make this prettier... 
map1 <- get_googlemap("Protection Island, Washington", zoom = 11, maptype = "satellite")
map2 <- get_googlemap("Protection Island, Washington", zoom = 10, maptype = "satellite")

# Read in individual PIGU_data
PIGU_44067 <- read.csv("Data/PIGU_data/PIGU_tags/Processed_data/CSV/Obs070722_105346_Tag44067.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
PIGU_44067 <- PIGU_44067[which(PIGU_44067[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(PIGU_44067) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(PIGU_44067$YEAR, PIGU_44067$MONTH, PIGU_44067$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(PIGU_44067$HOUR, PIGU_44067$MINUTE, PIGU_44067$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
PIGU_44067$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual PIGU_data
PIGU_44072 <- read.csv("Data/PIGU_data/PIGU_tags/Processed_data/CSV/Obs290622_181228_Tag44072.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
PIGU_44072 <- PIGU_44072[which(PIGU_44072[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(PIGU_44072) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(PIGU_44072$YEAR, PIGU_44072$MONTH, PIGU_44072$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(PIGU_44072$HOUR, PIGU_44072$MINUTE, PIGU_44072$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
PIGU_44072$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

#NOTE THAT THERE IS AN ERROR WITH THIS ONE BECAUSE OF AN UNREASONABLE POINT - BUT IGNORE 
# Read in individual PIGU_data
PIGU_44372 <- read.csv("Data/PIGU_data/PIGU_tags/Processed_data/CSV/Obs290622_181228_Tag44372.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
PIGU_44372 <- PIGU_44372[which(PIGU_44372[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(PIGU_44372) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(PIGU_44372$YEAR, PIGU_44372$MONTH, PIGU_44372$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(PIGU_44372$HOUR, PIGU_44372$MINUTE, PIGU_44372$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
PIGU_44372$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual PIGU_data
PIGU_44505 <- read.csv("Data/PIGU_data/PIGU_tags/Processed_data/CSV/Obs290622_181228_Tag44505.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
PIGU_44505 <- PIGU_44505[which(PIGU_44505[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(PIGU_44505) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(PIGU_44505$YEAR, PIGU_44505$MONTH, PIGU_44505$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(PIGU_44505$HOUR, PIGU_44505$MINUTE, PIGU_44505$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
PIGU_44505$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual PIGU_data
PIGU_45657 <- read.csv("Data/PIGU_data/PIGU_tags/Processed_data/CSV/Obs260723_112505_Tag45657.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
PIGU_45657 <- PIGU_45657[which(PIGU_45657[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(PIGU_45657) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(PIGU_45657$YEAR, PIGU_45657$MONTH, PIGU_45657$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(PIGU_45657$HOUR, PIGU_45657$MINUTE, PIGU_45657$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
PIGU_45657$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

# Read in individual PIGU_data
PIGU_45658 <- read.csv("Data/PIGU_data/PIGU_tags/Processed_data/CSV/Obs260723_112505_Tag45658.csv", header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
PIGU_45658 <- PIGU_45658[which(PIGU_45658[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(PIGU_45658) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")
#set up date for map title 
temp1 <- as.Date(paste(PIGU_45658$YEAR, PIGU_45658$MONTH, PIGU_45658$DAY, sep = "-"), format = '%y-%m-%d') 
temp2 <- paste(PIGU_45658$HOUR, PIGU_45658$MINUTE, PIGU_45658$SECOND, sep = ":")
temp3 <- paste(temp1, temp2, sep = " ")
PIGU_45658$DATE.TIME <- ymd_hms(temp3,tz=Sys.timezone())

#MAKE MAPS 

#set up title for map 
title44067 <- paste("PIGU Tag 44067,",nrow(PIGU_44067),"locs,",min(PIGU_44067$DATE.TIME),"to",max(PIGU_44067$DATE.TIME),sep=" ")

map44067 <- 
  ggmap(map1) +   
  geom_point(data = PIGU_44067[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title44067) +
  theme(panel.background = element_rect(fill = "white"), 
      panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
      plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_PIGU44067.png",width = 4, scale = 2.5)


#set up title for map 
title44072 <- paste("PIGU Tag 44072,",nrow(PIGU_44072),"locs,",min(PIGU_44072$DATE.TIME),"to",max(PIGU_44072$DATE.TIME),sep=" ")

map44072 <- 
  ggmap(map1) +   
  geom_point(data = PIGU_44072[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title44072) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_PIGU44072.png",width = 4, scale = 2.5)


#set up title for map 
title44372 <- paste("PIGU Tag 44372,",nrow(PIGU_44372),"locs,",min(PIGU_44372$DATE.TIME),"to", max(PIGU_44372$DATE.TIME),sep=" ")


map44372 <- 
  ggmap(map2) +   
  geom_point(data = PIGU_44372[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title44372) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_PIGU44372.png",width = 4, scale = 2.5)


#set up title for map 
title44505 <- paste("PIGU Tag 44505,",nrow(PIGU_44505),"locs,",min(PIGU_44505$DATE.TIME),"to",max(PIGU_44505$DATE.TIME),sep=" ")

map44505 <- 
  ggmap(map1) +   
  geom_point(data = PIGU_44505[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title44505) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_PIGU44505.png",width = 4, scale = 2.5)


#set up title for map 
title45657 <- paste("PIGU Tag 45657,",nrow(PIGU_45657),"locs,",min(PIGU_45657$DATE.TIME),"to",max(PIGU_45657$DATE.TIME),sep=" ")

map45657 <- 
  ggmap(map1) +   
  geom_point(data = PIGU_45657[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45657) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_PIGU45657.png",width = 4, scale = 2.5)


#set up title for map 
title45658 <- paste("PIGU Tag 45658,",nrow(PIGU_45658),"locs,",min(PIGU_45658$DATE.TIME),"to",max(PIGU_45658$DATE.TIME),sep=" ")

map45658 <-
  ggmap(map1) +   
  geom_point(data = PIGU_45658[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) +
  ggtitle(title45658) +
  theme(panel.background = element_rect(fill = "white"), 
        panel.border = element_rect(color = "black", linewidth = 1,linetype = "solid", fill = NA),
        plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))

ggsave("Maps/map_PIGU45658.png",width = 4, scale = 2.5)
