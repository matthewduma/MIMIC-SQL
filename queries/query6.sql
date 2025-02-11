SELECT 
    pr.route,
    COUNT(DISTINCT pr.hadm_id) AS unique_route_count
FROM prescriptions pr
JOIN admissions a 
    ON pr.hadm_id = a.hadm_id
JOIN patients p 
    ON a.subject_id = p.subject_id
WHERE a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY pr.route;
