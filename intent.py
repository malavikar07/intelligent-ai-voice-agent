def detect_intent(text):
    text = text.lower()

    if any(word in text for word in [
        "lab report",
        "test report",
        "blood report",
        "report ready",
        "lab result"
    ]):
        return "lab_report"

    elif any(word in text for word in [
        "appointment",
        "doctor appointment",
        "appointment time",
        "appointment date"
    ]):
        return "appointment"

    elif any(word in text for word in [
        "prescription",
        "prescribed medicine",
        "my medicines",
        "medicines prescribed"
    ]):
        return "prescription"

    elif any(word in text for word in [
        "medicine available",
        "medicine availability",
        "is paracetamol available",
        "pharmacy"
    ]):
        return "medicine_availability"

    else:
        return "unknown"