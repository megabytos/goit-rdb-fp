CREATE table regions (
 id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(45), 
 code VARCHAR(10)
);

INSERT INTO regions (name, code)
SELECT Entity, Code
FROM infectious_cases
GROUP BY Entity, Code;

ALTER TABLE infectious_cases RENAME infectious_cases_tmp;

ALTER TABLE infectious_cases RENAME infectious_cases_tmp;

CREATE TABLE IF NOT EXISTS infectious_cases (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	region_id INT,
	Year INT,
	Number_yaws TEXT,
	polio_cases TEXT,
	cases_guinea_worm TEXT,
	Number_rabies TEXT,
	Number_malaria TEXT,
	Number_hiv TEXT,
	Number_tuberculosis TEXT,
	Number_smallpox TEXT,
	Number_cholera_cases TEXT,
	FOREIGN KEY (region_id) REFERENCES regions(id)
);


INSERT INTO infectious_cases (
	region_id, 
	Year,
	Number_yaws,
	polio_cases,
	cases_guinea_worm,
	Number_rabies,
	Number_malaria,
	Number_hiv,
	Number_tuberculosis,
	Number_smallpox,
	Number_cholera_cases
) 
SELECT id AS region_id,
	Year,
	Number_yaws,
	polio_cases,
	cases_guinea_worm,
	Number_rabies,
	Number_malaria,
	Number_hiv,
	Number_tuberculosis,
	Number_smallpox,
	Number_cholera_cases
FROM infectious_cases_tmp AS t
JOIN regions AS r ON t.entity = r.name AND t.code = r.code;

DROP TABLE infectious_cases_tmp;
