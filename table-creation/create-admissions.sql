-- Admissions Table
CREATE TABLE admissions (
    row_id SERIAL PRIMARY KEY,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT UNIQUE,
    admittime TIMESTAMP,
    dischtime TIMESTAMP,
    deathtime TIMESTAMP NULL,
    admission_type VARCHAR(50),
    admission_location VARCHAR(100),
    discharge_location VARCHAR(100),
    insurance VARCHAR(50),
    language VARCHAR(10) NULL,
    religion VARCHAR(50) NULL,
    marital_status VARCHAR(50) NULL,
    ethnicity VARCHAR(100),
    edregtime TIMESTAMP NULL,
    edouttime TIMESTAMP NULL,
    diagnosis TEXT NULL,
    hospital_expire_flag BOOLEAN,
    has_chartevents_data BOOLEAN
);