DROP TABLE treatment;
DROP TABLE stay;
DROP TABLE room;
DROP TABLE test;
DROP TABLE prescribes;
DROP TABLE medication;
DROP TABLE appointment;
DROP TABLE patient;
DROP TABLE doctor;
DROP TABLE department;



CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
) AUTO_INCREMENT=1;

INSERT INTO department(name)
VALUES ('cardiologist');
INSERT INTO department(name)
VALUES ('gynacologist');

CREATE TABLE doctor (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  department INT,
  password VARCHAR(50),
  phone_number VARCHAR(10),
  email_id VARCHAR(20),
  FOREIGN KEY (department) REFERENCES department(id)
)AUTO_INCREMENT=1000;
INSERT INTO doctor(name,department)
VALUES ('sukee',1);
INSERT INTO doctor(name,department)
VALUES ('rajeevi',2);


  CREATE TABLE patient (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  address VARCHAR(50) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  phone_number VARCHAR(10),
  insurance_id VARCHAR(15)
) AUTO_INCREMENT = 1;
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('sukee',20,'kadapa','female','9849568217','AI1234567890');
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('rajeevi',21,'kadapa','female','7993313610','AI1234567890');
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('sukku',18,'kadapa','female','7993313610','AI1234567890');
INSERT INTO patient(name,age,address,gender,phone_number,insurance_id)
VALUES ('gundu',19,'kadapa','female','7993313610','AI1234567890');

CREATE TABLE appointment (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  date DATETIME NOT NULL,
  symptoms VARCHAR(255),
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(id)
)AUTO_INCREMENT=1;
INSERT INTO appointment(patient_id,doctor_id,date_time,symptoms)
VALUES (3,1000,'2023-02-01 02:01:01','light fever, cough');
INSERT INTO appointment(patient_id,doctor_id,date_time,symptoms)
VALUES (4,1000,'2023-02-01 02:01:01','light fever, cough');


CREATE TABLE prescribes (
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  date_prescribed DATETIME NOT NULL,
  dose VARCHAR(50),
  appointment_id INT,
  medication_name VARCHAR(50),
  medication_brand VARCHAR(50),
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(id),
  FOREIGN KEY (appointment_id) REFERENCES appointment(id),
  PRIMARY KEY (patient_id, doctor_id, medication_name, medication_brand, date_prescribed)
);

CREATE TABLE test (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  date DATETIME NOT NULL,
  result VARCHAR(50),
  time_slot VARCHAR(50),
  FOREIGN KEY (patient_id) REFERENCES patient(id)
)AUTO_INCREMENT=1;

CREATE TABLE room (
  id VARCHAR(50) NOT NULL PRIMARY KEY,
  type VARCHAR(50) NOT NULL,
  count INT NOT NULL
);

CREATE TABLE stay (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  room_id VARCHAR(50),
  start_date DATETIME NOT NULL,
  end_date DATETIME,
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE treatment (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT,
  name VARCHAR(50) NOT NULL,
  date DATETIME NOT NULL,
  time_slot VARCHAR(50),
  cost VARCHAR(50),
  stay_id INT,
  description VARCHAR(255),
  FOREIGN KEY (patient_id) REFERENCES patient(id),
  FOREIGN KEY (doctor_id) REFERENCES doctor(id),
  FOREIGN KEY (stay_id) REFERENCES stay(id)
)AUTO_INCREMENT=1;
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (1,1000,'braces','2023-01-26 12:12:12','2-4',40000);
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (2,1000,'braces2','2023-01-26 12:12:12','4-5',40000);
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (3,1000,'braces3','2023-01-26 12:12:12','5-6',40000);
INSERT INTO treatment(patient_id,doctor_id,name,date,time_slot,cost)
VALUES (4,1000,'braces4','2023-01-26 12:12:12','2-4',40000);



CREATE TABLE unread_notification(
  id INT PRIMARY KEY,
  FOREIGN KEY(id) REFERENCES appointment(id)
)