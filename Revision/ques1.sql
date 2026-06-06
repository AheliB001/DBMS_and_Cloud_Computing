--a)
SELECT r.researcher_id,
       r.Name,
       COUNT(rp.project_id) AS project_count
FROM Researcher r
JOIN Researcher_Project rp
ON r.researcher_id = rp.researcher_id
GROUP BY r.researcher_id, r.Name
HAVING COUNT(rp.project_id) > 2;


--b)
SELECT d.disease_id,
       d.disease_name,
       COUNT(sd.sample_id) AS sample_count
FROM Disease d
JOIN Sample_Disease sd
ON d.disease_id = sd.disease_id
GROUP BY d.disease_id, d.disease_name
ORDER BY sample_count DESC
LIMIT 1;


--c)
SELECT DISTINCT d.disease_id,
                d.disease_name
FROM Disease d
JOIN Project_Disease pd
ON d.disease_id = pd.disease_id
JOIN Project p
ON pd.project_id = p.project_id
WHERE p.Budget > 10000000;


--d)
SELECT *
FROM Sample
WHERE YEAR(collection_date) = 2025;


--e)
DELIMITER //

CREATE TRIGGER sample_uppercase
BEFORE INSERT ON Sample
FOR EACH ROW
BEGIN
    SET NEW.sample_id = UPPER(NEW.sample_id);
END//

DELIMITER ;
