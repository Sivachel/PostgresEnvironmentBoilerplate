DROP TABLE IF EXISTS attendence;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS groups;

CREATE TABLE groups (
  groupid SERIAL PRIMARY KEY,
  groupname VARCHAR(10),
  grouptype VARCHAR(11)
);

CREATE TABLE students (
  studentid SERIAL PRIMARY KEY,
  firstname VARCHAR(40),
  lastname VARCHAR(40),
  groupid INT,
  bio VARCHAR(255)
);

CREATE TABLE attendence (
  attendenceid SERIAL PRIMARY KEY,
  studentid INT,
  FOREIGN KEY(studentid) REFERENCES students(studentid),
  dateofattendence DATE DEFAULT now(),
  status VARCHAR(25),
  comment VARCHAR (255)
);

INSERT INTO groups (groupname, grouptype) VALUES ('Unassigned', 'Unassigned');
INSERT INTO groups (groupname, grouptype) VALUES ('Eng23', 'Engineering');
INSERT INTO groups (groupname, grouptype) VALUES ('Bus18', 'Business');

INSERT INTO students (firstname, lastname, groupid) VALUES ('Studen1t_FN','Student1_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student2_FN','Student2_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student3_FN','Student3_LN', 3);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student4_FN','Student4_LN', 3);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student5_FN','Student5_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student6_FN','Student6_LN', 3);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student7_FN','Student7_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student8_FN','Student8_LN', 3);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student9_FN','Student9_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student10_FN','Student10_LN', 3);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student11_FN','Student11_LN', 2);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student12_FN','Student12_LN', 1);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student13_FN','Student13_LN', 1);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student14_FN','Student14_LN', 1);
INSERT INTO students (firstname, lastname, groupid) VALUES ('Student15_FN','Student15_LN', 1);

INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 3, 'Authorised Absence', 'Was Ill');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 5, '>5 Min Late', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 6, 'On Time', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 7, 'On Time', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 8, 'On Time', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 9, '<5 Min Late', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 10, '>5 Min Late', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 11, 'On Time', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 12, '>5 Min Late', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 13, 'On Time', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 14, 'On Time', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/28', 15, '<5 Min Late', 'Bus Was Late');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 4, '>5 Min Late', 'Snow Causing Disruptions');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/29', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 2, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/30', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 2, 'Authorised Absence', 'Doctor appointment');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/01/31', 5, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 1, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 2, 'Unauthorised Absence', 'Kingdom Hearts Release?');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 3, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 4, 'On Time', '');
INSERT INTO attendence (dateofattendence, studentid, status, comment) VALUES ('2019/02/01', 5, 'On Time', '');
