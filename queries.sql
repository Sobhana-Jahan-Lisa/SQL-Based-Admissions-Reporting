-- SQL-Based Admissions Reporting and Data Export Project
-- Operational reporting queries for simulated graduate admissions data.

-- 1. Applicants by program
SELECT
    p.program_name,
    p.degree_level,
    COUNT(a.applicant_id) AS applicant_count
FROM applicants a
JOIN programs p ON a.program_id = p.program_id
GROUP BY p.program_name, p.degree_level
ORDER BY applicant_count DESC;

-- 2. Application status summary
SELECT
    application_status,
    COUNT(*) AS total_applications
FROM applicants
GROUP BY application_status
ORDER BY total_applications DESC;

-- 3. Incomplete applications
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

-- 4. Missing documents
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

-- 5. Reviewer workload
SELECT
    COALESCE(r.reviewer_name, 'Unassigned') AS reviewer_name,
    COALESCE(r.reviewer_role, 'Not Assigned') AS reviewer_role,
    COUNT(a.applicant_id) AS assigned_applications
FROM applicants a
LEFT JOIN reviewers r ON a.assigned_reviewer_id = r.reviewer_id
GROUP BY r.reviewer_name, r.reviewer_role
ORDER BY assigned_applications DESC;

-- 6. Monthly submission trends
SELECT
    strftime('%Y-%m', submitted_date) AS submission_month,
    COUNT(*) AS applications_submitted
FROM applicants
GROUP BY submission_month
ORDER BY submission_month;

-- 7. International vs domestic applicants
SELECT
    citizenship_status,
    COUNT(*) AS applicant_count
FROM applicants
GROUP BY citizenship_status
ORDER BY applicant_count DESC;

-- 8. Average processing time by program
SELECT
    p.program_name || ' ' || p.degree_level AS program,
    ROUND(AVG(julianday(a.decision_date) - julianday(a.submitted_date)), 1) AS avg_days_to_decision
FROM applicants a
JOIN programs p ON a.program_id = p.program_id
WHERE a.decision_date IS NOT NULL
GROUP BY program
ORDER BY avg_days_to_decision DESC;

-- 9. Export-ready applicant records
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
