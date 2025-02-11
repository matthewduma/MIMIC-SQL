SELECT 
    p.gender, 
    AVG(i.los) AS avg_icu_los
FROM icustays i
JOIN admissions a 
    ON i.hadm_id = a.hadm_id
JOIN patients p 
    ON a.subject_id = p.subject_id
WHERE a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY p.gender;

