# Data Dictionary

This document describes the simulated database tables and fields used in the SQL-Based Admissions Reporting and Data Export Project.

## Table: programs

| Field | Description |
|---|---|
| program_id | Unique identifier for each graduate program |
| program_name | Name of the academic program |
| degree_level | Degree level, such as MS or PhD |
| department | Department offering the program |

## Table: reviewers

| Field | Description |
|---|---|
| reviewer_id | Unique reviewer identifier |
| reviewer_name | Name of the reviewer |
| reviewer_role | Reviewer role, such as faculty reviewer or administrative reviewer |
| email | Reviewer email address |

## Table: applicants

| Field | Description |
|---|---|
| applicant_id | Unique applicant identifier |
| first_name | Applicant first name |
| last_name | Applicant last name |
| email | Applicant email address |
| program_id | Program selected by the applicant |
| term | Application term, such as Fall 2026 |
| citizenship_status | Domestic or International |
| application_status | Current application status |
| submitted_date | Date the application was submitted |
| decision_date | Date of final decision, if available |
| assigned_reviewer_id | Reviewer assigned to the applicant |
| gpa | Applicant GPA |

## Table: documents

| Field | Description |
|---|---|
| document_id | Unique document identifier |
| document_name | Name of the required or optional document |
| required_for_all | Indicates whether the document is required for all applicants |

## Table: application_documents

| Field | Description |
|---|---|
| applicant_id | Applicant connected to the document |
| document_id | Document associated with the applicant |
| received | 1 if received, 0 if missing |
| received_date | Date the document was received |

## Table: application_reviews

| Field | Description |
|---|---|
| review_id | Unique review identifier |
| applicant_id | Applicant being reviewed |
| reviewer_id | Reviewer assigned to the review |
| review_status | Current review status |
| review_score | Review score, if completed |
| review_date | Date the review was completed |
| notes | Review notes |

## Table: status_history

| Field | Description |
|---|---|
| history_id | Unique history record |
| applicant_id | Applicant whose status changed |
| old_status | Previous application status |
| new_status | Updated application status |
| changed_date | Date of status change |
| changed_by | User or role that changed the status |
