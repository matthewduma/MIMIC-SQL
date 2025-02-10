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