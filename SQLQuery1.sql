--select *
--from Covid_SQL_Project..CovidVaccinations
--order by 3, 4
select *
from Covid_SQL_Project..CovidDeaths
order by 3, 4

--select the data that we are going to use
select Location, date, total_cases, new_cases, total_deaths, population
from Covid_SQL_Project..CovidDeaths
order by 1,2

--Total cases vs Total deaths 

select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from Covid_SQL_Project..CovidDeaths
where location like '%India%'
order by 1,2

-- Looking at total population vs total cases
Select location, date, total_cases, population, (total_cases/population)*100 as CasesRatio
from Covid_SQL_Project..CovidDeaths
where location like '%India%'
order by 1,2

--Looking at countries with highest infection rate with respect to population

--Select location, population, max(total_cases) as HighestInfectionCount,  max((total_cases/population))*100 as PercentagePopulationInfected
--from Covid_SQL_Project..CovidDeaths
--order by 1,2

--select location, population, MAX(total_cases) as HI, MAX((total_cases/population))*100 as per
--from Covid_SQL_Project..CovidDeaths
--order by 1,2

SELECT location,
       population,
       MAX(total_cases) AS HighestInfectionCount,
       MAX((total_cases/population))*100 AS PercentagePopulationInfected
FROM Covid_SQL_Project..CovidDeaths
GROUP BY location, population
ORDER BY PercentagePopulationInfected desc;

SELECT location,
       population,
       MAX(total_cases) AS HighestInfectionCount,
       MAX((total_cases/population))*100 AS PercentagePopulationInfected
FROM Covid_SQL_Project..CovidDeaths
where continent is not null
GROUP BY location, population
ORDER BY HighestInfectionCount desc;
