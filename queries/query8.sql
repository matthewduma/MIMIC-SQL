SELECT 
    p.gender, 
    AVG(l.valuenum)*1000 AS avg_wbc
FROM labevents l
JOIN d_labitems d 
    ON l.itemid = d.itemid
JOIN admissions a 
    ON l.hadm_id = a.hadm_id
JOIN patients p 
    ON a.subject_id = p.subject_id
WHERE l.itemid IN (
   SELECT itemid 
   FROM d_labitems 
   WHERE itemid = 51300
)
AND a.hadm_id IN (
    SELECT hadm_id 
    FROM diagnoses_icd 
    WHERE icd9_code = '486'
)
GROUP BY p.gender;

