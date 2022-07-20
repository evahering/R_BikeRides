---
title: "Cyclist Case Study"
author: "Eva Hering"
date: '2022-07-20'
output: html_document
---

```{r setup, include=FALSE}

library(ggplot2)


```

## Scenario
$~$
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director
of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,
your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,
your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives
must approve your recommendations, so they must be backed up with compelling data insights and professional data
visualizations.
$~$
## Questions
$~$
Since the director of marketing wants to maximise the number of annual memberships I had to find out how many trips have been done by members and casual riders.

$~$



![](plot_member_type.png)

$~$


Now that we know that the casual riders use the bikes more than the members, it would be useful to know when the bikes get used the most to target the marketing strategy. I calculated the rides per day of the week.

$~$


![](plot_popular_day.png)
$~$

Friday and Saturday are clearly the most popular days of the week followed by Thursday. 

It would make sense to increase the incentive to use the company's service on less popular days through marketing and targeted advertisement. 
