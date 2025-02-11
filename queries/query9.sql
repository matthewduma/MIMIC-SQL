SELECT 
    gender, 
    COUNT(*) AS num_patients, 
    SUM(CASE WHEN pneumonia_admissions > 1 THEN 1 ELSE 0 END) AS readmitted_patients
FROM (
    SELECT 
        p.subject_id, 
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
    GROUP BY p.subject_id, p.gender
) sub
GROUP BY gender;
