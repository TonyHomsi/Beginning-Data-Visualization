setwd("c:/Pluralsight/Beginning-Data-Visualization")

# Load movie data from CSV file
movies <- read.csv("Movies.csv")

# Peek at the data
head(movies)

# Univariate visualizations for
# a qualitiative variable

# Create a frequency bar chart of ratings
plot(
  x=movies$Rating,
  main="Count of Movies by Rating",
  xlab="Rating",
  ylab="Count of movies"
)

# Create a horizontal bar chart
plot(
  x= movies$Rating,
  horiz=TRUE,
  main="Count of Movies by Rating",
  xlab="Rating",
  ylab="Count of movies"
  )


# Create a Cleveland dot plot
dotchart(
  x=table(movies$Rating),
  pch = 17, # pch values 0 - 24
  main="Count of Movies by Rating",
  xlab="Rating",
  ylab="Count of movies"
)

# Create a pie chart of ratings
pie(
  x=table(movies$Rating),
  main = "Count of Movies by Rating "
  
)


# Create a pie chart of awards
pie(
  x=table(movies$Awards),
  clockwise = TRUE,
  main = "Proportion of Movies that Won Awards"
)


########### Lattice

library(lattice)

# Create frequency table of ratings
table <- table(movies$Rating)

ratings <- as.data.frame(table)

?data.frame

names(ratings)[1] <- "Rating"
names(ratings)[2] <- "Count"

print(ratings)

# Create a frequency bar chart
barchart(
  x = Count ~ Rating,
  data = ratings,
  main = "Count of Movies by Rating",
  xlab = "Rating")

# Create a horizontal bar chart
barchart(
  x = Rating ~ Count,
  data = ratings,
  main = "Count of Movies by Rating",
  ylab = "Rating")

# Create Cleveland dot plot
dotplot(
  x = Rating ~ Count,
  data = ratings,
  main = "Count of Movies by Rating",
  ylab = "Rating")

# Create a part-of-whole frequency bar chart
histogram(
  x = ~Rating,
  data = movies,
  main = "Percent of Movies by Rating")

############# ggplot2
library(ggplot2)

# Create a frequency var chart for rating
ggplot(
  data = movies,
  aes(x=Rating))+
  geom_bar()+
  ggtitle("Count of Movies by RaTING ")


# Create a horizontal frequency bar chart for genre
ggplot(
  data = movies, 
  aes(x = Rating)) +
  geom_bar() +
  coord_flip() +
  ggtitle("Count of Movies by Rating")

# Create cleveland dot plot
ggplot(
  data = movies, 
  aes(x = Rating)) + 
  geom_point(stat = "count") +
  coord_flip() +
  ggtitle("Count of Movies by Rating")


#Create a pie chart
ggplot(
  data=movies,
  aes(x="",fill=Rating))+
  geom_bar()+
  coord_polar(theta = "y")+
  ggtitle("Count of Movies by Rating")+
  ylab("")


# Create a pie chart of awards
ggplot(
  data = movies, 
  aes(x = "", fill = Awards)) +
  geom_bar() +
  coord_polar(theta = "y") +
  ggtitle("Proportion of Movies that Won Awards") +
  ylab("")
