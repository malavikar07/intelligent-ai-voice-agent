USE hospital_db;

-- =========================================
-- 1. DEPARTMENTS
-- =========================================

INSERT INTO departments (name, description, location) VALUES
('Cardiology', 'Heart and cardiovascular care', 'Block A - 2nd Floor'),
('General Medicine', 'General medical consultation', 'Block A - 1st Floor'),
('Pediatrics', 'Healthcare for children', 'Block B - 1st Floor'),
('Dermatology', 'Skin and related treatments', 'Block B - 2nd Floor');


-- =========================================
-- 2. DOCTORS
-- =========================================

INSERT INTO doctors
(name, department_id, specialization, qualification, consultation_fee)
VALUES
('Dr. Arun Kumar', 1, 'Cardiologist', 'MBBS, MD Cardiology', 600.00),
('Dr. Meera Nair', 2, 'General Physician', 'MBBS, MD General Medicine', 400.00),
('Dr. Rahul Thomas', 3, 'Pediatrician', 'MBBS, MD Pediatrics', 450.00),
('Dr. Anjali Menon', 4, 'Dermatologist', 'MBBS, MD Dermatology', 500.00);


-- =========================================
-- 3. DOCTOR SCHEDULES
-- =========================================

INSERT INTO doctor_schedules
(doctor_id, day_of_week, start_time, end_time)
VALUES
(1, 'Monday', '09:00:00', '13:00:00'),
(1, 'Wednesday', '09:00:00', '13:00:00'),
(2, 'Monday', '10:00:00', '14:00:00'),
(2, 'Tuesday', '10:00:00', '14:00:00'),
(2, 'Thursday', '10:00:00', '14:00:00'),
(3, 'Wednesday', '10:00:00', '14:00:00'),
(3, 'Friday', '10:00:00', '14:00:00'),
(4, 'Tuesday', '09:00:00', '12:00:00'),
(4, 'Thursday', '09:00:00', '12:00:00');


-- =========================================
-- 4. PATIENTS
-- =========================================

INSERT INTO patients
(name, date_of_birth, gender, phone, email, address, blood_group)
VALUES
('Anu Joseph', '1998-05-12', 'Female',
 '9000000001', 'anu@example.com', 'Kochi', 'O+'),

('Rahul Mathew', '1995-08-20', 'Male',
 '9000000002', 'rahul@example.com', 'Aluva', 'B+'),

('Maya Thomas', '2002-11-03', 'Female',
 '9000000003', 'maya@example.com', 'Kakkanad', 'A+'),

('Arjun Nair', '1990-02-15', 'Male',
 '9000000004', 'arjun@example.com', 'Ernakulam', 'AB+');


-- =========================================
-- 5. PATIENT MEDICAL INFORMATION
-- =========================================

INSERT INTO patient_medical_info
(patient_id, allergies, existing_conditions, emergency_contact)
VALUES
(1, 'Penicillin', 'Mild asthma', '9000000101'),
(2, 'None known', 'Hypertension', '9000000102'),
(3, 'Dust allergy', 'None', '9000000103'),
(4, 'None known', 'Type 2 diabetes', '9000000104');


-- =========================================
-- 6. APPOINTMENTS
-- =========================================

INSERT INTO appointments
(patient_id, doctor_id, appointment_date, appointment_time, reason, status)
VALUES
(1, 2, '2026-09-25', '10:30:00',
 'Regular health consultation', 'Scheduled'),

(2, 1, '2026-09-26', '09:30:00',
 'Heart checkup', 'Scheduled'),

(3, 3, '2026-09-27', '11:00:00',
 'General pediatric consultation', 'Scheduled'),

(4, 2, '2026-09-28', '12:00:00',
 'Diabetes follow-up', 'Scheduled');


-- =========================================
-- 7. LAB TESTS
-- =========================================

INSERT INTO lab_tests
(test_name, description, price)
VALUES
('Complete Blood Count', 'Measures different blood cell components', 350.00),
('Blood Glucose', 'Measures blood glucose level', 150.00),
('Lipid Profile', 'Measures cholesterol and triglycerides', 500.00),
('Liver Function Test', 'Evaluates liver function', 700.00);


