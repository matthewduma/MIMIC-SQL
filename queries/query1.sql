SELECT 
    p.gender, 
    COUNT(*) AS pneumonia_admissions
FROM patients p
JOIN admissions a 
    ON p.subject_id = a.subject_id
WHERE a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY p.gender;

