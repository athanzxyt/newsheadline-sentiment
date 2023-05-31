library(readr)
NADSentiment <- read_csv("data/NewsAggregatorDataset/NADSentiment.csv")
ATNSentiment <- read_csv("data/AllTheNews/ATNSentiment.csv")

# NAD - Category v. Polarity
lm_category <-lm(Polarity ~ Category, data=NADSentiment)
anova(lm_category)
pairwise.t.test(NADSentiment$Polarity,NADSentiment$Category,p.adjust.method ="none")

# ATN - Publisher v. Polarity
lm_publisher <-lm(Polarity ~ Publisher, data=ATNSentiment)
anova(lm_publisher)
pairwise.t.test(ATNSentiment$Polarity,ATNSentiment$Publisher,p.adjust.method ="none")

