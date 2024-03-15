--======================================================================
-- EXPLORATORY DATA ANALYSIS :
--======================================================================

SELECT *
FROM [Airbnb].[dbo].[AB_NYC_2019] 

SELECT MAX(LEN(host_name))
FROM [Airbnb].[dbo].[AB_NYC_2019]

SELECT MAX(LEN(name))
FROM [Airbnb].[dbo].[AB_NYC_2019]

SELECT MAX(LEN(neighbourhood_group))
FROM [Airbnb].[dbo].[AB_NYC_2019]

SELECT MAX(LEN(neighbourhood))
FROM [Airbnb].[dbo].[AB_NYC_2019]

SELECT MAX(LEN(room_type))
FROM [Airbnb].[dbo].[AB_NYC_2019]

SELECT host_name
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE LEN(host_name) > 30

SELECT name
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE LEN(name) > 150

SELECT *
FROM [Airbnb].[dbo].[AB_NYC_2019]

--======================================================================
-- SUMMARY KPIs
--======================================================================
SELECT 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood_group) AS Number_of_Neighbourhood_Groups,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	COUNT(DISTINCT room_type) AS Number_of_Room_Types,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS Average_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
	FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''

--======================================================================
-- SUMMARY METRICS BY DATE (MONTHLY) : 
--======================================================================
SELECT 
	MONTH(CAST(last_review AS DATE)) AS MonthNumber,
	DATENAME(MONTH, CAST(last_review AS DATE)) AS MonthName,
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY DATENAME(MONTH, CAST(last_review AS DATE)), MONTH(CAST(last_review AS DATE))
ORDER BY MonthNumber ASC;

--======================================================================
-- SUMMARY METRICS BY DATE (QUARTERLY) : 
--======================================================================
SELECT 
	DATEPART(QUARTER, CAST(last_review AS DATE)) AS Quarterly,

	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY DATEPART(QUARTER, CAST(last_review AS DATE))
ORDER BY Quarterly ASC;

--======================================================================
-- SUMMARY METRICS BY DATE (Yearly) : 
--======================================================================
SELECT 
	DATEPART(YEAR, CAST(last_review AS DATE)) AS Yearly,
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY DATEPART(YEAR, CAST(last_review AS DATE))
ORDER BY Yearly ASC;

--======================================================================
-- SUMMARY METRICS BY LOCATION (LATTITUDE & LONGITUDE) :
--======================================================================
SELECT 
	latitude, 
	longitude, 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY latitude, longitude

--======================================================================
-- SUMMARY METRICS BY NEIGHBOURHOODS :
--======================================================================
SELECT 
	neighbourhood, 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood

--======================================================================
-- SUMMARY METRICS BY ROOMTYPES :
--======================================================================
SELECT 
	room_type, 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY room_type

--======================================================================
-- SUMMARY METRICS BY NEIGHBOURHOOD GROUPS :
--======================================================================
SELECT 
	neighbourhood_group, 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood_group) AS Number_of_Neighbourhood_Groups,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	COUNT(DISTINCT room_type) AS Number_of_Room_Types,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS Average_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood_group

--======================================================================
-- SUMMARY METRICS BY DATE (MONTHLY) with NEIGHBOURHOOD GROUPS : 
--======================================================================
SELECT 
	neighbourhood_group, 
	MONTH(CAST(last_review AS DATE)) AS MonthNumber, 
	DATENAME(MONTH, CAST(last_review AS DATE)) AS MonthName,
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood_group, DATENAME(MONTH, CAST(last_review AS DATE)), MONTH(CAST(last_review AS DATE))
ORDER BY MonthNumber ASC;

--======================================================================
-- SUMMARY METRICS BY DATE (QUARTERLY) with NEIGHBOURHOOD GROUPS : 
--======================================================================
SELECT 
	neighbourhood_group, 
	DATEPART(QUARTER, CAST(last_review AS DATE)) AS Quarterly,
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood_group, DATEPART(QUARTER, CAST(last_review AS DATE))
ORDER BY Quarterly ASC;

--======================================================================
-- SUMMARY METRICS BY DATE (Yearly) with NEIGHBOURHOOD GROUPS : 
--======================================================================
SELECT 
	neighbourhood_group, 
	DATEPART(YEAR, CAST(last_review AS DATE)) AS Yearly,
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood_group, DATEPART(YEAR, CAST(last_review AS DATE))
ORDER BY Yearly ASC;

--======================================================================
-- SUMMARY METRICS BY LOCATION (LATTITUDE & LONGITUDE) with NEIGHBOURHOOD GROUPS :
--======================================================================
SELECT 
	neighbourhood_group, 
	latitude, 
	longitude, 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood_group, latitude, longitude

