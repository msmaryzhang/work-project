This is part of my pricing analysis effort against a competitor

The competitor is very well known in the space for being a leader at catalog-type distribution channels (vs. sales-driven/traditional ones), so after consulting with our sales leaders, I've decided to conduct a price analysis using public available data from a catalog website DigiKey.

For data collection in this project, only Python BeatifulSoup and Pandas are not sufficient as the website has blocked access for web scrapping. So I did it more manually with the download option on each page. If the dataset is bigger, I might've hired an API expert to get the data. But in this particular case, manual work costs less and is faster.

For data analysis, which is showcased in the SQL file. I first wanted to understand how I should organize the data - by series, by power level, etc. I've discovered that for each series, the prices are not crazy apart, so by series seems to be a nice way to approach the problem, plus our product team has gone through power level analysis, which is also by series.

When I manually collected the data, 100 items are duplicated. You could see me identify them and eliminate them. 

The next step is to get our product and sales team involved in identifying the series numbers for comparable products so I could conclude like "For xxx series, our pricing is 10% more than yyy competitor".
