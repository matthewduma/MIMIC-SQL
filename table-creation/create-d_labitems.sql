-- Lab Items Dictionary Table
CREATE TABLE d_labitems (
    row_id SERIAL PRIMARY KEY,
    itemid INT,
    label VARCHAR(255),
    fluid VARCHAR(50),
    category VARCHAR(50),
    loinc_code VARCHAR(50) NULL
);