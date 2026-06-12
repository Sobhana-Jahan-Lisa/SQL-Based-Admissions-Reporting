# SQL-Based Admissions Reporting and Data Export Project

## Overview

This project simulates a graduate admissions reporting system using SQL, SQLite, Python, and CSV exports. 

The project uses a simulated graduate admissions database with applicants, programs, required documents, application statuses, reviewers, review records, and application status history. It includes SQL queries that generate common operational reports used by graduate schools or admissions offices.

This project demonstrates skills relevant to a Graduate Assistant or CRM support role, including:

- Creating and maintaining SQL queries
- Generating operational reports and CSV exports
- Tracking graduate application status
- Identifying incomplete applications and missing documents
- Monitoring reviewer assignments and workload
- Supporting application-cycle preparation
- Preparing documentation for non-technical users
- Understanding higher-education application workflow data

## Repository Structure

```text
SQL-Based-Admissions-Reporting/
│
├── README.md
├── schema.sql
├── sample_data.sql
├── queries.sql
├── export_reports.py
├── database/
│   └── admissions_reporting.db
├── reports/
│   ├── applicants_by_program.csv
│   ├── application_status_summary.csv
│   ├── incomplete_applications.csv
│   ├── missing_documents.csv
│   ├── reviewer_workload.csv
│   ├── monthly_submission_trends.csv
│   ├── international_vs_domestic.csv
│   ├── average_processing_time.csv
│   └── export_ready_applicant_records.csv
└── docs/
    ├── data_dictionary.md
    ├── report_descriptions.md
```

## Tools Used

- SQL
- SQLite
- Python
- CSV
- Basic operational reporting
- Technical documentation

## How to Run

1. Open the project folder in VS Code.
2. Make sure Python is installed.
3. Open a terminal in the project folder.
4. Run:

```bash
python export_reports.py
```

The script will:

- Create a SQLite database in the `database/` folder
- Load the schema and sample data
- Run the reporting queries
- Export report CSV files into the `reports/` folder

## Reports Included

1. Applicants by program
2. Application status summary
3. Incomplete applications
4. Missing documents
5. Reviewer workload
6. Monthly submission trends
7. International vs domestic applicants
8. Average processing time by program
9. Export-ready applicant records

