
---Inspecting imported data
SELECT * FROM dbo.deathcauses


---Checking unique variables
SELECT DISTINCT country FROM dbo.deathcauses
SELECT DISTINCT year FROM dbo.deathcauses
SELECT DISTINCT continent FROM dbo.deathcauses
SELECT COUNT(DISTINCT Country) FROM deathcauses
SELECT COUNT(DISTINCT year) FROM deathcauses
SELECT COUNT(DISTINCT Continent) FROM deathcauses



---Total deaths by any selected cause of any selected country
SELECT country, SUM(poisoning) AS poisoning_deaths 
FROM dbo.deathcauses GROUP BY country
ORDER BY poisoning_deaths DESC


-----Total deaths by selected cause per year
SELECT year,sum(malaria) AS totalyearmalaria_deaths 
FROM dbo.deathcauses GROUP BY year
ORDER BY totalyearmalaria_deaths 


 ----Total deaths due to a specific disease with over 1000 deaths in a year
 SELECT country,year,Cardiovascular
FROM dbo.deathcauses  WHERE Cardiovascular >1000
ORDER BY 2


---Average total annual deaths due selected cause
SELECT avg(HIV_AIDS)  FROM dbo.deathcauses 

 
---Mean deaths of a cause by country in descending order
SELECT Continent,avg(Diabetes) AS mean_diabetesdeaths
FROM dbo.deathcauses GROUP BY Continent 
ORDER BY avg(Diabetes) DESC


---Deaths of a specific group to a specific group cause
SELECT year,country,diarrhaeal,terrorism,Road_injury
from dbo.deathcauses
WHERE country IN('Uganda', 'Congo','Burundi')


---Number of deaths in a  specified period
SELECT year,country,Road_injury from dbo.deathcauses
WHERE Road_injury >=5000 and 
year between 2000 and 2010
order by Road_injury


---deaths according to "like" crirerion search
SELECT Country,YEAR,malaria,Cardiovascular,Digestive,terrorism
FROM dbo.deathcauses WHERE Continent like '%Africa%'
ORDER BY Cardiovascular DESC


---Continents with average deaths of a disease above specific number
 SELECT Continent,avg(malaria) AS Avg_malariadeaths
 FROM deathcauses GROUP BY Continent HAVING avg(malaria) > 1000


---All deaths for all causes in a specicic year 
SELECT * FROM deathcauses
WHERE YEAR =2010  and Population > 30000000



---Records of all other Continents apart from Africa ans Europe 
SELECT * FROM deathcauses 
WHERE Continent NOT IN ('Africa','Europe')


---Total deaths of a disease in a continet
SELECT CONTINENT,MAX(malaria) as total
FROM deathcauses
GROUP BY CONTINENT
ORDER BY MAX(malaria) DESC

