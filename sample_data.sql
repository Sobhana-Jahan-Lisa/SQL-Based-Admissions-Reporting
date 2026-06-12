-- Sample data for simulated graduate admissions reporting database
-- All names, emails, and records are fictional.

INSERT INTO programs (program_id, program_name, degree_level, department) VALUES
(1, 'Computer Science', 'PhD', 'Computer Science'),
(2, 'Computer Science', 'MS', 'Computer Science'),
(3, 'Data Science', 'MS', 'Computer Science'),
(4, 'Cybersecurity', 'MS', 'Computer Science'),
(5, 'Information Systems', 'MS', 'Information Systems');

INSERT INTO reviewers (reviewer_id, reviewer_name, reviewer_role, email) VALUES
(1, 'Dr. Sara Mitchell', 'Faculty Reviewer', 'sara.mitchell@example.edu'),
(2, 'Dr. Raju Ahmed', 'Faculty Reviewer', 'raju.ahmed@example.edu'),
(3, 'Graduate School Staff', 'Administrative Reviewer', 'gradstaff@example.edu'),
(4, 'Program Committee', 'Committee Reviewer', 'committee@example.edu');

INSERT INTO documents (document_id, document_name, required_for_all) VALUES
(1, 'Transcript', 1),
(2, 'Statement of Purpose', 1),
(3, 'Recommendation Letters', 1),
(4, 'CV or Resume', 1),
(5, 'English Proficiency', 0);

INSERT INTO applicants
(applicant_id, first_name, last_name, email, program_id, term, citizenship_status, application_status, submitted_date, decision_date, assigned_reviewer_id, gpa) VALUES
(1, 'Amina', 'Rahman', 'amina.rahman@example.edu', 1, 'Fall 2026', 'International', 'Under Review', '2026-01-05', NULL, 1, 3.82),
(2, 'Daniel', 'Carter', 'daniel.carter@example.edu', 3, 'Fall 2026', 'Domestic', 'Incomplete', '2026-01-08', NULL, 3, 3.54),
(3, 'Mei', 'Chen', 'mei.chen@example.edu', 4, 'Spring 2027', 'International', 'Submitted', '2026-01-12', NULL, NULL, 3.71),
(4, 'Carlos', 'Rivera', 'carlos.rivera@example.edu', 1, 'Fall 2026', 'Domestic', 'Admitted', '2026-01-17', '2026-03-01', 2, 3.90),
(5, 'Fatima', 'Noor', 'fatima.noor@example.edu', 5, 'Fall 2026', 'International', 'Waitlisted', '2026-01-19', '2026-03-05', 4, 3.66),
(6, 'Noah', 'Williams', 'noah.williams@example.edu', 3, 'Spring 2027', 'Domestic', 'Denied', '2026-01-22', '2026-03-10', 4, 3.20),
(7, 'Priya', 'Patel', 'priya.patel@example.edu', 2, 'Fall 2026', 'International', 'Submitted', '2026-02-01', NULL, NULL, 3.78),
(8, 'Ethan', 'Brooks', 'ethan.brooks@example.edu', 4, 'Fall 2026', 'Domestic', 'Under Review', '2026-02-03', NULL, 1, 3.45),
(9, 'Layla', 'Hassan', 'layla.hassan@example.edu', 1, 'Fall 2026', 'International', 'Incomplete', '2026-02-05', NULL, 3, 3.88),
(10, 'Olivia', 'Green', 'olivia.green@example.edu', 3, 'Fall 2026', 'Domestic', 'Admitted', '2026-02-11', '2026-03-20', 2, 3.77),
(11, 'Yusuf', 'Khan', 'yusuf.khan@example.edu', 4, 'Fall 2026', 'International', 'Submitted', '2026-02-15', NULL, NULL, 3.69),
(12, 'Mia', 'Thompson', 'mia.thompson@example.edu', 5, 'Spring 2027', 'Domestic', 'Under Review', '2026-02-18', NULL, 4, 3.58),
(13, 'Akira', 'Sato', 'akira.sato@example.edu', 2, 'Fall 2026', 'International', 'Incomplete', '2026-03-01', NULL, 3, 3.61),
(14, 'James', 'Anderson', 'james.anderson@example.edu', 1, 'Fall 2026', 'Domestic', 'Submitted', '2026-03-04', NULL, NULL, 3.74),
(15, 'Nadia', 'Islam', 'nadia.islam@example.edu', 3, 'Fall 2026', 'International', 'Under Review', '2026-03-08', NULL, 1, 3.92),
(16, 'Liam', 'Miller', 'liam.miller@example.edu', 2, 'Spring 2027', 'Domestic', 'Submitted', '2026-03-12', NULL, NULL, 3.33),
(17, 'Sara', 'Ali', 'sara.ali@example.edu', 4, 'Fall 2026', 'International', 'Admitted', '2026-03-15', '2026-04-10', 2, 3.84),
(18, 'Benjamin', 'Clark', 'benjamin.clark@example.edu', 5, 'Fall 2026', 'Domestic', 'Denied', '2026-03-18', '2026-04-12', 4, 3.10),
(19, 'Hana', 'Kim', 'hana.kim@example.edu', 1, 'Spring 2027', 'International', 'Submitted', '2026-04-01', NULL, NULL, 3.87),
(20, 'David', 'Lee', 'david.lee@example.edu', 3, 'Fall 2026', 'Domestic', 'Incomplete', '2026-04-07', NULL, 3, 3.40);

