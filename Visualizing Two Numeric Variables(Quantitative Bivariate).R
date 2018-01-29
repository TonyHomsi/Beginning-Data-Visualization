# Load movie data from CSV file
movies <- read.csv("Movies.csv")

# Peek at the data
head(movies)



# Bivariate visualizations for 
# two quantitiative variables


## Using Base
# Create a scatterplot
plot(
  x = movies$Runtime, 
  y = movies$Box.Office,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Create a linear regression model
model <- lm(movies$Box.Office ~ movies$Runtime)

# Draw the linear regression line on the plot
lines(
  x = movies$Runtime,
  y = model$fitted, 
  col = "red",
  lwd = 3)

# Install hexbin
install.packages("hexbin")

# Load hexbin library
library(hexbin)

# Create a hexagonal binned frequency heatmap
hexbin <- hexbin(
  x = movies$Runtime,
  y = movies$Box.Office,
  xbins = 30,
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

plot(
  x = hexbin,
  main = "Runtime vs. Box Office Revenue")

# Create a 2D kernel density estimate using
install.packages("MASS")

library(MASS)

# Create a 2d kernel density estimation
density2d <- kde2d(
  x = movies$Runtime, 
  y = movies$Box.Office, 
  n = 50)

# Create a contour plot of density
contour(
  x = density2d$x,
  y = density2d$y,
  z = density2d$z,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Create a level plot of density
image(
  x = density2d$x, 
  y = density2d$y, 
  z = density2d$z,
  col = topo.colors(100),
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Create mesh plot of density
persp(
  x = density2d$x,
  y = density2d$y,
  z = density2d$z,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)",
  zlab = "Density")

# Create surface plot of density
palette(topo.colors(100))

persp(
  x = density2d$x,
  y = density2d$y,
  z = density2d$z,
  col = cut(density2d$z, 100),
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)",
  zlab = "Density")

palette("default")

# Load time series data
timeSeries <- read.csv("Timeseries.csv")

# Display the time series data
head(timeSeries)

# Create a step chart
plot(
  x = timeSeries,
  type = "s",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)")

# Create a line chart
plot(
  x = timeSeries,
  type = "l",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)")


################ Using Lattice###################

# Create a scatterplot
xyplot(
  x = Box.Office ~ Runtime,
  data = movies,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Add a linear regression line
xyplot(
  x = Box.Office ~ Runtime,
  data = movies,
  type = c("p", "r"),
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Load hexbin library
library(hexbin)

# Create hexagonal binned frequency heatmap
hexbinplot(
  x =  Box.Office ~ Runtime,
  data = movies,
  xbins = 30,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Create a grid from our 2D kernel density estimate
grid <- expand.grid(
  x = density2d$x,
  y = density2d$y)

grid$z <- as.vector(density2d$z)

# Display the data frame
head(grid)

# Create a contour plot of density
contourplot(
  x = z ~ x * y,
  data = grid,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Create a level plot of density
levelplot(
  x = z ~ x * y,
  data = grid,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)")

# Create mesh plot of density
wireframe(
  x = z ~ x * y,
  data = grid,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)",
  zlab = "Density")

# Create surface plot of density
wireframe(
  x = z ~ x * y,
  data = grid,
  drape = TRUE,
  main = "Runtime vs. Box Office Revenue",
  xlab = "Runtime (minutes)",
  ylab = "Box Office ($M)",
  zlab = "Density")

# Create a step chart
xyplot(
  x = Box.Office ~ Year,
  data = timeSeries,
  type = "s",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)")

# Create a line chart
xyplot(
  x = Box.Office ~ Year,
  data = timeSeries,
  type = "l",
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)")

# Download, install and load Lattice Extra package
install.packages("latticeExtra")

library(latticeExtra)

# Create an area chart
xyplot(
  x = Box.Office ~ Year,
  data = timeSeries,
  panel = panel.xyarea,
  ylim = c(0, max(timeSeries$Box.Office)),
  main = "Average Box Office Revenue by Year",
  xlab = "Year",
  ylab = "Box Office ($M)")


######### using ggplot #####################

# Create scatterplot
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  geom_point() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Add a linear regression line
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  geom_point() + 
  geom_smooth(method = "lm") +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")


# Create a frequency heatmap
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  stat_bin2d() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Create a hexagonal binned frequency heatmap
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  stat_binhex() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Create a contour plot of density
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  geom_density2d() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Create a level plot of density
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  stat_density2d(aes(fill = ..level..), geom = "polygon") + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# NOTE: 3D visualizations do not exist in ggplot2

# Create a step chart
ggplot(
  data = timeSeries, 
  aes(x = Year, y = Box.Office)) +
  geom_step() +
  expand_limits(y = 0) + 
  ggtitle("Box Office Revenue by Year") +
  xlab("Year") +
  ylab("Box Office ($M)")

# Create a line chart
ggplot(
  data = timeSeries, 
  aes(x = Year, y = Box.Office)) +
  geom_line() +
  expand_limits(y = 0) + 
  ggtitle("Average Box Office Revenue by Year") +
  xlab("Year") +
  ylab("Box Office ($M)")

# Create an area chart
ggplot(
  data = timeSeries, 
  aes(x = Year, y = Box.Office)) +
  geom_area() + 
  ggtitle("Average Box Office Revenue by Year") +
  xlab("Year") +
  ylab("Box Office ($M)")

