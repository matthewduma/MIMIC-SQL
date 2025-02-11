SELECT 
    p.gender, 
    COUNT(*) AS total_pneumonia_admissions, 
    SUM(CASE WHEN a.deathtime IS NOT NULL THEN 1 ELSE 0 END) AS mortality_count,
    ROUND(100.0 * SUM(CASE WHEN a.deathtime IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS mortality_rate_percent
FROM patients p
JOIN admissions a 
    ON p.subject_id = a.subject_id
WHERE a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY p.gender;
