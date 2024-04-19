library(here)
library(sf)

# First, here is code to map just one individual.
# Read in individual PIGU_data
# PIGU_data <- read.csv(here("Data", "Bird_Data", "PIGU_data", "PIGU_data.csv")) #this is the tracking data reprojected into UTM; NOT in original lat/lon
PIGU_44067 <- read.csv(here("Data", "Bird_Data", "PIGU_data", "PIGU_tags", "Processed_data", "CSV", "Obs070722_105346_Tag44067.csv"), header = FALSE, skip = 5) #skip first 5 rows because it's just header nonsense
PIGU_44067 <- PIGU_44067[which(PIGU_44067[[10]] != 0.00000),] #filter out observations without tracked locations
colnames(PIGU_44067) <- c("DAY", "MONTH", "YEAR", "HOUR", "MINUTE", "SECOND", "SoD", "#SAT", "LAT", "LONG", "ALT", "CLOCK_OFFSET", "ACCURACY", "BATTERY", "NA1", "NA2")

# I have included a few other folders in the Map_Data directory that contain other shapefiles. The simplest one to work with is the one you've already seen.
# Warning: the hydrography folder's shapefile is really large. If you choose to mess with it and read it in, I would filter in on zone of interest before attempting to plot it.
# Read the shapefile
state <- st_read(here("Data", "Map_Data", "states", "cb_2018_us_state_500k.shp")) #for some reason I had to use this read command. there is another, read_sf() that you may need to use in different cases 
wa <- state[state$NAME == "Washington", ] #filter to obtain WA state

# Let's focus in on region of interest
lon_min <- -123.125
lon_max <- -122.688
lat_min <- 48.0
lat_max <- 48.3

# Make a map. This can be saved to an object and called on in the console quickly if you want to make multiple in the same script
ggplot() +
  geom_sf(data = wa, color = "lemonchiffon3", fill = "ivory2", lwd = 0.75) +   #make base land map
  coord_sf(expand = F,
           xlim = c(lon_min, lon_max),
           ylim = c(lat_min, lat_max)) +   #zoom in on area of interest
  theme(panel.background = element_rect(fill = "white"), #background
        panel.border = element_rect(color = "black", linewidth = 1,
                                    linetype = "solid", fill = NA)) + #border around map image
geom_point(data = PIGU_44067[,9:10], aes(x = LONG, y = LAT), col = "red", shape = 16, size = 0.5) #PIGU points added AFTER the base map is made. This process is layered, so if you plotted points first, they would be covered by the next thing you add to the map.
#Something you could try here is reading in the other birds and adding lines to plot all PIGU on the same map, assigning different colors to each individual.

 