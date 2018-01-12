# Load movie data from CSV file
movies <- read.csv("Movies.csv")

# Peek at the data
head(movies)

# Univariate visualizations of
# a quantitiative variable

######## Using Base
# Create a dot plot of runtime
plot(
  x = movies$Runtime, 
  y = rep(0, nrow(movies)),
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  ylab = "", 
  yaxt = "n")


# Create a dot plot with alpha transparency
plot(
  x = movies$Runtime, 
  y = rep(0, nrow(movies)), 
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  ylab = "", 
  yaxt = "n",
  pch = 16,
  col = rgb(0, 0, 0, 0.1))


# Add jitter to dot plot
plot(
  x = movies$Runtime, 
  y = jitter(rep(0, nrow(movies))), 
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  ylab = "", 
  yaxt = "n")

# Create a boxplot
boxplot(
  x= movies$Runtime,
  horizontal = TRUE,
  main="Distribution of Movie Runtime",
  xlab="Runtime(minutes)"
)


# Add jitter to dot plot
plot(
  x = movies$Runtime, 
  y = jitter(rep(0, nrow(movies))),
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  ylab = "", 
  yaxt = "n")


# Create a histogram of runtime
hist(
  x = movies$Runtime,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

# Create a more course-grain histogram
hist(
  x = movies$Runtime,
  breaks = 10,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")


# Create a more fine-grain histogram
hist(
  x = movies$Runtime,
  breaks = 30,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")


# Create a density plot of runtime
plot(
  x=density(movies$Runtime),
  main = "Distibution of Movie Runtime",
  xlab = "Runtime(minutes)"
)

# Create small multiples of all four in one graph
par(mfrow = c(4, 1))


plot(
  x = movies$Runtime, 
  y = jitter(rep(0, nrow(movies))), 
  xlim = c(0, 250),
  main = "Distribution of Movie Runtimes",
  xlab = "",
  ylab = "", 
  yaxt = "n",
  pch = 16,
  col = rgb(0, 0, 0, 0.1))

boxplot(
  x = movies$Runtime,
  ylim = c(0, 250),
  horizontal = TRUE)


hist(
  x = movies$Runtime,
  xlim = c(0, 250),
  main = "",
  xlab = "",
  ylab = "",
  yaxt = "n")

plot(
  x = density(movies$Runtime),
  xlim = c(0, 250),
  main = "",
  xlab = "Runtime (minutes)",
  ylab = "",
  yaxt = "n")

# Reset multi-row display
par(mfrow = c(1, 1))



######## Using Lattice #########
# Create dot plot for runtime
stripplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

# Create dot plot with jitter
stripplot(
  x = ~Runtime,
  data = movies,
  jitter = TRUE, 
  amount = 0.5,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

# Create box plot with lattice
bwplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

# Create histogram with lattice
histogram(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

# Create density plot with lattice
densityplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)")

# Create small multiples of all four
# NOTE: Not exactly lined up
dot <- dotplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "")

print(
  x = dot, 
  position = c(0, 0.75, 1, 1), 
  more = TRUE)

box <- bwplot(
  x = ~Runtime,
  data = movies,
  xlab = "")

print(
  x = box, 
  position = c(0, 0.50, 1, 0.75), 
  more = TRUE)

hist <- histogram(
  x = ~Runtime,
  data = movies,
  xlab = "",
  ylab = "",
  scales = list(y = list(draw = FALSE)))

print(
  x = hist, 
  position = c(0, 0.25, 1, 0.50),
  more = TRUE)

density <- densityplot(
  x = ~Runtime,
  data = movies,
  ylab = "",
  scales = list(y = list(draw = FALSE)))

print(
  x = density, 
  position = c(0, 0, 1, 0.25))



######## Using ggplot2 #########

#Create dot plot
ggplot(
  data = movies,
  aes(x=Runtime, stat="count"))+
  geom_dotplot(binwidth = 1)+
  ggtitle("Distribution of Movies Runtime")+
  xlab("Runtime(minutes)")


# Create violin-style dot plot
ggplot(
  data = movies, 
  aes(x = Runtime, stat = "count")) +
  geom_dotplot(
    binwidth = 1, 
    stackdir = "center") +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")


#Create box plot of Runtime
ggplot(
  data = movies,
  aes(x=Runtime, y=Runtime))+
  geom_boxplot()+
  coord_flip()+
  ggtitle("Distribution of Movie Runtimes") +
  xlab("")
  ylab("Runtime (minutes)")
  theme(
    axis.text.y = element_blank(),
    axis.text.x = element_blank())


# Create histogram with ggplot
ggplot(
  data = movies, 
  aes(x = Runtime)) +
  geom_histogram(binwidth = 10) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

# Create density plot with ggplot
ggplot(
  data = movies, 
  aes(x = Runtime)) +
  geom_density() +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")


# Plot small multiples of all four
dev.off()


install.packages("grid")
library(grid)

viewport <- viewport(
  layout = grid.layout(4,1)
)

pushViewport(viewport)

dot <-ggplot(
  data = movies, 
  aes(x = Runtime, ..count..)) +
  geom_dotplot(
    binwidth = 0.25) +
  scale_x_continuous(
    limits = c(0, 250)) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("")

print(
  x = dot, 
  vp = viewport(
    layout.pos.row = 1, 
    layout.pos.col = 1))

box <- ggplot(
  data = movies, 
  aes(x = Runtime, y = Runtime)) +
  geom_boxplot() +
  coord_flip() +
  scale_y_continuous(
    limits = c(0, 250)) +
  xlab("")

print(
  x = box, 
  vp = viewport(
    layout.pos.row = 2, 
    layout.pos.col = 1))

hist <- ggplot(
  data = movies, 
  aes(x = Runtime)) +
  geom_histogram(binwidth = 10) +
  scale_x_continuous(
    limits = c(0, 250)) +
  xlab("")

print(
  x = hist, 
  vp = viewport(
    layout.pos.row = 3, 
    layout.pos.col = 1))

density <- ggplot(
  data = movies, 
  aes(x = Runtime)) +
  geom_density() +
  scale_x_continuous(
    limits = c(0, 250)) +
  xlab("Runtime (minutes)")

print(
  x = density, 
  vp = viewport(
    layout.pos.row = 4, 
    layout.pos.col = 1))