INSERT INTO application_documents (applicant_id, document_id, received, received_date) VALUES
(1,1,1,'2026-01-05'),(1,2,1,'2026-01-05'),(1,3,1,'2026-01-10'),(1,4,1,'2026-01-05'),(1,5,1,'2026-01-06'),
(2,1,1,'2026-01-08'),(2,2,1,'2026-01-08'),(2,3,0,NULL),(2,4,1,'2026-01-08'),(2,5,1,'2026-01-09'),
(3,1,1,'2026-01-12'),(3,2,1,'2026-01-12'),(3,3,1,'2026-01-20'),(3,4,1,'2026-01-12'),(3,5,0,NULL),
(4,1,1,'2026-01-17'),(4,2,1,'2026-01-17'),(4,3,1,'2026-01-23'),(4,4,1,'2026-01-17'),(4,5,1,'2026-01-17'),
(5,1,1,'2026-01-19'),(5,2,1,'2026-01-19'),(5,3,1,'2026-01-25'),(5,4,1,'2026-01-19'),(5,5,1,'2026-01-21'),
(6,1,1,'2026-01-22'),(6,2,1,'2026-01-22'),(6,3,1,'2026-01-28'),(6,4,1,'2026-01-22'),(6,5,1,'2026-01-23'),
(7,1,1,'2026-02-01'),(7,2,1,'2026-02-01'),(7,3,1,'2026-02-11'),(7,4,1,'2026-02-01'),(7,5,1,'2026-02-03'),
(8,1,1,'2026-02-03'),(8,2,1,'2026-02-03'),(8,3,1,'2026-02-12'),(8,4,1,'2026-02-03'),(8,5,1,'2026-02-04'),
(9,1,1,'2026-02-05'),(9,2,0,NULL),(9,3,0,NULL),(9,4,1,'2026-02-05'),(9,5,1,'2026-02-08'),
(10,1,1,'2026-02-11'),(10,2,1,'2026-02-11'),(10,3,1,'2026-02-19'),(10,4,1,'2026-02-11'),(10,5,1,'2026-02-13'),
(11,1,1,'2026-02-15'),(11,2,1,'2026-02-15'),(11,3,1,'2026-02-23'),(11,4,1,'2026-02-15'),(11,5,0,NULL),
(12,1,1,'2026-02-18'),(12,2,1,'2026-02-18'),(12,3,1,'2026-02-28'),(12,4,1,'2026-02-18'),(12,5,1,'2026-02-18'),
(13,1,0,NULL),(13,2,1,'2026-03-01'),(13,3,1,'2026-03-09'),(13,4,1,'2026-03-01'),(13,5,1,'2026-03-04'),
(14,1,1,'2026-03-04'),(14,2,1,'2026-03-04'),(14,3,1,'2026-03-13'),(14,4,1,'2026-03-04'),(14,5,1,'2026-03-04'),
(15,1,1,'2026-03-08'),(15,2,1,'2026-03-08'),(15,3,1,'2026-03-14'),(15,4,1,'2026-03-08'),(15,5,1,'2026-03-10'),
(16,1,1,'2026-03-12'),(16,2,1,'2026-03-12'),(16,3,1,'2026-03-21'),(16,4,1,'2026-03-12'),(16,5,1,'2026-03-12'),
(17,1,1,'2026-03-15'),(17,2,1,'2026-03-15'),(17,3,1,'2026-03-23'),(17,4,1,'2026-03-15'),(17,5,1,'2026-03-16'),
(18,1,1,'2026-03-18'),(18,2,1,'2026-03-18'),(18,3,1,'2026-03-27'),(18,4,1,'2026-03-18'),(18,5,1,'2026-03-19'),
(19,1,1,'2026-04-01'),(19,2,1,'2026-04-01'),(19,3,1,'2026-04-08'),(19,4,1,'2026-04-01'),(19,5,0,NULL),
(20,1,1,'2026-04-07'),(20,2,0,NULL),(20,3,0,NULL),(20,4,1,'2026-04-07'),(20,5,1,'2026-04-08');