-- =========================================
-- 8. LAB ORDERS
-- =========================================

INSERT INTO lab_orders
(patient_id, test_id, doctor_id, order_date, status)
VALUES
(1, 1, 2, '2026-09-20', 'Completed'),
(1, 2, 2, '2026-09-20', 'Completed'),
(2, 3, 1, '2026-09-21', 'Processing'),
(4, 2, 2, '2026-09-22', 'Pending');


-- =========================================
-- 9. LAB REPORTS
-- =========================================

INSERT INTO lab_reports
(lab_order_id, report_date, status, report_file, remarks)
VALUES
(1, '2026-09-21', 'Ready',
 'reports/anu_cbc.pdf',
 'Report is ready for collection'),

(2, '2026-09-21', 'Ready',
 'reports/anu_glucose.pdf',
 'Report is ready'),

(3, NULL, 'Processing',
 NULL,
 'Report is being processed');


-- =========================================
-- 10. MEDICINES
-- =========================================

INSERT INTO medicines
(name, generic_name, category, description)
VALUES
('Paracetamol 500mg', 'Paracetamol', 'Pain Relief',
 'Used for fever and mild pain'),

('Amlodipine 5mg', 'Amlodipine', 'Blood Pressure',
 'Prescription medicine for blood pressure'),

('Metformin 500mg', 'Metformin', 'Diabetes',
 'Prescription medicine for blood glucose control'),

('Cetirizine 10mg', 'Cetirizine', 'Allergy',
 'Used for allergy symptoms'),

('Omeprazole 20mg', 'Omeprazole', 'Gastric',
 'Used for acid-related stomach problems');


-- =========================================
-- 11. PRESCRIPTIONS
-- =========================================

INSERT INTO prescriptions
(patient_id, doctor_id, prescription_date)
VALUES
(1, 2, '2026-09-20'),
(2, 1, '2026-09-21'),
(4, 2, '2026-09-22');


-- =========================================
-- 12. PRESCRIPTION ITEMS
-- =========================================

INSERT INTO prescription_items
(prescription_id, medicine_id, dosage, frequency, duration, instructions)
VALUES
(1, 1, '500mg', 'Twice daily', '5 days',
 'Take after food'),

(1, 4, '10mg', 'Once daily', '5 days',
 'Take at night'),

(2, 2, '5mg', 'Once daily', '30 days',
 'Take in the morning'),

(3, 3, '500mg', 'Twice daily', '30 days',
 'Take after meals');


-- =========================================
-- 13. PHARMACY INVENTORY
-- =========================================

INSERT INTO pharmacy_inventory
(medicine_id, quantity, available)
VALUES
(1, 100, TRUE),
(2, 50, TRUE),
(3, 0, FALSE),
(4, 75, TRUE),
(5, 30, TRUE);


-- =========================================
-- 14. HOSPITAL INFORMATION
-- =========================================

INSERT INTO hospital_info
(information_type, title, information)
VALUES
('OP_TIMING', 'Outpatient Department Timing',
 'Monday to Saturday, 9:00 AM to 5:00 PM'),

('EMERGENCY', 'Emergency Department',
 'Emergency services are available 24 hours'),

('PHARMACY', 'Hospital Pharmacy',
 'Open Monday to Sunday, 8:00 AM to 8:00 PM'),

('LAB', 'Laboratory Timing',
 'Monday to Saturday, 7:00 AM to 6:00 PM');


-- =========================================
-- 15. FAQs
-- =========================================

INSERT INTO faqs
(question, answer, category)
VALUES
('What are the OP timings?',
 'The outpatient department is open Monday to Saturday from 9:00 AM to 5:00 PM.',
 'General'),

('Is emergency service available?',
 'Yes, emergency services are available 24 hours.',
 'Emergency'),

('What are the laboratory timings?',
 'The laboratory is open Monday to Saturday from 7:00 AM to 6:00 PM.',
 'Laboratory'),

('What are the pharmacy timings?',
 'The hospital pharmacy is open every day from 8:00 AM to 8:00 PM.',
 'Pharmacy');