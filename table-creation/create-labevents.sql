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