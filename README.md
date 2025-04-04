# Massachusetts General Hospital performance analysis(2011-2022)

## Background and Overview

This project explores a synthetic dataset of approximately 1,000 patients from Massachusetts General Hospital between 2011 and 2022. The dataset includes patient demographics, insurance coverage, medical encounters, and procedures. The objective of this analysis is to assess hospital performance using key healthcare metrics, providing insights into patient care trends, insurance distributions, and treatment patterns over time.

### Key Goals
-  Understand the composition of patients by age, gender, and other factors.
-  Examine the distribution of insured vs. uninsured patients and coverage types.
-  Identify trends in hospital visits, common procedures, and patient outcomes.
-  Assess hospital efficiency using indicators such as length of stay, readmission rates, and procedure frequency.
-  Use Tableau to create interactive dashboards for data-driven insights.

## Data Sources

The data source used for this project is "Hospital Patient records" by SyntheticMass which is publicily available on Maven Analytics data playground website. [Download_here](https://mavenanalytics.io/data-playground?page=2&pageSize=5)

The dataset contains multiple tables, each capturing different aspects of hospital operations, patient demographics, medical encounters, and procedures. Below is a detailed breakdown of the dataset:

1. Encounters Table
   - Captures patient visits, including inpatient, outpatient, and emergency encounters.
   - Key fields
       - id: Unique identifier for each encounter.
       - Start & stop: Date and time of visit start and end.
       - Patient: Reference to the patient associated with the encounter.
2. Patients Table
   - Contains demographic details of the patients.
   - Key fields
       - id: Unique patient identifier.
       - Birthdate: Patients date of birth.
       - Gender, Race, Ethnicity: Demographic details of patients.
       - Insurance: Type of insurance coverage.
3. Procedures Table
   - Records medical procedures performed during encounter
   - Key fields
       - id: Unique identifier for each procedure.
       - Encounter: associated hospital visit.
       - Code & description: standardized procedure codes and description.
4. Organizations Table
   - Includes the name, address and other geographic information about the hospital.
5. Payers Table
   - Information about the name, address, city of the payer usually an insurance company.
