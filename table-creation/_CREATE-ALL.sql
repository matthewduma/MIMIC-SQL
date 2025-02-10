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

-- Diagnoses Table
CREATE TABLE diagnoses_icd (
    row_id SERIAL PRIMARY KEY,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT REFERENCES admissions(hadm_id),
    seq_num INT,
    icd9_code VARCHAR(10)
);

-- ICU Stays Table
CREATE TABLE icustays (
    row_id SERIAL PRIMARY KEY,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT REFERENCES admissions(hadm_id),
    icustay_id INT UNIQUE,
    dbsource VARCHAR(20),
    first_careunit VARCHAR(50),
    last_careunit VARCHAR(50),
    first_wardid INT,
    last_wardid INT,
    intime TIMESTAMP,
    outtime TIMESTAMP,
    los FLOAT
);

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

-- Lab Items Dictionary Table
CREATE TABLE d_labitems (
    row_id SERIAL PRIMARY KEY,
    itemid INT UNIQUE,
    label VARCHAR(255),
    fluid VARCHAR(50),
    category VARCHAR(50),
    loinc_code VARCHAR(50) NULL
);

-- Lab Events Table
CREATE TABLE labevents (
    row_id SERIAL PRIMARY KEY,
    subject_id INT REFERENCES patients(subject_id),
    hadm_id INT NULL REFERENCES admissions(hadm_id),
    itemid INT REFERENCES d_labitems(itemid),
    charttime TIMESTAMP,
    value VARCHAR(255) NULL,
    valuenum FLOAT NULL,
    valueuom VARCHAR(50) NULL,
    flag VARCHAR(50) NULL
);
