SELECT 
    a.insurance, 
    COUNT(*) AS num_admissions
FROM admissions a
JOIN patients p 
    ON a.subject_id = p.subject_id
WHERE a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY a.insurance;
