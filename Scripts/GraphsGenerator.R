##Le pourcentage de PushIn et PushOut entre Q42019 et les trimestres suivants (age<75)
library(ggplot2)
library(reshape2)

####PERIODE 2018_2019

pushout <- c(7.76, 6.5, 6.04,	4.79)
pushin <- c(8.06, 7.44, 6.39, 5.1)
difference <- c(	-0.3,	-0.94,	-0.35,	-0.31)
IndexLabel <- c( "2018Q4", "2019Q1", "2019Q2", "2019Q3")

data <- data.frame(
  Sortants = pushout,
  Entrants = pushin,
  Difference = difference,
  IndexLabel = IndexLabel
)

data_melted <- melt(data, id.vars = "IndexLabel", variable.name = "Category", value.name = "Value")

ggplot(data_melted, aes(x = IndexLabel, y = Value, color = Category, group = Category)) +
  geom_line(size = 1.5) +
  geom_point(size = 5) +
  geom_text(aes(label = round(Value, 2)),
            vjust = "inward", hjust = "inward",
            show.legend = FALSE, colour = "black", size = 5)+
  scale_x_discrete(labels = data$IndexLabel) +
  scale_color_manual(values = c("#E69F00", "#009E73", "#56B4E9")) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(size = 0.5, colour = "black"),
        legend.position = "bottom") +
  labs(title = "Sortants vs Entrants et Différence", x = "Trimestre", y = "Taux", color = "Category")

####PERIODE 2019_2021
Gen_graph <- function(data_melted){
  ggplot(data_melted, aes(x = IndexLabel, y = Value, color = Category, group = Category)) +
    geom_line(size = 1.5) +
    geom_point(size = 5) +
    geom_rect(data=confinement1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax),
              color="transparent", fill="gray",
              alpha=0.5,
              inherit.aes = FALSE)+
    geom_rect(data=confinement2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax),
              color="transparent", fill="gray",
              alpha=0.5,
              inherit.aes = FALSE)+
    annotate("text", x=2, y=10, label= "Confinement 1")+
    annotate("text", x=4.05, y=10, label= "Confinement 2")+
    geom_text(aes(label = round(Value, 2)),
              vjust = "inward", hjust = "inward",
              show.legend = FALSE, colour = "black", size = 5)+
    scale_x_discrete(labels = data$IndexLabel) +
    scale_color_manual(values = c("#E69F00", "#009E73", "#56B4E9")) +
    theme_bw() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          axis.line = element_line(size = 0.5, colour = "black"),
          legend.position = "bottom") +
    labs(title = "Sortants vs Entrants et Différence", x = "Trimestre", y = "Taux", color = "Category")
}

pushout <- c(4.04, 6.42, 7.63, 8.29, 9.14)
pushin <- c(3.96, 4.62, 7.02, 7.71, 9.72)
difference <- c(0.08, 1.80, 0.61, 0.58, -0.58)
IndexLabel <- c( "2020Q1", "2020Q2", "2020Q3", "2020Q4", "2021Q1")

confinement1 <- data.frame(xmin=1.8, xmax=2.2, ymin=-Inf, ymax=Inf)
confinement2 <- data.frame(xmin=3.9, xmax=4.2, ymin=-Inf, ymax=Inf)

data <- data.frame(
  Sortants = pushout,
  Entrants = pushin,
  Difference = difference,
  IndexLabel = IndexLabel
)

data_melted <- melt(data, id.vars = "IndexLabel", variable.name = "Category", value.name = "Value")
Gen_graph(data_melted)

######sELON LE SEXE
##Masculin
pushout <- c(3.81, 6.20, 7.80, 7.57, 8.13)
pushin <- c(4.47, 4.83, 7.38, 8.11, 10.04)
differenceHomme <- pushout-pushin
IndexLabel <- c( "2020Q1", "2020Q2", "2020Q3", "2020Q4", "2021Q1")

confinement1 <- data.frame(xmin=1.8, xmax=2.2, ymin=-Inf, ymax=Inf)
confinement2 <- data.frame(xmin=3.9, xmax=4.2, ymin=-Inf, ymax=Inf)

data <- data.frame(
  Sortants = pushout,
  Entrants = pushin,
  DifferenceHomme = differenceHomme,
  IndexLabel = IndexLabel
)

data_melted <- melt(data, id.vars = "IndexLabel", variable.name = "Category", value.name = "Value")
Gen_graph(data_melted)

##Feminin
pushout <- c(4.27, 6.64, 7.98, 9.01, 10.21)
pushin <- c(3.50, 4.33, 6.47, 7.02, 8.80)
differenceFemme <- pushout-pushin
IndexLabel <- c( "2020Q1", "2020Q2", "2020Q3", "2020Q4", "2021Q1")

confinement1 <- data.frame(xmin=1.8, xmax=2.2, ymin=-Inf, ymax=Inf)
confinement2 <- data.frame(xmin=3.9, xmax=4.2, ymin=-Inf, ymax=Inf)

data <- data.frame(
  Sortants = pushout,
  Entrants = pushin,
  differenceFemme = differenceFemme,
  IndexLabel = IndexLabel
)

data_melted <- melt(data, id.vars = "IndexLabel", variable.name = "Category", value.name = "Value")
Gen_graph(data_melted)

###Homme vs Femme
data <- data.frame(
  DifferenceH = differenceHomme,
  DifferenceF = differenceFemme,
  IndexLabel = IndexLabel
)
data_melted <- melt(data, id.vars = "IndexLabel", variable.name = "Category", value.name = "Value")
ggplot(data_melted, aes(x = IndexLabel, y = Value, color = Category, group = Category)) +
  geom_line(size = 1.5) +
  geom_point(size = 5) +
  geom_rect(data=confinement1, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax),
            color="transparent", fill="gray",
            alpha=0.5,
            inherit.aes = FALSE)+
  geom_rect(data=confinement2, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax),
            color="transparent", fill="gray",
            alpha=0.5,
            inherit.aes = FALSE)+
  annotate("text", x=2, y=10, label= "Confinement 1")+
  annotate("text", x=4.05, y=10, label= "Confinement 2")+
  geom_text(aes(label = round(Value, 2)),
            vjust = "inward", hjust = "inward",
            show.legend = FALSE, colour = "black", size = 5)+
  scale_x_discrete(labels = data$IndexLabel) +
  scale_color_manual(values = c( "#009E73", "#E69F00")) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(size = 0.5, colour = "black"),
        legend.position = "bottom") +
  labs(title = "Différence: Homme vs Femme", x = "Trimestre", y = "Taux", color = "Category")


