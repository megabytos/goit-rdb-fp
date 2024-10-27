SELECT Year,
	MAKEDATE(Year, 1) AS first_day_of_year,
	CURRENT_DATE() AS today,
	TIMESTAMPDIFF(YEAR, MAKEDATE(Year, 1), CURRENT_DATE()) as years_ago
FROM infectious_cases;