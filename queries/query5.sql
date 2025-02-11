SELECT 
    pr.drug_name_generic, 
    COUNT(DISTINCT pr.hadm_id) AS unique_patient_count
FROM prescriptions pr
JOIN admissions a ON pr.hadm_id = a.hadm_id
JOIN diagnoses_icd d ON a.hadm_id = d.hadm_id
WHERE d.icd9_code = '486'
AND pr.drug_name_generic IS NOT NULL
GROUP BY pr.drug_name_generic
ORDER BY unique_patient_count DESC
LIMIT 5;

