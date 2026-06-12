-- SQL-Based Admissions Reporting and Data Export Project
-- Schema for a simulated graduate admissions reporting database

DROP TABLE IF EXISTS application_reviews;
DROP TABLE IF EXISTS application_documents;
DROP TABLE IF EXISTS status_history;
DROP TABLE IF EXISTS applicants;
DROP TABLE IF EXISTS documents;
DROP TABLE IF EXISTS reviewers;
DROP TABLE IF EXISTS programs;

CREATE TABLE programs (
    program_id INTEGER PRIMARY KEY,
    program_name TEXT NOT NULL,
    degree_level TEXT NOT NULL,
    department TEXT NOT NULL
);

CREATE TABLE reviewers (
    reviewer_id INTEGER PRIMARY KEY,
    reviewer_name TEXT NOT NULL,
    reviewer_role TEXT NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE applicants (
    applicant_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    program_id INTEGER NOT NULL,
    term TEXT NOT NULL,
    citizenship_status TEXT NOT NULL,
    application_status TEXT NOT NULL,
    submitted_date TEXT NOT NULL,
    decision_date TEXT,
    assigned_reviewer_id INTEGER,
    gpa REAL,
    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (assigned_reviewer_id) REFERENCES reviewers(reviewer_id)
);

CREATE TABLE documents (
    document_id INTEGER PRIMARY KEY,
    document_name TEXT NOT NULL,
    required_for_all INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE application_documents (
    applicant_id INTEGER NOT NULL,
    document_id INTEGER NOT NULL,
    received INTEGER NOT NULL DEFAULT 0,
    received_date TEXT,
    PRIMARY KEY (applicant_id, document_id),
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id),
    FOREIGN KEY (document_id) REFERENCES documents(document_id)
);

CREATE TABLE application_reviews (
    review_id INTEGER PRIMARY KEY,
    applicant_id INTEGER NOT NULL,
    reviewer_id INTEGER NOT NULL,
    review_status TEXT NOT NULL,
    review_score INTEGER,
    review_date TEXT,
    notes TEXT,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id),
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(reviewer_id)
);

CREATE TABLE status_history (
    history_id INTEGER PRIMARY KEY,
    applicant_id INTEGER NOT NULL,
    old_status TEXT,
    new_status TEXT NOT NULL,
    changed_date TEXT NOT NULL,
    changed_by TEXT NOT NULL,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id)
);
