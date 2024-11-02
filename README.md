# Analysis of the Real Estate Market in Wroclaw: Strategic Decision-Making for Landlords

## Table of Contents
1. [Introduction](#introduction)
2. [Wroclaw Real Estate Market Overview](#wroclaw-real-estate-market-overview)
3. [Data Collection and Methodology](#data-collection-and-methodology)
4. [Rental Market Analysis](#rental-market-analysis)
5. [Property Pricing Dynamics](#property-pricing-dynamics)
6. [Key Neighborhood Profiles](#key-neighborhood-profiles)
7. [Strategic Considerations for Landlords](#strategic-considerations-for-landlords)
8. [Conclusion](#conclusion)

## 1 Introduction
In the dynamic realm of real estate, strategic decision-making is paramount for landlords seeking to navigate the ever-evolving market landscape. This report serves as a comprehensive analysis of the real estate market in Wroclaw, drawing insights from a meticulously conducted project utilizing R and web scraping techniques on the OtoDom.pl website. As the fourth-largest city in Poland, Wroclaw’s property market is a tapestry of opportunities and challenges. Through this analysis, we aim to provide landlords with valuable insights, enabling them to make informed decisions that align with the city’s current real estate trends.

## 2 Wroclaw Real Estate Market Overview
Wroclaw’s real estate market reflects a city that has experienced steady economic growth, contributing to a positive environment for property investment. Diverse economic sectors, including IT, manufacturing, and services, play pivotal roles in shaping the city’s real estate landscape. The population of Wroclaw has been on the rise, fueled by both domestic migration and an influx of residents from other European Union countries. This population growth is a key factor influencing the demand for housing.

Urban development projects have been transforming Wroclaw, enhancing its overall appeal. The city has witnessed infrastructure improvements and modernization efforts, impacting property values and demand. In the residential real estate sector, a variety of housing options, from apartment complexes to detached houses, cater to the diverse needs of the population. The commercial real estate market in Wroclaw is also burgeoning, with the development of office spaces and retail establishments. The rental market is significant, accommodating both locals and expatriates.

## 3 Data Collection and Methodology
We utilized the R programming language along with web scraping techniques to collect real estate data from the OtoDom.pl website for properties available for rent in Wroclaw. The process involved scraping links to adverts from multiple pages, extracting relevant details such as address, description, price, area, and additional information.

### 3.1 Web Scraping Pages
We scraped links to adverts using the `rvest`, `httr`, `stringi`, and `tidyverse` packages in R. 

### 3.2 Accessing Property Details
After saving URLs for every advert, we extracted relevant details, which were then stored in a comprehensive data frame.

### 3.3 Data Cleaning Process
The collected data underwent a cleaning process to enhance its reliability and usability, involving steps such as dividing addresses into components, splitting value numbers and units, and changing description features into binary columns.

## 4 Rental Market Analysis

We’re digging into details like how much properties are rented for, what landlords are earning, and the unique qualities of each neighborhood. By examining ads, types of buildings, materials used, heating systems, and window styles, we’re giving landlords a clear picture of what shapes property values and what tenants prefer.

We want to not only show the current state of the rental market but also help landlords lay the groundwork for making savvy choices. The real estate market changes with the economy and society, and this analysis is here to make sure landlords have the know-how to adjust, succeed, and get the most out of their investments.

The histogram reveals a notable increase in property demand for rentals priced from 0 to 750 zł, indicating a potential sweet spot for attracting tenants. However, beyond 750 zł to 2000 zł, there’s a decline in frequency, suggesting a decrease in demand as prices rise. Landlords aiming for higher rent brackets should be aware of the less common occurrence of prices above 2000 zł.

The second graph suggests a significant presence of landlords with more modest incomes. Those targeting this market segment may find opportunities for competitive pricing. Conversely, landlords aiming for higher-end properties should note the limited frequency of incomes exceeding 10000 zł, signaling less competition in this segment.

The next histogram suggests a substantial presence of properties with lower deposit requirements. Adjusting deposit policies to align with this market norm can enhance accessibility for a broader tenant base. Additionally, the scarcity of higher deposit values above 10000 zł signals potential market opportunities with less competition in premium property segments.

The final histogram reveals an ascending order of average rent prices across Wrocław districts, with Fabryczna being the most budget-friendly and Siechnice commanding the highest averages.

In the first pie chart detailing advertiser types, estate agencies (biuro nieruchomości) emerge as the predominant advertisers, constituting a substantial 68.5% of the total. Private advertisements (prywatny) follow with a share of 30.7%, while developers (deweloper) lag behind with a modest 0.8% of the total instances.

For the next pie chart detailing heating types, the predominant category is Municipal (miejskie), comprising a substantial 69.8% of the total. Notably, the absence of information about heating types constitutes 18.5% of the distribution. Gas heating (gazowe) follows as the second most prevalent category, representing 6.9% of the data. Boiler room heating (kotłownia) and electric heating (elektryczne) contribute 1.7% and 1.5%, respectively. Another unspecified heating type accounts for 1.4%.

This pie chart provides insightful information for property stakeholders, showcasing the prevailing heating preferences in the market. This data can be invaluable for potential buyers or tenants seeking properties with specific heating preferences or requirements.

In the window type pie chart, the prevalent category is Plastic (plastikowe), constituting a majority share of 53.5% in the total distribution. Conversely, a significant portion, 39.1%, lacks information about the specific window types used. Wooden (drewniane) windows represent 6.2% of the data, while aluminum (aluminiowe) windows contribute 1.2%.

## 5 Property Pricing Dynamics

This chapter delves into the multifaceted landscape of property pricing dynamics, employing insightful visualizations to unravel the relationships between key factors and rental prices. By finding a deeper understanding of the intricate interplay between property characteristics and rental values, we aim to facilitate more informed decision-making within the dynamic real estate market.

### 5.1 Standard Features

The scatter plot in our analysis reveals a compelling dependence between the rental price and the area of the flat. As expected, a discernible trend emerges, indicating that larger flats command higher rental prices. This correlation underscores the inherent value placed on spacious living areas within the real estate market.

Intriguingly, the use of distinct shapes for different room configurations enhances the clarity of our observations. Notably, square shapes are employed for 2-room flats, circles for 3-room flats, ‘x’ marks for 4-room flats, and triangles for 5-room flats. Examining the right side of the plot, we observe a prevalence of ‘x’ marks and triangles, logically aligning with the expectation that larger flats tend to have more rooms. Conversely, on the left side of the scatter plot, where the area of flats ranges from 30 to 70 square meters, a greater dispersion of points is evident. This distribution predominantly comprises square and circular shapes, signifying a higher frequency of 2 and 3-roomed flats within this size range.

The boxplots depicting rent prices in relation to the number of floors in the building offer compelling insights into the distribution and variation of rental values across different building heights. Notably, a concentration of flats is observed on floors ranging from 1 to 5, as indicated by the broader spread of boxes in this range. As we progress to floors 6 and 7, a notable shift occurs, characterized by a larger interquartile range, denoted by the bigger box. This expansion implies that the third quartile (the upper boundary of the box) is higher for flats on these floors, suggesting a significant uptick in rental prices on the higher floors compared to the lower ones.

In contrast, floors 8, 9, and 10 exhibit a distinct pattern. Here, the boxplots reveal a decrease in the count of flats, indicating a lower availability of properties on these higher floors. Concurrently, the average rental prices exhibit a descending trend, portraying a reduction in the central tendency of rental values. This inverse relationship between floor height and average rental price on floors 8-10 stands in contrast to the ascending average observed on floors 1-7.

The boxplots illustrating rent prices relative to the built year ranges provide a comprehensive perspective on the temporal dynamics within the real estate market. Notably, a pronounced observation is the prevalence of higher rental prices in the more recent year ranges, specifically between 2009 and 2024 (actual year). This trend is evidenced by the numerous outlier points that stand out in these periods, suggesting an increased occurrence of premium rental values during this timeframe.

Contrastingly, the inverse relationship between the average rental price and the built year becomes evident. As the built year of the flat decreases, reflecting older properties, the average rental price tends to decrease as well. This aligns with the general expectation that newer constructions often command higher rents due to modern amenities and improved infrastructure.

However, the unexpected rise in average prices for flats constructed between 1899 and 1890 introduces an intriguing anomaly. This counterintuitive increase may be indicative of unique historical or architectural features associated with these older properties, contributing to their perceived value and subsequent rental prices.

### 5.2 Additional Features

Below we will analyse three graphs:

- **Average Price vs Presence of Utilities (Balcony, Garden, Terrace):**  
  The examination of average rental prices concerning the presence of utilities reveals how certain amenities contribute to property values. Balconies, gardens, and terraces often enhance the living experience, and their presence is likely associated with higher average rental prices.

- **Average Price vs Presence of Equipment (Dishwasher, Furniture, Oven, Refrigerator, Stove, TV, Washing Machine):**  
  This analysis explores the impact of various equipment on rental prices. Properties equipped with amenities such as a dishwasher, furniture, oven, refrigerator, stove, TV, and washing machine may command higher average rental prices due to increased convenience and functionality.

- **Average Price vs Presence of Additional Features (Air Conditioning, Basement, Cable TV, Garage/Parking, Internet, Lift, Separate Kitchen):**  
  The presence of additional features often adds distinct value to a property, influencing its rental price. Features such as air conditioning, basement, cable TV, garage/parking, internet, lift, and a separate kitchen may contribute to higher average rental prices, reflecting increased comfort and desirability.

Each analysis provides a nuanced understanding of how specific attributes and amenities influence the rental market. These insights can prove invaluable for both tenants seeking properties tailored to their preferences and landlords aiming to strategically position their offerings in the competitive real estate landscape. The correlation between these features and average rental prices offers a comprehensive overview of the diverse factors that contribute to the valuation of residential properties.

The first graph underscores the significance of outdoor spaces. A flat with a balcony commands a slightly higher average rental price, while those with a garden experience a noticeable increase. Remarkably, properties featuring a terrace exhibit a substantially higher average rent. Landlords should consider leveraging these outdoor amenities to attract tenants willing to pay a premium for enhanced living spaces.

In the second analysis, having a dishwasher and TV appears to offer a modest advantage in rental pricing. However, the absence of discernible trends for furniture, oven, refrigerator, stove, and washing machine may be attributed to data collection nuances. It is conceivable that some advertisers opt for a narrative approach in their descriptions, rendering exhaustive checkboxes unnecessary. Landlords are encouraged to highlight these amenities explicitly in property descriptions to maximize their impact on perceived value.

The third graph unveils the potential impact of additional features on rental prices. Properties equipped with air conditioning command a significantly higher average rent, while those with cable TV, garage/parking, internet, and a lift experience a modest uptick. Interestingly, having a basement has a neutral effect, and the presence of a separate kitchen does not consistently outperform kitchenettes. Landlords should carefully weigh the cost-benefit of these features, considering tenant preferences in their target market.

In essence, these insights offer landlords strategic cues for pricing their flats based on distinct amenities and features. By aligning rental prices with tenant preferences and market trends, landlords can optimize their property’s perceived value, making it a more attractive and competitive option in the dynamic real estate landscape.

The pie chart depicting preferences regarding smoking in rental ads sheds light on a notable trend within the real estate market. Approximately 19.1% of advertisements explicitly express a preference not to rent to individuals who smoke. This insight underscores a growing consideration among landlords and property managers regarding the impact of smoking habits on the desirability of their rental units.

Non-smoking preferences may reflect a broader emphasis on maintaining a smoke-free environment within rental properties. As such, tenants who do not smoke may find a higher number of options aligned with their lifestyle preferences, while landlords can strategically position their properties to cater to this demographic.

This trend also highlights the increasing importance of lifestyle factors in shaping the dynamics of the rental market. By being attuned to these preferences, landlords can enhance their property marketing strategies, better aligning their offerings with the expectations and priorities of potential tenants.

## 6 Key Neighborhood Profiles

In the analysis of key neighborhood profiles, we utilized various visualizations to gain insights into growth potential, amenities, and security features and average prices across different neighborhoods in Wrocław.

### 6.1 Neighborhood Growth Potential

We employed a bubble map to highlight neighborhoods with growth potential based on average property prices. The size of each bubble represents the average price in the respective neighborhood, while the color gradient indicates the level of growth potential. This visualization allows for a quick and intuitive identification of areas that might be attractive for investment or show signs of future development.

The analysis of average rent prices in Wrocław reveals a discernible variation, with the spectrum spanning from 2000 PLN to nearly 5500 PLN per month. Notably, the more economical options predominantly align with the northern sectors of the city.

**Top 3 Most Expensive Neighborhoods in Wrocław According to Average Rent Price:**

1. **Dąbie:** Positioned as the most expensive locale, boasting an average rent price of **5424.75 PLN** per month.
2. **Zalesie:** Securing the second position in the hierarchy, this neighborhood commands an average rent of **4900 PLN** per month.
3. **Radomierzyce:** Occupying the third position, Radomierzyce stands out with an average rent price of **4600 PLN** per month.

For landlords, focusing on these premium neighborhoods is recommended for renting properties with the highest income potential. This involves understanding the market, tenant preferences, and optimizing property features to appeal to the target demographic in these sought-after areas.

### 6.2 Price vs. Number of Amenities

In the first scatter plot, we examined the relationship between the price of a flat and the number of amenities it offers. The plot includes amenities such as dishwasher, refrigerator, furniture, oven, stove, washing machine, TV, cable TV, internet, and air conditioning. Each point on the scatter plot represents a property, and the position of the point is determined by its price and the count of amenities it provides. This helps in understanding how the presence of amenities influences property prices, providing valuable insights for both buyers and sellers.

The second scatter plot explores the impact of security-related amenities on property prices. It includes features such as closed area, intercom videophone, monitoring security, anti-burglary doors/windows, anti-burglary rollers, and alarm systems. Similar to the previous scatter plot, each point on this graph represents a property, with its position determined by the property’s price and the count of security-related amenities. This visualization aids in understanding the correlation between security features and property values, crucial for both homeowners and potential tenants.

In the first scatter plot, the number of amenities does not show a significant impact on the flat’s price. The trend line remains relatively stable, indicating a marginal increase in price with an increase in amenities. This suggests that, in general, the presence of amenities alone might not substantially influence the overall price of the flat.

Conversely, the second scatter plot demonstrates a clear upward trend in the trend line. This implies that as the number of security amenities in a flat increases, the flat’s price tends to rise significantly. The correlation between security features and pricing is more pronounced, suggesting that security considerations play a more substantial role in determining the value of a property.

These observations emphasize the importance of security-related amenities in influencing property prices, while also highlighting that other amenities may have a more marginal impact.

## 7 Strategic Considerations for Landlords

In this chapter, we delve into strategic considerations for landlords, exploring key factors in their adverts that can influence rent prices.

The first plot investigates the impact of the length of property descriptions in advertisements on rent prices. By examining the scatter plot and trend line, landlords can discern whether a more detailed property description correlates with higher rent prices.

The second scatter plot explores the relationship between the length of property titles in advertisements and rent prices. Analyzing this plot allows landlords to gauge whether a succinct or elaborate title has any discernible impact on rent prices. Crafting attention-grabbing yet concise titles can be a strategic move to attract potential tenants and potentially influence rental rates.

In the third scatter plot, we assess how the number of photos in property advertisements correlates with rent prices. Landlords can glean insights into tenant preferences by observing whether a higher number of photos positively influences rent prices.

The first plot clearly illustrates the significant influence of description length on rent prices. Longer descriptions, particularly within the range of 0 to 4000 characters, are associated with higher rent prices. Landlords are advised to craft comprehensive and detailed property descriptions to potentially enhance the perceived value of their rentals and justify higher rental rates.

While title length does not exert as strong an influence on rent prices, there is a discernible trend. Flats with longer titles, especially those around 50 characters, tend to command higher rent prices compared to their shorter-titled counterparts. While not as pronounced as description length, optimizing property titles for clarity and informativeness can still contribute to favorable rental pricing.

One of the standout findings is the substantial impact of the number of photos on rent prices. The positive correlation indicates that a higher number of photos in property advertisements is associated with higher rent prices. Landlords are strongly recommended to prioritize uploading more photos to their adverts, as it appears to be a key factor influencing potential tenants’ perceptions and willingness to pay higher rents.

## 8 Conclusion

The report, “Analysis of the Real Estate Market in Wrocław: Strategic Decision-Making for Landlords” delves into the intricate details of the rental landscape in Wrocław, aiming to empower landlords with comprehensive insights for informed decision-making. By scrutinizing various aspects, such as property prices, landlord earnings, neighborhood characteristics, and tenant preferences, the analysis not only presents the current state of the market but also equips landlords with the knowledge to adapt to changing economic and societal dynamics.

### Our Key Findings:

Our analysis of the Wrocław rental market highlights key trends and insights for landlords and property managers. We observed a notable surge in demand for rentals priced between 0 to 700 PLN, suggesting an attractive range for potential tenants. However, as prices exceed 750 PLN, there is a decline in demand, emphasizing the importance of pricing strategy.

Landlords aiming for higher rents should note the limited occurrence of prices above 2000 PLN and the relatively low frequency of incomes exceeding 10000 PLN, indicating less competition in the higher-end segment.

Deposit policies should align with market norms, as our data shows a significant presence of properties with lower deposit requirements, enhancing accessibility for a broader tenant base.

In terms of location, our report reveals a descending order of average rent prices across Wrocław districts, with Fabryczna being the most budget-friendly and Siechnice commanding the highest averages.

Analyzing advertiser types, estate agencies dominate with a **68.5%** share, followed by private advertisements at **30.7%**, and developers at **0.8%**.

Examining building types, apartment blocks and buildings lead with a combined share of **74.1%**, while houses and tenement houses constitute smaller portions.

Window types highlight a majority of “Plastic” at **53.5%**, with **39.1%** lacking information, and wooden windows at **6.2%**.

A correlation between rental price and flat area indicates larger flats command higher prices, emphasizing the value placed on spacious living areas.

Analyzing rent prices by the number of floors reveals a concentration on lower floors, with an interesting shift on higher floors showing an uptick in prices.

Built year ranges show higher rental prices for more recent constructions, but an anomaly exists with an unexpected rise in prices for flats constructed between **1890 and 1899**.

The presence of utilities, equipment, and additional features in rental properties correlates with higher average rental prices, providing insights for landlords to enhance property value.

Preferences regarding smoking in rental ads show a trend, with **19.1%** expressing a preference not to rent to smokers.

In terms of location, Wrocław’s average rent prices vary, with Dąbie, Zalesie, and Radomierzyce being the top three most expensive neighborhoods.

While the number of amenities in a flat shows a marginal impact on price, the number of security amenities significantly influences rental prices.

Description length has a substantial impact on rent prices, with longer descriptions associated with higher rents, urging landlords to craft comprehensive and detailed property descriptions.

Title length, although not exerting a strong influence, shows a trend, with longer titles associated with higher rent prices.

The number of photos in property advertisements correlates positively with higher rent prices, highlighting the importance of uploading more photos to attract potential tenants and justify higher rents.
