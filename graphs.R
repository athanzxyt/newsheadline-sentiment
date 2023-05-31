library(readr)
library(ggplot2)
library(ggridges)
library(gridExtra)

theme_set(theme_bw())

NADSentiment <- read_csv("data/NewsAggregatorDataset/NADSentiment.csv")
ATNSentiment <- read_csv("data/AllTheNews/ATNSentiment.csv")

# Bar Chart NAD
plot <- ggplot(NADSentiment, aex(x = Category)) +
   geom_bar(stat = "count", fill = "darkslategrey") + 
   labs(title = "", x = "Category", y = "Value")

print(plot)

# Bar Chart ATN
plot <- ggplot(ATNSentiment, aex(x = Publisher)) +
   geom_bar(stat = "count", fill = "darkslategrey") + 
   labs(title = "", x = "Publisher", y = "Value") +
   coord_flip()

print(plot)

# NAD & ATN Distributions
ggp1 <- ggplot(NADSentiment, aes(x = Polarity)) +
   geom_histogram(fill = "darkslategrey", bins = 12) +
   labs(title = "NAD Polarity", x = "", y = "")

ggp2 <- ggplot(NADSentiment, aes(x = Subjectivity)) +
   geom_histogram(fill = "darkslategrey", bins = 12) +
   labs(title = "NAD Subjectivity", x = "", y = "")

ggp3 <- ggplot(ATNSentiment, aes(x = Polarity)) +
   geom_histogram(fill = "darkslategrey", bins = 12) +
   labs(title = "ATN Polarity", x = "", y = "")

ggp4 <- ggplot(ATNSentiment, aes(x = Subjectivity)) +
   geom_histogram(fill = "darkslategrey", bins = 12) +
   labs(title = "ATN Subjectivity", x = "", y = "")


grid.arrange(ggp1, ggp2, ggp3, ggp4, ncol = 2)


# Establish graphing vars
size = 0.3
shape = 1
alpha = 0.3

# NAD - Polarity v. Subjectivity
lm1 <- lm(Polarity~Subjectivity, data=NADSentiment)
coeff1<-coefficients(lm1) 

ggp1 <- ggplot(NADSentiment, aes(x = Subjectivity, y = Polarity)) +
   geom_point(size = size, shape = shape, alpha = alpha) +
   geom_abline(intercept = coeff1[1], slope = coeff1[2], color = "red", size=1) + 
   theme(aspect.ratio = 3/4) + 
   labs(x = "Subjectivity", y = "Polarity")

lm2 <- lm((Polarity**2)~Subjectivity, data=NADSentiment)
coeff2<-coefficients(lm2) 

ggp2 <- ggplot(NADSentiment, aes(x = Subjectivity, y = (Polarity**2))) +
   geom_point(size = size, shape = shape, alpha = alpha) +
   geom_abline(intercept = coeff2[1], slope = coeff2[2], color = "red", size=1) + 
   theme(aspect.ratio = 3/4) + 
   labs(x = "Subjectivity", y = "abs(Polarity)")

grid.arrange(ggp1, ggp2, ncol = 2) 

# ATN - Polarity v. Subjectivity
lm1 <- lm(Polarity~Subjectivity, data=ATNSentiment)
coeff1<-coefficients(lm1) 

ggp1 <- ggplot(ATNSentiment, aes(x = Subjectivity, y = Polarity)) +
   geom_point(size = size, shape = shape, alpha = alpha) +
   geom_abline(intercept = coeff1[1], slope = coeff1[2], color = "red", size=1) + 
   theme(aspect.ratio = 3/4) + 
   labs(x = "Subjectivity", y = "Polarity")

lm2 <- lm(abs(Polarity)~Subjectivity, data=ATNSentiment)
coeff2<-coefficients(lm2) 

ggp2 <- ggplot(ATNSentiment, aes(x = Subjectivity, y = abs(Polarity))) +
   geom_point(size = size, shape = shape, alpha = alpha) +
   geom_abline(intercept = coeff2[1], slope = coeff2[2], color = "red", size=1) + 
   theme(aspect.ratio = 3/4) + 
   labs(x = "Subjectivity", y = "abs(Polarity)")

theme_set(theme_bw())
grid.arrange(ggp1, ggp2, ncol = 2)  


# NAD - Category v. Polarity
model <- lm(Polarity~Publisher, data=ATNSentiment)
anova(model)

ggp1 <- ggplot(ATNSentiment, aes(y = Publisher, x = Polarity, fill = Polarity)) +
   geom_density_ridges(scale = 3, alpha = 0.6, lwd = 0.5) +
   labs(x = "Polarity", y = "") +
   theme(axis.text.y = element_blank())

ggp2 <- ggplot(ATNSentiment, aes(x = Polarity, y = Publisher, fill = Polarity)) +
   geom_boxplot(outlier.shape = NA, outlier.colour = "gray", outlier.fill = "lightgray") +
   labs(x = "Polarity", y = "")

grid.arrange(ggp2, ggp1, ncol = 2) 

# ATN - Pulisher v. Polarity
ggp1 <- ggplot(NADSentiment, aes(y = Category, x = Polarity, fill = Polarity)) +
   geom_density_ridges(scale = 3, alpha = 0.6, lwd = 0.5) +
   labs(x = "Polarity", y = "") +
   theme(axis.text.y = element_blank())

ggp2 <- ggplot(NADSentiment, aes(x = Polarity, y = Category, fill = Category)) +
   geom_boxplot(outlier.shape = NA, outlier.colour = "gray", outlier.fill = "lightgray") +
   labs(x = "Polarity", y = "") +
   theme(legend.position = "none")

grid.arrange(ggp2, ggp1, ncol = 2) 