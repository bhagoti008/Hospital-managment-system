from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# Database Connection
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="sudeeksha@23",
    database="hms"
)

# Cursor
mycursor = mydb.cursor()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/book_appointment', methods=['POST'])
def book_appointment():
    patient_id = request.form['patient_id']
    emergency = request.form['emergency']

    if emergency == '1':
        date_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        symptoms = ""
        doctor_id = ""
        specialization = ""
        date = ""
        time_slot = ""
    else:
        symptoms = request.form['symptoms']
        doctor_name = request.form['doctor_name']
        specialization = request.form['specialization']
        date = request.form['date']
        time_slot = request.form['time_slot']
        date_time = datetime.strptime(date + " " + time_slot, '%Y-%m-%d %H:%M:%S')
        
        # Getting doctor id from doctor name and specialization
        mycursor.execute("SELECT id FROM doctor WHERE name=%s AND specialization=%s", (doctor_name, specialization))
        doctor_id = mycursor.fetchone()[0]

    # Inserting appointment data into appointment table
    sql = "INSERT INTO appointment (patient_id, doctor_id, date_time, symptoms, emergency) VALUES (%s, %s, %s, %s, %s)"
    val = (patient_id, doctor_id, date_time, symptoms, emergency)
    mycursor.execute(sql, val)
    mydb.commit()

    return "Appointment booked successfully!"

if __name__ == '__main__':
    app.run(debug=True)
