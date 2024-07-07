
# News Headline Sentiment Analysis

![Python Badge](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=fff&style=flat)
![R Badge](https://img.shields.io/badge/R-276DC3?logo=r&logoColor=fff&style=flat)
![LaTeX Badge](https://img.shields.io/badge/LaTeX-008080?logo=latex&logoColor=fff&style=flat)

This repository contains the code and resources for the final project titled "Sentiment Distribution Analysis of News Headlines using Natural Language Processing and ANOVA Techniques."

![header](https://github.com/athanzxyt/newsheadline-sentiment/blob/main/header.png)

The paper can be viewed [here](https://github.com/athanzxyt/newsheadline-sentiment/blob/main/whitepaper/Zhang2023.pdf).

## Abstract

Mean World Syndrome is a perceived cognitive bias in which people tend to see the world as cruel, a feeling that is amplified by repeated negativity in media. However, whether or not the media tends to trend more negatively in their reporting is unknown. This project aims to consider different variables that may affect the sentiment of news headlines in order to understand whether there is a tendency for negativity and how it varies across different news categories and publishers.

## Notable Findings

The below graphic displays the polarities found in the headlines of specific publishers. The density and dot plots are displayed side-by-side. We find that all distributions appear to be relatively symmetric with similar spreads, except for the New York Times. Polarity is calculated on a range between -1 and 1, used to measure negative and positive sentiments, respectively. 

![publishers](https://github.com/athanzxyt/newsheadline-sentiment/blob/main/whitepaper/images/PubPol_Dist.png)

The New York Times has a slightly greater polarity mean as it is shifted to the right of all the other density graphs. As the box plots show, noting that all outliers have already been removed, the publishers all have varying variances. For example, Talking Points Memo, Reuters, National Review, Fox News, CNN, Breitbart, and Atlantic all are centered on a polarity of 0, with almost no variance at all. New York Times, New York Post, Guardian, and Buzzfeed News have a similar range, mostly around 0.25. However, the other publishers all have a relatively high variance, with Business Insider having a range nearing 0.75.

Since our dataset meets the independent condition (there are likely more than one million news articles from 2015-2017), is generated from observation, and appears to be approximately normal (distributions and also generated from a significantly large dataset), we continue with a one-way ANOVA test of homogeneity. The hypothesis of the test can be found below.

$$
\[H_0: \mu_{WaPo} = \mu_{Vox} = ... = \mu_{Atlantic} = \mu_{CNN}\]
\[H_a: \text{At least one of } \mu_k \text{ differs}\]
$$

Where \(\mu_k\) represents the true mean polarity for each publisher. The results of the ANOVA can be found below.

| DF       | Sum Sq | Mean Sq | F-Value | P       |
|----------|--------|---------|---------|---------|
| Category | 14     | 78.4    | 5.5992  | 97.592  | 2.2E-16 |
| Residuals| 142551 | 8178.6  | 0.0574  |         |         |

As we can see, we have a relatively high F-value which suggests that the means are not necessarily all equal. This is furthered by the p-value of 2.2E-16, which is less than \(\alpha = 0.05\); thus, we reject the null hypothesis. There is statistical evidence that one of the news headline categories does not have the same mean polarity.

Conducting a Fisher LSD procedure aids us in identifying which publishers have similar means. The graphic below shoes this relationship.

![relationships](https://github.com/athanzxyt/newsheadline-sentiment/blob/main/whitepaper/images/relationships.png)


## License

[MIT](https://choosealicense.com/licenses/mit/)

