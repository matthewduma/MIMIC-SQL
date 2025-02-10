-- Prescriptions Table
CREATE TABLE prescriptions (
    row_id SERIAL PRIMARY KEY,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT REFERENCES admissions(hadm_id),
    icustay_id INT NULL REFERENCES icustays(icustay_id),
    startdate TIMESTAMP,
    enddate TIMESTAMP,
    drug_type VARCHAR(50),
    drug VARCHAR(255),
    drug_name_poe VARCHAR(255) NULL,
    drug_name_generic VARCHAR(255) NULL,
    formulary_drug_cd VARCHAR(50) NULL,
    gsn VARCHAR(255) NULL,
    ndc VARCHAR(50) NULL,
    prod_strength VARCHAR(255) NULL,
    dose_val_rx VARCHAR(50) NULL,
    dose_unit_rx VARCHAR(50) NULL,
    form_val_disp VARCHAR(50) NULL,
    form_unit_disp VARCHAR(50) NULL,
    route VARCHAR(50) NULL
);

