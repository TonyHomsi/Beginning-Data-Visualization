# Load movie data from CSV file
movies <- read.csv("Movies.csv")

# Peek at the data
head(movies)


# Create a contingency table
awards <- table(
  movies$Award,
  movies$Rating)

# Display the table
print(awards)

# Create a grouped frequency bar chart
barplot(
  height = awards,
  beside = TRUE,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  legend = c("No", "Yes"),
  args.legend = list(
    x = "topleft",
    title = "Awards"))

# Create a stacked frequency bar chart
barplot(
  height = awards,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  legend = c("No", "Yes"),
  args.legend = list(
    x = "topleft",
    title = "Awards"))

# Create a proportional frequency table
proportions <- apply(awards, 2, function(x) { x / sum(x) })

head(awards)

head(proportions)

# Create a 100% stacked frequency bar chart
barplot(
  height = proportions,
  main = "Proportion of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Proportion of Movies",
  legend = c("No", "Yes"),
  args.legend = list(
    x = "topleft",
    title = "Awards"))

# Create a contingency table
# NOTE: x and y are correct
awards <- table(
  movies$Rating,
  movies$Award)

colnames(awards) <- c("No", "Yes")

print(awards)

# Create a spineplot
spineplot(
  x = awards,
  main = "Proportion of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Awards")

# Create a mosaic plot
mosaicplot(
  x = awards,
  main = "Proportion of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Awards")


###### Using Lattice
install.packages("lattice")
library(lattice)

require(lattice)

# Create a grouped frequency bar chart
barchart(
  x = awards,
  stack = FALSE,
  horizontal = FALSE,
  main = "Count of Movies by Rating and Awards",
  xlab = "Rating",
  ylab = "Count of Movies",
  auto.key = list(
    x = 0.05,
    y = 0.95,
    title = "Awards",
    text = c("No", "Yes")))

# Create a stacked frequency bar chart
barchart(
  x = awards,
  stack = TRUE,
  horizontal = FALSE,
  main = "Count of Movies by Rating and Award",
  xlab = "Rating",
  ylab = "Count of Movies",
  auto.key = list(
    x = 0.05,
    y = 0.95,
    title = "Awards",
    text = c("No", "Yes")))


# Create a proportional frequency table
matrix <- apply(awards, 1, function(x) {x / sum(x) })

proportions <- t(matrix) # transpose matrix

head(awards)

head(proportions)

# Create a 100% stacked frequency bar chart
barchart(
  x = proportions,
  stack = TRUE,
  horizontal = FALSE,
  main = "Proportion of Movies by Rating and Award",
  xlab = "Rating",
  ylab = "Proportion of Movies",
  auto.key = list(
    x = 0.70,
    y = 1.05,
    title = "Awards",
    columns = 2,
    text = c("No", "Yes"),
    background = "white"))

# NOTE: No spine plot or mosaic plot in lattice


####### Using ggplot2


library(ggplot2)
# Create a grouped frequency bar chart
ggplot(
  data = movies, 
  aes(x = Rating, fill = Awards)) +
  geom_bar(position = "dodge") +
  ggtitle("Count of Movies by Rating and Awards") +
  scale_fill_discrete(labels=c("No","Yes"))


# Create a stacked frequency bar chart
ggplot(
  data = movies, 
  aes(x = Rating, fill = Awards)) +
  geom_bar() +
  ggtitle("Count of Movies by Rating and Awards") +
  scale_fill_discrete(labels = c("No", "Yes"))

# Create a 100% stacked frequency bar chart
ggplot(
  data = movies, 
  aes(x = Rating, fill = Awards)) +
  geom_bar(position = "fill") +
  ggtitle("Proportion of Movies by Rating and Awards") +
  ylab("Proportion of Movies") +
  scale_fill_discrete(labels = c("No", "Yes"))

# NOTE: No spine plot or mosaic plot
