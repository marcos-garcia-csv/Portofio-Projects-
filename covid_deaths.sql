#Death Trend, Identifying the top 10 countries with the most deaths
SELECT country,SUM(daily_new_deaths) as Deaths FROM covid_deaths WHERE daily_new_deaths> 0 GROUP BY country ORDER BY SUM(daily_new_deaths) DESC LIMIT 10;

#Case Growth Over Time to observe how cumulative cases and deaths change yearly.
SELECT year(date) as Year,SUM(cumulative_total_cases) AS Cases,FORMAT(SUM(cumulative_total_deaths),2) AS Deaths from covid_deaths group by year(date) ORDER BY year;

#Calculating mortality rate by Country
SELECT country,ROUND(SUM(cumulative_total_deaths)/SUM(cumulative_total_cases)*100,2) as Mortality_Rate FROM covid_deaths group by country ORDER BY Mortality_Rate DESC;

#Calculating mortality rate by Year
SELECT year(date) as Year,ROUND(SUM(cumulative_total_deaths)/SUM(cumulative_total_cases)*100,2) as Mortality_Rate FROM covid_deaths group by year(date) ORDER BY Mortality_Rate DESC;

#Calculating Average number of deaths by country
SELECT country, AVG(daily_new_deaths) AS AVG_Deaths FROM covid_deaths GROUP BY country ORDER BY AVG_Deaths DESC;

#Calculating Average mortality rate by country
SELECT country,ROUND(AVG(cumulative_total_deaths/cumulative_total_cases)*100,2) AS AVG_Mortality_Rate FROM covid_deaths GROUP BY country ORDER BY AVG_Mortality_Rate DESC;

#Calculating Average mortality rate by year
SELECT year(date),ROUND(AVG(cumulative_total_deaths/cumulative_total_cases)*100,2) AS AVG_Mortality_Rate FROM covid_deaths GROUP BY year(date) ORDER BY AVG_Mortality_Rate DESC;

#Calculating average deaths by month and year
SELECT month(date) AS Month_Number,
ROUND(AVG(CASE WHEN year(date) = 2020 THEN cumulative_total_deaths ELSE 0 END),2) AS '2020',
ROUND(AVG(CASE WHEN year(date) = 2021 THEN cumulative_total_deaths ELSE 0 END),2) AS '2021',
ROUND(AVG(CASE WHEN year(date) = 2022 THEN cumulative_total_deaths ELSE 0 END),2) AS '2022'
FROM covid_deaths GROUP BY month(date) ORDER BY Month_Number;

#Calculating average mortality rate by month and year
SELECT month(date) AS Month_Number,
ROUND(100 * SUM(CASE WHEN year(date) = 2020 THEN cumulative_total_deaths ELSE 0 END) / SUM(CASE WHEN year(date) = 2020 THEN cumulative_total_cases ELSE 0 END),2) AS "2020_Mortality",
ROUND(100 * SUM(CASE WHEN year(date) = 2021 THEN cumulative_total_deaths ELSE 0 END) / SUM(CASE WHEN year(date) = 2021 THEN cumulative_total_cases ELSE 0 END),2) AS "2021_Mortality",
ROUND(100 * SUM(CASE WHEN year(date) = 2022 THEN cumulative_total_deaths ELSE 0 END) / SUM(CASE WHEN year(date) = 2022 THEN cumulative_total_cases ELSE 0 END),2) AS "2022_Mortality"
FROM covid_deaths GROUP BY month(date) ORDER BY Month_Number;
