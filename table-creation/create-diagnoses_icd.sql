-- Diagnoses Table
CREATE TABLE diagnoses_icd (
    row_id SERIAL PRIMARY KEY,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT REFERENCES admissions(hadm_id),
    seq_num INT,
    icd9_code VARCHAR(10)
);