# Load required libraries
library(sf)
library(ggplot2)
library(rnaturalearth)

# Load the Natural Earth world map data
world_map <- ne_countries(scale = "medium", returnclass = "sf")

# Create a data frame with the given data
continent_data <- data.frame(
  Continent = c("North America", "Europe", "Asia", "Oceania", "South America", "Africa"),
  Growth_Rate = c(4.9, 4.7, 6.2, 6.2, 5.8, 5.4)
)

# Merge the world map data with the given data
world_map_data <- merge(world_map, continent_data, by.x = "continent", by.y = "Continent")

# Create a world map with the growth rates visualized using ggplot2
map_plot <- ggplot(world_map_data) +
  geom_sf(aes(fill = Growth_Rate), color = "black", size = 0.1) +
  scale_fill_gradient(low = "lightblue", high = "darkblue", name = "Growth Rate (%)") +
  theme_minimal() +
  labs(title = "Continental Growth Rates (2022)") +
  theme(legend.position = "bottom")

# Display the world map
print(map_plot)
