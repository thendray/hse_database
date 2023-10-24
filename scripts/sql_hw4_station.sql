CREATE TABLE city
(
    id     INT PRIMARY KEY,
    region VARCHAR(255),
    name   VARCHAR(255)
);

CREATE TABLE station
(
    id              INT PRIMARY KEY,
    name            VARCHAR(255),
    city_id         INT,
    tracks_quantity INT,
    FOREIGN KEY (city_id) REFERENCES city (id)
);


CREATE TABLE track
(
    id         INT PRIMARY KEY,
    station_id INT,
    number     INT,
    FOREIGN KEY (station_id) REFERENCES station (id)
);

CREATE TABLE train
(
    id     INT PRIMARY KEY,
    length INT
);

CREATE TABLE departure
(
    id       INT PRIMARY KEY,
    track_id INT,
    train_id INT,
    time     DATETIME,
    FOREIGN KEY (track_id) REFERENCES track (id),
    FOREIGN KEY (train_id) REFERENCES train (id)
);

CREATE TABLE arrival
(
    id           INT PRIMARY KEY,
    track_number INT,
    track_id     INT,
    train_id     INT,
    time         DATETIME,
    FOREIGN KEY (track_id) REFERENCES track (id),
    FOREIGN KEY (train_id) REFERENCES train (id)
);
