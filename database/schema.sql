USE hospital_db;

-- =========================================
-- 1. PATIENTS
-- =========================================

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(20),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100),
    address VARCHAR(255),
    blood_group VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- 2. PATIENT MEDICAL INFORMATION
-- =========================================

CREATE TABLE patient_medical_info (
    medical_info_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    allergies TEXT,
    existing_conditions TEXT,
    emergency_contact VARCHAR(20),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
);


-- =========================================
-- 3. DEPARTMENTS
-- =========================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100)
);


-- =========================================
-- 4. DOCTORS
-- =========================================

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    specialization VARCHAR(100),
    qualification VARCHAR(200),
    consultation_fee DECIMAL(10,2),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


-- =========================================
-- 5. DOCTOR SCHEDULES
-- =========================================

CREATE TABLE doctor_schedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    day_of_week VARCHAR(20) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);


-- =========================================
-- 6. APPOINTMENTS
-- =========================================

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    status VARCHAR(30) DEFAULT 'Scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);


-- =========================================
-- 7. LAB TESTS
-- =========================================

CREATE TABLE lab_tests (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    test_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2)
);


-- =========================================
-- 8. LAB ORDERS
-- =========================================

CREATE TABLE lab_orders (
    lab_order_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    test_id INT NOT NULL,
    doctor_id INT,
    order_date DATE NOT NULL,
    status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (test_id)
        REFERENCES lab_tests(test_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);


-- =========================================
-- 9. LAB REPORTS
-- =========================================

CREATE TABLE lab_reports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    lab_order_id INT NOT NULL,
    report_date DATE,
    status VARCHAR(30) DEFAULT 'Processing',
    report_file VARCHAR(255),
    remarks TEXT,

    FOREIGN KEY (lab_order_id)
        REFERENCES lab_orders(lab_order_id)
);


-- =========================================
-- 10. MEDICINES
-- =========================================

CREATE TABLE medicines (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    generic_name VARCHAR(100),
    category VARCHAR(100),
    description TEXT
);


-- =========================================
-- 11. PRESCRIPTIONS
-- =========================================

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    prescription_date DATE NOT NULL,

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);


-- =========================================
-- 12. PRESCRIPTION ITEMS
-- =========================================

CREATE TABLE prescription_items (
    prescription_item_id INT PRIMARY KEY AUTO_INCREMENT,
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    dosage VARCHAR(50),
    frequency VARCHAR(100),
    duration VARCHAR(50),
    instructions TEXT,

    FOREIGN KEY (prescription_id)
        REFERENCES prescriptions(prescription_id),

    FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
);


-- =========================================
-- 13. PHARMACY INVENTORY
-- =========================================

CREATE TABLE pharmacy_inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    medicine_id INT NOT NULL,
    quantity INT DEFAULT 0,
    available BOOLEAN DEFAULT TRUE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
);


-- =========================================
-- 14. HOSPITAL INFORMATION
-- =========================================

CREATE TABLE hospital_info (
    info_id INT PRIMARY KEY AUTO_INCREMENT,
    information_type VARCHAR(100),
    title VARCHAR(200),
    information TEXT
);


-- =========================================
-- 15. FAQs
-- =========================================

CREATE TABLE faqs (
    faq_id INT PRIMARY KEY AUTO_INCREMENT,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    category VARCHAR(100)
);
```
