SELECT 
    p.gender, 
    AVG(EXTRACT(EPOCH 
    	FROM (a.dischtime - a.admittime))/86400
    	) 
    AS avg_length_of_stay_days
FROM admissions a
JOIN patients p 
    ON a.subject_id = p.subject_id
WHERE a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY p.gender;

