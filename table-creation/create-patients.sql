-- Patients Table
CREATE TABLE patients (
    row_id SERIAL PRIMARY KEY,
    subject_id INT UNIQUE,
    gender VARCHAR(10),
    dob TIMESTAMP,
    dod TIMESTAMP NULL,
    dod_hosp TIMESTAMP NULL,
    dod_ssn TIMESTAMP NULL,
    expire_flag BOOLEAN
);