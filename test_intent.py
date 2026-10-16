from intent import detect_intent


test_inputs = [
    "Is my lab report ready?",
    "When is my doctor appointment?",
    "What medicines are prescribed for me?",
    "Is paracetamol available?",
    "What are the hospital visiting hours?"
]


for text in test_inputs:
    intent = detect_intent(text)

    print("User:", text)
    print("Intent:", intent)
    print("-" * 40)