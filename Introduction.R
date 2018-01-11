## Base

# Create a data frame
df <- data.frame(
  Name= c("a","b","c"),
  Value=c(1,2,3)
)

#Display the data frame
print(df)

# Plot the data frame using default parameters
plot(df)

#Plot using default parameter order
plot(df$Name, df$Value)

#plot using names parameters
plot(
  x= df$Name,
  y=df$Value
)

# Create a bar chart
barplot(
  names=df$Name,
  height = df$Value,
  col = "skyblue",
  main = "Hello World",
  xlab = "name",
  ylab= "Value"
)

#View the help files

?plot


?barplot

?par


##Latice


# Install the lattice package

install.packages("lattice")

library(lattice)

#plot with defaults
dotplot(
  x=Value ~ Name,
  data = df
)


# Plot with parameters
dotplot(
  x = Value ~ Name,
  data = df,
  main = "Hello World",
  xlab = "Name",
  ylab = "Value")


# Create a bar chart
barchart(
  x = Value ~ Name,
  data = df,
  col = "skyblue",
  main = "Hello World",
  xlab = "Name",
  ylab = "Value")

# View the help files
?barchart

?formula


##ggplot2

#install the ggplot2 package
install.packages("ggplot2")
library(ggplot2)


# Plot with defaults
ggplot(
  data = df, 
  aes(
    x = Name, 
    y = Value)) +
  geom_point()


#Plot with parameters
ggplot(
  data = df,
  aes(
    x= Name,
    y=Value))+
  geom_point()+
  ggtitle("Hello World")+
  xlab("Name")+
  ylab("Value")
  

#Create a bar chart
ggplot(
  data=df,
  aes(
    x=Name,
    y=Value))+
  geom_bar(
    stat = "Identity",
    fill="skyblue")+
  ggtitle("Hello World")+
  xlab("Name")+
  ylab("Value")
    
#View the help files
?ggplot

?aes

?geom_bar

?geom_tile