from intent import detect_intent
from database.queries import (
    get_lab_report,
    get_appointments,
    get_prescriptions,
    check_medicine_availability
)


def process_query(text, patient_name="Anu Joseph"):
    intent = detect_intent(text)

    if intent == "lab_report":
        results = get_lab_report(patient_name)

        if not results:
            return "No lab report information was found."

        response = "Here is your lab report information:\n"

        for report in results:
            response += (
                f"Test: {report['test_name']}\n"
                f"Status: {report['status']}\n"
                f"Report Date: {report['report_date']}\n"
            )

        return response

    elif intent == "appointment":
        results = get_appointments(patient_name)

        if not results:
            return "No appointment information was found."

        response = "Here is your appointment information:\n"

        for appointment in results:
            response += (
                f"Doctor: {appointment['doctor']}\n"
                f"Specialization: {appointment['specialization']}\n"
                f"Date: {appointment['appointment_date']}\n"
                f"Time: {appointment['appointment_time']}\n"
                f"Status: {appointment['status']}\n"
            )

        return response

    elif intent == "prescription":
        results = get_prescriptions(patient_name)

        if not results:
            return "No prescription information was found."

        response = "Here is your prescription information:\n"

        for prescription in results:
            response += (
                f"Medicine: {prescription['medicine']}\n"
                f"Dosage: {prescription['dosage']}\n"
                f"Frequency: {prescription['frequency']}\n"
                f"Duration: {prescription['duration']}\n"
                f"Instructions: {prescription['instructions']}\n"
            )

        return response

    elif intent == "medicine_availability":
        results = check_medicine_availability("Paracetamol 500mg")

        if not results:
            return "Medicine information was not found."

        medicine = results[0]

        if medicine["available"]:
            return (
                f"{medicine['medicine']} is available. "
                f"Quantity available: {medicine['quantity']}."
            )
        else:
            return f"{medicine['medicine']} is currently unavailable."

    else:
        return "Sorry, I could not understand your request."


if __name__ == "__main__":
    print("AI Healthcare Assistant")
    print("Type 'exit' to stop.\n")

    while True:
        user_input = input("You: ")

        if user_input.lower() == "exit":
            break

        response = process_query(user_input)

        print("Assistant:", response)
        print()