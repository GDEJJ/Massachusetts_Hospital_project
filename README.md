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

## Data Considerations

- The dataset consists of synthetic data and does not represent real patient records.
- Data follows healthcare standards, including ICD and RxNorm codes where applicable.
- Fields are formatted using ISO 8601 standards for date/time representation.

## Tools Used

- **Google Cloud BigQuery** for data storage, cleaning, processing and analysis.
- **Tableau** for data visualization.

## Executive Summary

This analysis evaluated MGH's operational performance using a synthetic dataset of approximately 1,000 patients over an 11-year period. The primary objective was to assess MGH's performance using real-world hospital metrics and uncover actionable insights that inform operational improvements and resource allocation. Our assessment reveals both institutional strengths and opportunities for strategic improvement across patient demographics, healthcare delivery, and resource allocation.

#### Key Findings
MGH demonstrates strong specialized care capabilities but faces systemic imbalances in resource allocation:
- Patient population is predominantly white (680 patients) and elderly (20,500+ visits from 66+ age group), with notable underrepresentation of Hispanic patients and younger adults.
- Substantial resources are devoted to renal dialysis (2.9M procedures) and mental health screenings (1.8M procedures), suggesting specialized excellence but potential gaps in preventive services.
- Inpatient stays average 2,210 minutes (37 hours), significantly longer than ambulatory visits (569 minutes), while wellness encounters receive minimal time allocation (15 minutes).
- The 26.5% readmission rate in 2021 (545 patients) indicates care continuity challenges and potential quality gaps that strain resources.

## Exploratory Data Analysis

Explore all SQL logic in: [MGH_hospital_analysis_queries.sql](./Exploratory-analysis.sql)

### Analysis Performed

#### Readmission rates over 30 days for patients
![Readmission rates](https://github.com/user-attachments/assets/4626bee1-1ce2-46cf-bf0f-04833a3209b0)


- A notable spike in both readmission rate (26.5%) and readmission count (545) in 2021 highlights potential strain on hospital resources and care continuity. This signals a need for post-discharge follow-up strategies and targeted care interventions.
- With an average hospital stay of 3,885 minutes and elevated visit numbers, 2014 represents a year of peak operational load. This suggests potential inefficiencies in throughput and a need to assess resource utilization during high-demand periods.


#### Demographic data of patients at MGH
![Race and ethnic distribution of patients at MGH](https://github.com/user-attachments/assets/3dfef52b-9b6d-410a-a667-430077e972b8)
![Distribution of age group and their frequencies of visits](https://github.com/user-attachments/assets/1fb1a8ff-26bf-4a80-9765-133051e70b24)


- The data shows consistent gender disparities across age brackets, with males outnumbering females in the 51-65 and 66+ age groups, but females outnumbering males in younger age groups. This pattern may indicate gender-specific healthcare-seeking behaviors that affect clinical outcomes.
- Patients aged 66+ account for approximately 20,500 visits (10,745 male, 9,788 female), which dramatically outweighs all other age groups combined. The 19-35 age group has minimal representation, suggesting either excellent health in this population or, more concerning, significant barriers to care.


#### Most common procedures
![Top 10 most commonly performed procedurs](https://github.com/user-attachments/assets/8b0cefd7-0114-466e-be4d-f79c83d574e0)


- The extremely high volume of renal dialysis procedures (2,910,630) dwarfs all other procedures, which aligns with the large 66+ patient population we identified earlier. This suggests a significant kidney disease burden among the elderly patient base that dominates hospital utilization.
- Mental health screenings represent a substantial portion of procedures, with anxiety assessment (336,654), substance assessment (436,804), and depression screenings (524,405 × 2 different methods) collectively accounting for over 1.8 million procedures.
- The substantial number of health assessments (676,252) alongside relatively fewer intervention procedures suggests MGH may be diagnostically heavy but potentially underutilizing follow-up treatments.


#### Patient encounter duration by type
![Average time spent per encounterclass](https://github.com/user-attachments/assets/3240d295-b03c-4341-b5ea-7fa143f8c3d5)

This data reveals striking time distribution inefficiencies at MGH, with inpatient stays averaging 2,210 minutes (about 37 hours) - nearly four times longer than ambulatory visits (569 minutes) and significantly longer than outpatient visits (353 minutes). The minimal time allocated to wellness encounters (15 minutes) aligns with our earlier insight about the hospital's focus on treatment rather than prevention.


## Recommendations
This analysis identifies opportunities to diversify MGH's patient base, enhance preventive care offerings, and optimize resource allocation while maintaining the hospital's strengths in specialized treatment areas. Implementation of these recommendations would position MGH for more sustainable growth and improved patient outcomes across broader demographic segments.
- Demographic Expansion: Implement targeted outreach programs for Hispanic communities and younger adults, including extended hours, telehealth options, and culturally sensitive communication.
- Service Portfolio Rebalancing: Increase investment in preventive care and wellness services while maintaining specialized excellence in renal care and mental health.
- Operational Efficiency: Analyze inpatient processes to reduce average stay durations and optimize resource allocation across encounter types.
- Post-Discharge Management: Develop structured follow-up programs to address the high readmission rates, particularly for elderly patients with chronic conditions.

