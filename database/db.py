import mysql.connector


def get_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="hospital_app",
        password="hospital123",
        database="hospital_db"
    )

    return connection