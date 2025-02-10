COPY patients(row_id, subject_id, gender, dob, dod, dod_hosp, dod_ssn, expire_flag)
FROM '/Users/mattduma/Documents/mimic-iii-clinical-database-1.4/PATIENTS.csv' 
DELIMITER ',' CSV HEADER NULL '';

COPY admissions(row_id, subject_id, hadm_id, admittime, dischtime, deathtime, admission_type, admission_location, discharge_location, insurance, language, religion, marital_status, ethnicity, edregtime, edouttime, diagnosis, hospital_expire_flag, has_chartevents_data)
FROM '/Users/mattduma/Documents/mimic-iii-clinical-database-1.4/ADMISSIONS.csv' 
DELIMITER ',' CSV HEADER NULL '';

COPY diagnoses_icd(row_id, subject_id, hadm_id, seq_num, icd9_code)
FROM '/Users/mattduma/Documents/mimic-iii-clinical-database-1.4/DIAGNOSES_ICD.csv' 
DELIMITER ',' CSV HEADER NULL '';

COPY icustays(row_id, subject_id, hadm_id, icustay_id, dbsource, first_careunit, last_careunit, first_wardid, last_wardid, intime, outtime, los)
FROM '/Users/mattduma/Documents/mimic-iii-clinical-database-1.4/ICUSTAYS.csv' 
DELIMITER ',' CSV HEADER NULL '';

COPY prescriptions(row_id, subject_id, hadm_id, icustay_id, startdate, enddate, drug_type, drug, drug_name_poe, drug_name_generic, formulary_drug_cd, gsn, ndc, prod_strength, dose_val_rx, dose_unit_rx, form_val_disp, form_unit_disp, route)
FROM '/Users/mattduma/Documents/mimic-iii-clinical-database-1.4/PRESCRIPTIONS.csv' 
DELIMITER ',' CSV HEADER NULL '' QUOTE '"';

COPY d_labitems(row_id, itemid, label, fluid, category, loinc_code)
FROM '/Users/mattduma/Documents/mimic-iii-clinical-database-1.4/D_LABITEMS.csv' 
DELIMITER ',' CSV HEADER NULL '';

COPY labevents(row_id, subject_id, hadm_id, itemid, charttime, value, valuenum, valueuom, flag)
FROM '/Users/mattduma/Documents/mimic-iii-clinical-database-1.4/LABEVENTS.csv' 
DELIMITER ',' CSV HEADER NULL '';