--======================================================================
-- SUMMARY METRICS BY NEIGHBOURHOODS with NEIGHBOURHOOD GROUPS :
--======================================================================
SELECT 
	neighbourhood_group, 
	neighbourhood, 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood_group, neighbourhood

--======================================================================
-- SUMMARY METRICS BY ROOMTYPES with NEIGHBOURHOOD GROUPS :
--======================================================================
SELECT 
	neighbourhood_group, 
	room_type, 
	COUNT(DISTINCT id) AS Number_of_Listings,
	COUNT(DISTINCT host_id) AS Number_of_Hosts,
	COUNT(DISTINCT neighbourhood) AS Number_of_Neighbours,
	ROUND(AVG(CAST(price AS FLOAT)), 2) AS Average_Price,
	AVG(CAST(minimum_nights AS INT)) AS Average_Number_of_Nights,
	AVG(CAST(number_of_reviews AS INT)) AS Average_Number_of_Reviews,
	ROUND(AVG(CAST(reviews_per_month AS FLOAT)), 2) AS Average_number_of_Reviews_per_Month,
	AVG(CAST(calculated_host_listings_count AS INT)) AS AVerage_Host_List_Count,
	AVG(CAST(availability_365 AS INT)) AS Average_Availability
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE reviews_per_month <> ''
AND last_review <> ''
GROUP BY neighbourhood_group, room_type

--======================================================================
-- CREATE A FRESH TABLE WITH CORRECT TABLE VALUES : 
--======================================================================
CREATE TABLE NewYork19 
(
	id				INT,
	name			VARCHAR(200),
	host_id			INT,
	host_name		VARCHAR(50),
	neighbourhood_group VARCHAR(20),
	neighbourhood	VARCHAR(30),
	latitude		FLOAT,
	longitude       FLOAT,
	room_type		VARCHAR(20),
	price			FLOAT,
	minimum_nights INT,
	number_of_reviews INT,
	last_review    DATE,
	reviews_per_month FLOAT,
	calculated_host_listing_count INT,
	availability_365 INT
	)
INSERT INTO NewYork19
SELECT 
    NULLIF(id, '') AS id,
    NULLIF(name, '') AS name,
    NULLIF(host_id, '') AS host_id,
    NULLIF(host_name, '') AS host_name,
    NULLIF(neighbourhood_group, '') AS neighbourhood_group,
    NULLIF(neighbourhood, '') AS neighbourhood,
    NULLIF(latitude, '') AS latitude,
    NULLIF(longitude, '') AS longitude,
    NULLIF(room_type, '') AS room_type,
    NULLIF(price, '') AS price,
    NULLIF(minimum_nights, '') AS minimum_nights,
    NULLIF(number_of_reviews, '') AS number_of_reviews,
	CASE WHEN NULLIF(last_review, '') = '' THEN NULL ELSE CONVERT(DATE, last_review) END AS last_review,
    NULLIF(reviews_per_month, '') AS reviews_per_month,
    NULLIF(calculated_host_listings_count, '') AS calculated_host_listings_count,
    NULLIF(availability_365, '') AS availability_365
FROM [Airbnb].[dbo].[AB_NYC_2019]

--======================================================================
-- DROP THE ANALYSIS TABLE
--======================================================================
DROP TABLE NewYork19

--======================================================================
-- VIEW FOR TABLEAU : 
--======================================================================
CREATE VIEW [NewYork19]
AS
SELECT 
    NULLIF(id, '') AS id,
    COALESCE(NULLIF(name, ''), 'others') AS name,
    NULLIF(host_id, '') AS host_id,
    COALESCE(NULLIF(host_name, ''), 'others') AS host_name,
    NULLIF(neighbourhood_group, '') AS neighbourhood_group,
    NULLIF(neighbourhood, '') AS neighbourhood,
    NULLIF(latitude, '') AS latitude,
    NULLIF(longitude, '') AS longitude,
    NULLIF(room_type, '') AS room_type,
    NULLIF(price, '') AS price,
    NULLIF(minimum_nights, '') AS minimum_nights,
    NULLIF(number_of_reviews, '') AS number_of_reviews,
	NULLIF(last_review, '') AS last_review,
    NULLIF(reviews_per_month, '') AS reviews_per_month,
    NULLIF(calculated_host_listings_count, '') AS calculated_host_listings_count,
    NULLIF(availability_365, '') AS availability_365
FROM [Airbnb].[dbo].[AB_NYC_2019]
WHERE last_review <> ''
AND reviews_per_month <> '';

DROP VIEW NewYork19



