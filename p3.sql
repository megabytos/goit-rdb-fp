SELECT r.name, r.code,
	AVG(i.Number_rabies) as avg_number_rabies,
	MIN(i.Number_rabies) as min_number_rabies,
	MAX(i.Number_rabies) as max_number_rabies,
	SUM(i.Number_rabies) as sum_number_rabies
FROM infectious_cases AS i
INNER JOIN regions AS r ON r.id = i.region_id
WHERE Number_rabies != ''
GROUP BY r.name, r.code 
ORDER BY avg_number_rabies DESC 
LIMIT 10;