This is part of my pricing analysis effort against a competitor

The competitor is very well known in the space for being a leader at catalog type distribution channels (vs. sales driven ones), so after consulting with our sales leaders, I've decided to coduct a price analysis using public available data from a catalog website DigiKey

For data collection in this project, only Python BeatifulSoup and Pandas are not sufficient as the website has blocked access for webscrapping. So I did it more manually. If the dataset is bigger, I might've hire an API expert to get the data. But in this particular case, manually work costs less and is faster.

For data analysis, which is showcased in the sql file. I first wanted to understand the scale for the analysis. By series, by power level etc. I've discovered that for each series, the prices are not crazy apart, so by series seems to be a nice way to approach the problem, plus our product team has gone through power level analysis, which is also by series.

When I manually collected the data, there was 100 items that are duplicated. You could see me identify it and eliminate it. 

Next step is to get our product and sales team involved on telling me the series numbers for comparable product so I could come to the conclusion like "For xxx series, our pricing is 10% more than yyy competitor".
