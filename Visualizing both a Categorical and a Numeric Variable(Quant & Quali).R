################ using Base

# Create a bivariate bar graph
average <- tapply(
  movies$Box.Office, 
  movies$Rating, 
  mean)

print(average)

barplot(
  height = average,
  main = "Average Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)")

# Create a bivariate box plot
plot(
  x = movies$Rating, 
  y = movies$Box.Office,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)")

# Create a notched box plot
plot(
  x = movies$Rating, 
  y = movies$Box.Office,
  notch = TRUE,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)")





###### USing Lattice ###############

# Download, install, and load the dplyr package
install.packages("dplyr")

library(dplyr)

# Create table of average box office by rating
average <- movies %>%
  select(Rating, Box.Office) %>%
  group_by(Rating) %>% 
  summarize(Box.Office = mean(Box.Office)) %>%
  as.data.frame()

print(average)

# Create a bivariate bar chart
barchart(
  x = Box.Office ~ Rating,
  data = average,
  main = "Average Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)")

# Create a bivariate box plot
bwplot(
  x = Box.Office ~ Rating,
  data = movies,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)")

# Create a notched box plot
bwplot(
  x = Box.Office ~ Rating,
  data = movies,
  notch = TRUE,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)")

# Create a violin plot
bwplot(
  x = Box.Office ~ Rating,
  data = movies,
  panel = panel.violin,
  main = "Box Office Revenue by Rating",
  xlab = "Rating",
  ylab = "Box Office ($M)")



#### Using ggplot2



# Create a bivariate bar chart
ggplot(
  data = average, 
  aes(x = Rating, y = Box.Office)) +
  geom_bar(stat = "identity") +
  ggtitle("Average Box Office Revenue by Rating") +
  xlab("Rating") +
  ylab("Box Office ($M)")

# Create a bivariate box plot
ggplot(
  data = movies, 
  aes(x = Rating, y = Box.Office)) +
  geom_boxplot() +
  ggtitle("Box Office Revenue by Rating") +
  xlab("Rating") +
  ylab("Box Office ($M)")

# Create a notched box plot
ggplot(
  data = movies, 
  aes(x = Rating, y = Box.Office)) +
  geom_boxplot(notch = TRUE) +
  ggtitle("Box Office Revenue by Rating") +
  xlab("Rating") +
  ylab("Box Office ($M)")

# Create a violin plot
ggplot(
  data = movies, 
  aes(x = Rating, y = Box.Office)) +
  geom_violin() +
  ggtitle("Box Office Revenue by Rating") +
  xlab("Rating") +
  ylab("Box Office ($M)")
