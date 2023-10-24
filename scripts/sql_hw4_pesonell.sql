CREATE TABLE station
(
    id   INT PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE station_personell
(
    id         INT PRIMARY KEY,
    station_id INT,
    name       VARCHAR(255),
    FOREIGN KEY (station_id) REFERENCES station (id)
);


CREATE TABLE room
(
    id         INT PRIMARY KEY,
    station_id INT,
    FOREIGN KEY (station_id) REFERENCES station (id)
);

CREATE TABLE caregiver
(
    id                   INT PRIMARY KEY,
    station_personell_id INT,
    qualification        VARCHAR(255),
    FOREIGN KEY (station_personell_id) REFERENCES station_personell (id)
);

CREATE TABLE doctor
(
    id                   INT PRIMARY KEY,
    station_personell_id INT,
    area                 INT,
    `rank`               VARCHAR(255),
    FOREIGN KEY (station_personell_id) REFERENCES station_personell (id)
);

CREATE TABLE bed
(
    id      INT PRIMARY KEY,
    room_id INT,
    FOREIGN KEY (room_id) REFERENCES room (id)
);


CREATE TABLE patient
(
    id        INT PRIMARY KEY,
    doctor_id INT,
    name      VARCHAR(255),
    disease   VARCHAR(255),
    bed_id    INT,
    FOREIGN KEY (doctor_id) REFERENCES doctor (id),
    FOREIGN KEY (bed_id) REFERENCES bed (id)
);


