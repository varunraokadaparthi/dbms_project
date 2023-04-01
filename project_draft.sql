DROP DATABASE IF EXISTS project;
CREATE DATABASE IF NOT EXISTS project;
USE project;

CREATE TABLE Customer_support (
    emp_id INT PRIMARY KEY,
    designation VARCHAR(64)
);

INSERT INTO Customer_support(emp_id, designation)
VALUES('1','junior'),
('2','junior');


CREATE TABLE NUser (
    id INT PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    phone_number BIGINT,
    date_of_birth DATE,
    gender VARCHAR(64),
    email_id VARCHAR(64),
    username VARCHAR(64),
    upassword VARCHAR(64),
    hint VARCHAR(64),
    languages_known TEXT,
    emp_id INT NOT NULL,
    CONSTRAINT customer_support_fk FOREIGN KEY (emp_id)
        REFERENCES Customer_support (emp_id)
);

INSERT INTO NUser(id, first_name, last_name, phone_number, date_of_birth , gender, email_id, username, upassword, hint, languages_known, emp_id)
VALUES('1', 'ajay', 'inavolu', '938144221', '1999-10-06', 'male', 'i.ajaykumar100@gmail.com', 'ajay@1999', 'ajay123', 'friend name', 'english telugu hindi', '1'),
('2', 'sai', 'samineni', '938144221', '1999-10-06', 'male', 'i.ajaykumar100@gmail.com', 'ajay@1999', 'ajay123', 'friend name', 'english telugu hindi', '1');

CREATE TABLE Befriends (
    friend_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT befriends_fk FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT befriends_fk2 FOREIGN KEY (friend_id)
        REFERENCES NUser (id)
);
INSERT INTO  Befriends (friend_id ,user_id)
VALUES('1', '2');


CREATE TABLE Messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message TEXT,
    CONSTRAINT messages_fk1 FOREIGN KEY (sender_id)
        REFERENCES NUser (id),
    CONSTRAINT messages_fk2 FOREIGN KEY (receiver_id)
        REFERENCES NUser (id)
);
INSERT INTO  Messages ( message_id, sender_id, receiver_id, message)
VALUES('1', '1','2','hi bro'),
('2', '2','1','hello');

CREATE TABLE Address (
    street VARCHAR(64),
    city VARCHAR(64),
    state VARCHAR(64),
    zip_code INT,
    country VARCHAR(64),
    CONSTRAINT pk1 PRIMARY KEY (street , city , state , zip_code , country)
);
INSERT INTO  Address ( street, city, state, zip_code, country)
VALUES('Smith Street', 'Boston','MA','02120', 'USA'),
('Horodan Street', 'Boston','MA','02120', 'USA');


CREATE TABLE Lives_at (
    user_id INT NOT NULL,
    street VARCHAR(64),
    city VARCHAR(64),
    state VARCHAR(64),
    zip_code INT,
    country VARCHAR(64),
    CONSTRAINT fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT fk2 FOREIGN KEY (street , city , state , zip_code , country)
        REFERENCES Address (street , city , state , zip_code , country)
);

INSERT INTO  Lives_at ( user_id,  street, city, state, zip_code, country)
VALUES('1', 'Smith Street', 'Boston','MA','02120', 'USA'),
('2', 'Smith Street', 'Boston','MA','02120', 'USA');

CREATE TABLE Interest (
    interest_type VARCHAR(64) PRIMARY KEY
);

INSERT INTO Interest(interest_type)
VALUES('MUSIC'),
('SPORTS'),
('PARTY');

CREATE TABLE UEvent (
    event_id INT PRIMARY KEY,
    timings TEXT,
    max_people INT,
    fees INT,
    requirements TEXT,
    street_name VARCHAR(64),
    city VARCHAR(64),
    zip_code INT,
    min_age INT,
    title VARCHAR(64),
    agenda TEXT,
    id INT NOT NULL,
    interest_type VARCHAR(64) NOT NULL,
    CONSTRAINT hosted_by FOREIGN KEY (id)
        REFERENCES NUser (id),
	CONSTRAINT event_interest FOREIGN KEY (interest_type)
        REFERENCES Interest (interest_type)
);
INSERT INTO UEvent(event_id, timings, max_people, fees, requirements, street_name, city, zip_code, min_age, title, agenda, id, interest_type)
VALUES('1','7 TO 11 PM', '250', '25', 'CASUAL DRESS' ,'360 Huntington Ave','BOSTON','02115','24','MUSICAL NIGHT', 'MUSIC AND KARIOKE', '1', 'MUSIC'),
('2','8 TO 11 PM', '150', '35', 'CASUAL DRESS' ,'360 Huntington Ave','BOSTON','02115','25','BILLARDS COMPETITION', 'BILLARDS AND DRINKS', '1', 'SPORTS');


CREATE TABLE User_interest (
    user_id INT NOT NULL,
    interest_type VARCHAR(64) NOT NULL,
    CONSTRAINT ui_fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT ui_fk2 FOREIGN KEY (interest_type)
        REFERENCES Interest (interest_type)
);

INSERT INTO User_interest(user_id, interest_type)
VALUES('1', 'SPORTS'),
('2', 'MUSIC');


CREATE TABLE User_Event (
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    CONSTRAINT ue_fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT ue_fk2 FOREIGN KEY (event_id)
        REFERENCES UEvent (event_id)
);

