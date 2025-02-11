SELECT 
    d.label, 
    COUNT(*) AS lab_order_count
FROM labevents l
JOIN d_labitems d 
    ON l.itemid = d.itemid
JOIN admissions a 
    ON l.hadm_id = a.hadm_id
JOIN patients p 
    ON a.subject_id = p.subject_id
WHERE a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY d.label
ORDER BY lab_order_count DESC
LIMIT 10;
