from database.queries import (
    get_lab_report,
    get_appointments,
    get_prescriptions,
    check_medicine_availability
)


# 1. Lab Report
print("\nLAB REPORT")
print("-" * 30)

reports = get_lab_report("Anu Joseph")

for report in reports:
    print("Patient:", report["patient"])
    print("Test:", report["test_name"])
    print("Status:", report["status"])
    print("Report Date:", report["report_date"])


# 2. Appointments
print("\nAPPOINTMENTS")
print("-" * 30)

appointments = get_appointments("Anu Joseph")

for appointment in appointments:
    print("Patient:", appointment["patient"])
    print("Doctor:", appointment["doctor"])
    print("Specialization:", appointment["specialization"])
    print("Date:", appointment["appointment_date"])
    print("Time:", appointment["appointment_time"])
    print("Status:", appointment["status"])


# 3. Prescriptions
print("\nPRESCRIPTIONS")
print("-" * 30)

prescriptions = get_prescriptions("Anu Joseph")

for prescription in prescriptions:
    print("Patient:", prescription["patient"])
    print("Doctor:", prescription["doctor"])
    print("Date:", prescription["prescription_date"])
    print("Medicine:", prescription["medicine"])
    print("Dosage:", prescription["dosage"])
    print("Frequency:", prescription["frequency"])
    print("Duration:", prescription["duration"])
    print("Instructions:", prescription["instructions"])


# 4. Medicine Availability
print("\nMEDICINE AVAILABILITY")
print("-" * 30)

medicines = check_medicine_availability("Paracetamol 500mg")

for medicine in medicines:
    print("Medicine:", medicine["medicine"])
    print("Generic Name:", medicine["generic_name"])
    print("Quantity:", medicine["quantity"])
    print("Available:", medicine["available"])