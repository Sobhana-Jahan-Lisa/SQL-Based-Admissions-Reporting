"""
SQL-Based Admissions Reporting and Data Export Project

This script creates a local SQLite database, loads simulated admissions data,
runs operational reporting queries, and exports each report as a CSV file.

How to run:
    python export_reports.py
"""

import csv
import sqlite3
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
DB_DIR = BASE_DIR / "database"
REPORT_DIR = BASE_DIR / "reports"

DB_PATH = DB_DIR / "admissions_reporting.db"
SCHEMA_PATH = BASE_DIR / "schema.sql"
DATA_PATH = BASE_DIR / "sample_data.sql"

DB_DIR.mkdir(exist_ok=True)
REPORT_DIR.mkdir(exist_ok=True)

REPORT_QUERIES = {
    "applicants_by_program.csv": """
        SELECT
            p.program_name,
            p.degree_level,
            COUNT(a.applicant_id) AS applicant_count
        FROM applicants a
        JOIN programs p ON a.program_id = p.program_id
        GROUP BY p.program_name, p.degree_level
        ORDER BY applicant_count DESC;
    """,

    "application_status_summary.csv": """
        SELECT
            application_status,
            COUNT(*) AS total_applications
        FROM applicants
        GROUP BY application_status
        ORDER BY total_applications DESC;
    """,

    "incomplete_applications.csv": """
        SELECT
            a.applicant_id,
            a.first_name || ' ' || a.last_name AS applicant_name,
            a.email,
            p.program_name || ' ' || p.degree_level AS program,
            a.term,
            a.application_status
        FROM applicants a
        JOIN programs p ON a.program_id = p.program_id
        WHERE a.application_status = 'Incomplete'
        ORDER BY a.submitted_date;
    """,

    "missing_documents.csv": """
        SELECT
            a.applicant_id,
            a.first_name || ' ' || a.last_name AS applicant_name,
            a.email,
            p.program_name || ' ' || p.degree_level AS program,
            d.document_name AS missing_document
        FROM applicants a
        JOIN programs p ON a.program_id = p.program_id
        JOIN application_documents ad ON a.applicant_id = ad.applicant_id
        JOIN documents d ON ad.document_id = d.document_id
        WHERE ad.received = 0
        ORDER BY a.applicant_id, d.document_name;
    """,

    "reviewer_workload.csv": """
        SELECT
            COALESCE(r.reviewer_name, 'Unassigned') AS reviewer_name,
            COALESCE(r.reviewer_role, 'Not Assigned') AS reviewer_role,
            COUNT(a.applicant_id) AS assigned_applications
        FROM applicants a
        LEFT JOIN reviewers r ON a.assigned_reviewer_id = r.reviewer_id
        GROUP BY r.reviewer_name, r.reviewer_role
        ORDER BY assigned_applications DESC;
    """,

    "monthly_submission_trends.csv": """
        SELECT
            strftime('%Y-%m', submitted_date) AS submission_month,
            COUNT(*) AS applications_submitted
        FROM applicants
        GROUP BY submission_month
        ORDER BY submission_month;
    """,

    "international_vs_domestic.csv": """
        SELECT
            citizenship_status,
            COUNT(*) AS applicant_count
        FROM applicants
        GROUP BY citizenship_status
        ORDER BY applicant_count DESC;
    """,

    "average_processing_time.csv": """
        SELECT
            p.program_name || ' ' || p.degree_level AS program,
            ROUND(AVG(julianday(a.decision_date) - julianday(a.submitted_date)), 1) AS avg_days_to_decision
        FROM applicants a
        JOIN programs p ON a.program_id = p.program_id
        WHERE a.decision_date IS NOT NULL
        GROUP BY program
        ORDER BY avg_days_to_decision DESC;
    """,

    "export_ready_applicant_records.csv": """
        SELECT
            a.applicant_id,
            a.first_name,
            a.last_name,
            a.email,
            p.program_name,
            p.degree_level,
            a.term,
            a.citizenship_status,
            a.application_status,
            a.submitted_date,
            a.decision_date,
            COALESCE(r.reviewer_name, 'Unassigned') AS assigned_reviewer,
            a.gpa
        FROM applicants a
        JOIN programs p ON a.program_id = p.program_id
        LEFT JOIN reviewers r ON a.assigned_reviewer_id = r.reviewer_id
        ORDER BY a.submitted_date;
    """
}


def initialize_database(connection: sqlite3.Connection) -> None:
    """Create database tables and insert sample admissions data."""
    schema_sql = SCHEMA_PATH.read_text(encoding="utf-8")
    sample_data_sql = DATA_PATH.read_text(encoding="utf-8")

    connection.executescript(schema_sql)
    connection.executescript(sample_data_sql)
    connection.commit()


def export_query_to_csv(connection: sqlite3.Connection, query: str, output_path: Path) -> None:
    """Run a SQL query and export the result to a CSV file."""
    cursor = connection.execute(query)
    rows = cursor.fetchall()
    column_names = [description[0] for description in cursor.description]

    with output_path.open("w", newline="", encoding="utf-8") as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(column_names)
        writer.writerows(rows)


def main() -> None:
    """Build the database and export all reports."""
    if DB_PATH.exists():
        DB_PATH.unlink()

    with sqlite3.connect(DB_PATH) as connection:
        initialize_database(connection)

        for filename, query in REPORT_QUERIES.items():
            output_path = REPORT_DIR / filename
            export_query_to_csv(connection, query, output_path)
            print(f"Created report: {output_path}")

    print("\nDone. Database and CSV reports were generated successfully.")


if __name__ == "__main__":
    main()