INSERT INTO application_reviews
(review_id, applicant_id, reviewer_id, review_status, review_score, review_date, notes) VALUES
(1, 1, 1, 'In Progress', NULL, NULL, 'Faculty review in progress.'),
(2, 4, 2, 'Completed', 92, '2026-02-25', 'Strong research fit.'),
(3, 5, 4, 'Completed', 78, '2026-03-03', 'Waitlist recommended.'),
(4, 6, 4, 'Completed', 61, '2026-03-08', 'Denied after committee review.'),
(5, 8, 1, 'In Progress', NULL, NULL, 'Needs faculty review.'),
(6, 10, 2, 'Completed', 88, '2026-03-18', 'Admit recommended.'),
(7, 12, 4, 'In Progress', NULL, NULL, 'Committee review in progress.'),
(8, 15, 1, 'In Progress', NULL, NULL, 'Strong candidate; review pending.'),
(9, 17, 2, 'Completed', 90, '2026-04-05', 'Admit recommended.'),
(10, 18, 4, 'Completed', 55, '2026-04-09', 'Denied after review.');

INSERT INTO status_history
(history_id, applicant_id, old_status, new_status, changed_date, changed_by) VALUES
(1,1,NULL,'Submitted','2026-01-05','System'),
(2,1,'Submitted','Under Review','2026-01-16','Graduate School Staff'),
(3,2,NULL,'Submitted','2026-01-08','System'),
(4,2,'Submitted','Incomplete','2026-01-14','Graduate School Staff'),
(5,4,NULL,'Submitted','2026-01-17','System'),
(6,4,'Submitted','Under Review','2026-02-01','Graduate School Staff'),
(7,4,'Under Review','Admitted','2026-03-01','Program Committee'),
(8,5,NULL,'Submitted','2026-01-19','System'),
(9,5,'Submitted','Under Review','2026-02-05','Graduate School Staff'),
(10,5,'Under Review','Waitlisted','2026-03-05','Program Committee'),
(11,6,NULL,'Submitted','2026-01-22','System'),
(12,6,'Submitted','Under Review','2026-02-10','Graduate School Staff'),
(13,6,'Under Review','Denied','2026-03-10','Program Committee'),
(14,10,NULL,'Submitted','2026-02-11','System'),
(15,10,'Submitted','Under Review','2026-02-20','Graduate School Staff'),
(16,10,'Under Review','Admitted','2026-03-20','Program Committee'),
(17,17,NULL,'Submitted','2026-03-15','System'),
(18,17,'Submitted','Under Review','2026-03-25','Graduate School Staff'),
(19,17,'Under Review','Admitted','2026-04-10','Program Committee');
