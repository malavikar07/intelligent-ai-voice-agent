from database.db import get_connection


def get_lab_report(patient_name):
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
    SELECT
        p.name AS patient,
        lt.test_name,
        lr.status,
        lr.report_date
    FROM patients p
    JOIN lab_orders lo
        ON p.patient_id = lo.patient_id
    JOIN lab_tests lt
        ON lo.test_id = lt.test_id
    JOIN lab_reports lr
        ON lo.lab_order_id = lr.lab_order_id
    WHERE p.name = %s;
    """

    cursor.execute(query, (patient_name,))
    results = cursor.fetchall()

    cursor.close()
    connection.close()

    return results


def get_appointments(patient_name):
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
    SELECT
        p.name AS patient,
        d.name AS doctor,
        d.specialization,
        a.appointment_date,
        a.appointment_time,
        a.status
    FROM appointments a
    JOIN patients p
        ON a.patient_id = p.patient_id
    JOIN doctors d
        ON a.doctor_id = d.doctor_id
    WHERE p.name = %s
    ORDER BY a.appointment_date, a.appointment_time;
    """

    cursor.execute(query, (patient_name,))
    results = cursor.fetchall()

    cursor.close()
    connection.close()

    return results


def get_prescriptions(patient_name):
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
    SELECT
        p.name AS patient,
        d.name AS doctor,
        pr.prescription_date,
        m.name AS medicine,
        pi.dosage,
        pi.frequency,
        pi.duration,
        pi.instructions
    FROM prescriptions pr
    JOIN patients p
        ON pr.patient_id = p.patient_id
    JOIN doctors d
        ON pr.doctor_id = d.doctor_id
    JOIN prescription_items pi
        ON pr.prescription_id = pi.prescription_id
    JOIN medicines m
        ON pi.medicine_id = m.medicine_id
    WHERE p.name = %s
    ORDER BY pr.prescription_date DESC;
    """

    cursor.execute(query, (patient_name,))
    results = cursor.fetchall()

    cursor.close()
    connection.close()

    return results

def check_medicine_availability(medicine_name):
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
    SELECT
        m.name AS medicine,
        m.generic_name,
        pi.quantity,
        pi.available
    FROM medicines m
    JOIN pharmacy_inventory pi
        ON m.medicine_id = pi.medicine_id
    WHERE m.name = %s;
    """

    cursor.execute(query, (medicine_name,))
    results = cursor.fetchall()

    cursor.close()
    connection.close()

    return results