INSERT INTO User_Event(user_id, event_id)
VALUES('1', '2'),
('2', '1');


CREATE TABLE Attended_by (
    event_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT attended_by_fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT attended_by_fk2 FOREIGN KEY (event_id)
        REFERENCES Uevent (event_id)
);

INSERT INTO Attended_by(event_id, user_id)
VALUES('1', '2'),
('2', '1');

CREATE TABLE Vehicle_type (
    vehicle_type VARCHAR(64) PRIMARY KEY
);

INSERT INTO Vehicle_type(vehicle_type)
VALUES('SUV'),
('SEDAN');

CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY,
    registration_no VARCHAR(64),
    vehicle_type VARCHAR(64) NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT contains_fk2 FOREIGN KEY (vehicle_type)
        REFERENCES Vehicle_type (vehicle_type),
    CONSTRAINT owns_fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id)
);

INSERT INTO Vehicle (vehicle_id, registration_no, vehicle_type, user_id)
VALUES('1','TS07JD4013','SUV','1'),
('2','TS07HV5816','SEDAN','1');

CREATE TABLE Carpool (
    carpool_id INT PRIMARY KEY,
    pickup_zipcode INT,
    dropoff_zipcode INT,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    CONSTRAINT carpool_fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT carpool_fk2 FOREIGN KEY (vehicle_id)
        REFERENCES Vehicle (vehicle_id)
);

INSERT INTO Carpool (carpool_id, pickup_zipcode, dropoff_zipcode, user_id, vehicle_id)
VALUES ('1','02120','02115','1','1'),
('2','02122','02115','1','2');

CREATE TABLE Event_Payment (
    epayment_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    CONSTRAINT epayment_fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT epayment_fk2 FOREIGN KEY (event_id)
        REFERENCES UEvent (event_id)
);

INSERT INTO Event_Payment (epayment_id, user_id,  event_id )
VALUES ('1','1','2'),
('2','2','1');

CREATE TABLE Carpool_Payment (
    cpayment_id INT PRIMARY KEY,
    carpool_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT cpayment_fk1 FOREIGN KEY (carpool_id)
        REFERENCES Carpool (carpool_id),
    CONSTRAINT cpayment_fk2 FOREIGN KEY (user_id)
        REFERENCES NUser (id)
);

INSERT INTO Carpool_Payment (cpayment_id, carpool_id,  user_id )
VALUES ('1','1','2'),
('2','2','1');


-- CREATE TABLE Card (
--     card_number INT PRIMARY KEY,
--     card_type ENUM('DEBIT', 'CREDIT'),
--     expiry_date VARCHAR(64),
--     user_id INT NOT NULL,
--     CONSTRAINT card_fk1 FOREIGN KEY (user_id)
--         REFERENCES NUser (id)
-- );

-- CREATE TABLE Payment (
--     payment_id INT PRIMARY KEY,
--     user_id INT NOT NULL,
--     card_number INT NOT NULL,
--     CONSTRAINT payment_fk1 FOREIGN KEY (user_id)
--         REFERENCES NUser (id),
--     CONSTRAINT payment_fk2 FOREIGN KEY (card_number)
--         REFERENCES Card (card_number)
-- );




CREATE TABLE Joins (
    user_id INT NOT NULL,
    carpool_id INT NOT NULL,
    CONSTRAINT joins_fk1 FOREIGN KEY (user_id)
        REFERENCES NUser (id),
    CONSTRAINT carpool_joins_fk1 FOREIGN KEY (carpool_id)
        REFERENCES Carpool (carpool_id)
);

INSERT INTO Joins(user_id, carpool_id)
VALUES('1', '2'),
('2','1');


CREATE TABLE Issue (
    ticket_id INT PRIMARY KEY,
    issue_description TEXT,
    emp_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT issue_cs_fk1 FOREIGN KEY (emp_id)
        REFERENCES Customer_support (emp_id),
    CONSTRAINT issue_user_fk2 FOREIGN KEY (user_id)
        REFERENCES NUser (id)
);

INSERT INTO Issue(ticket_id, issue_description, emp_id, user_id)
VALUES('1','CAR LATE','1','1'),
('2','EVENT ENTRY PROBLEM','1','2');

CREATE TABLE Carpool_issue (
    ticket_id INT PRIMARY KEY,
    issue_description TEXT,
    location VARCHAR(64),
    carpool_id INT NOT NULL,
    CONSTRAINT includes_u_cp_fk1 FOREIGN KEY (carpool_id)
        REFERENCES Carpool (carpool_id)
);

INSERT INTO Carpool_issue(ticket_id, issue_description, location, carpool_id)
VALUES('1','CAR LATE','HUNTINGTON','1');


CREATE TABLE Event_issue (
    ticket_id INT PRIMARY KEY,
    issue_description TEXT,
    issue_time TIMESTAMP,
    event_id INT NOT NULL,
    CONSTRAINT has_e_ei_fk2 FOREIGN KEY (event_id)
        REFERENCES UEvent (event_id)
);

INSERT INTO Event_issue(ticket_id, issue_description, issue_time, event_id)
VALUES('2','EVENT ENTRY PROBLEM','2022-03-06 19:10:10','2');







SELECT 
    *
FROM
    NUser;