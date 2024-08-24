CREATE DATABASE RailwaySystem;
USE RailwaySystem;

CREATE TABLE Stations (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

INSERT INTO Stations (StationName, Location) VALUES
('Chhatrapati Shivaji Maharaj Terminus', 'Mumbai, Maharashtra'),
('New Delhi', 'New Delhi, Delhi'),
('Howrah Junction', 'Howrah, West Bengal'),
('Chennai Central', 'Chennai, Tamil Nadu'),
('Secunderabad Junction', 'Secunderabad, Telangana'),
('Bengaluru City Junction', 'Bengaluru, Karnataka'),
('Pune Junction', 'Pune, Maharashtra'),
('Kanpur Central', 'Kanpur, Uttar Pradesh'),
('Patna Junction', 'Patna, Bihar'),
('Lucknow Junction', 'Lucknow, Uttar Pradesh');


CREATE TABLE Trains (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    TrainName VARCHAR(100) NOT NULL,
    TrainType VARCHAR(50) NOT NULL
);

INSERT INTO Trains (TrainName, TrainType) VALUES
('Rajdhani Express', 'Express'),
('Shatabdi Express', 'Express'),
('Duronto Express', 'Express'),
('Garib Rath', 'Express'),
('Intercity Express', 'Express'),
('Humsafar Express', 'Express'),
('Jan Shatabdi', 'Express'),
('Suvidha Express', 'Special'),
('Mysore Express', 'Passenger'),
('Mahalaxmi Express', 'Passenger');


CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerName VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL
);

INSERT INTO Passengers (PassengerName, Age, Gender) VALUES
('Rahul Sharma', 34, 'Male'),
('Priya Deshmukh', 28, 'Female'),
('Amitabh Sinha', 45, 'Male'),
('Sunita Rao', 51, 'Female'),
('Rajesh Kumar', 40, 'Male'),
('Neha Gupta', 22, 'Female'),
('Vikram Singh', 60, 'Male'),
('Anjali Mehta', 32, 'Female'),
('Ravi Patel', 27, 'Male'),
('Deepika Menon', 29, 'Female');



CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    DepartureStationID INT,
    ArrivalStationID INT,
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (DepartureStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (ArrivalStationID) REFERENCES Stations(StationID)
);

INSERT INTO Schedules (TrainID, DepartureStationID, ArrivalStationID, DepartureTime, ArrivalTime) VALUES
(1, 1, 2, '2024-08-20 21:00:00', '2024-08-21 15:00:00'), -- Rajdhani Express from Mumbai to Delhi
(2, 2, 3, '2024-08-20 06:00:00', '2024-08-20 18:00:00'), -- Shatabdi Express from Delhi to Howrah
(3, 3, 4, '2024-08-21 08:00:00', '2024-08-21 20:00:00'), -- Duronto Express from Howrah to Chennai
(4, 4, 5, '2024-08-22 09:00:00', '2024-08-22 22:00:00'), -- Garib Rath from Chennai to Secunderabad
(5, 5, 6, '2024-08-23 07:00:00', '2024-08-23 19:00:00'), -- Intercity Express from Secunderabad to Bengaluru
(6, 6, 7, '2024-08-24 05:00:00', '2024-08-24 17:00:00'), -- Humsafar Express from Bengaluru to Pune
(7, 7, 8, '2024-08-25 09:30:00', '2024-08-25 20:30:00'), -- Jan Shatabdi from Pune to Kanpur
(8, 8, 9, '2024-08-26 04:00:00', '2024-08-26 16:00:00'), -- Suvidha Express from Kanpur to Patna
(9, 9, 10, '2024-08-27 06:00:00', '2024-08-27 18:00:00'), -- Mysore Express from Patna to Lucknow
(10, 10, 1, '2024-08-28 07:00:00', '2024-08-28 19:00:00'); -- Mahalaxmi Express from Lucknow to Mumbai

CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    ScheduleID INT,
    SeatNumber VARCHAR(10) NOT NULL,
    BookingDate DATETIME NOT NULL,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);

INSERT INTO Tickets (PassengerID, ScheduleID, SeatNumber, BookingDate) VALUES
(1, 1, 'A1-05', '2024-08-15 10:00:00'),
(2, 2, 'B2-12', '2024-08-15 11:00:00'),
(3, 3, 'C3-08', '2024-08-16 09:00:00'),
(4, 4, 'D4-10', '2024-08-16 10:00:00'),
(5, 5, 'E5-01', '2024-08-17 08:00:00'),
(6, 6, 'F6-07', '2024-08-17 09:00:00'),
(7, 7, 'G7-15', '2024-08-18 07:00:00'),
(8, 8, 'H8-09', '2024-08-18 08:00:00'),
(9, 9, 'I9-02', '2024-08-19 06:00:00'),
(10, 10, 'J10-03', '2024-08-19 07:00:00');


CREATE TABLE TrainRoutes (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    StationID INT,
    ArrivalTime DATETIME NOT NULL,
    DepartureTime DATETIME NOT NULL,
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (StationID) REFERENCES Stations(StationID)
);


INSERT INTO TrainRoutes (TrainID, StationID, ArrivalTime, DepartureTime) VALUES
(1, 1, '2024-08-20 20:30:00', '2024-08-20 21:00:00'), -- Rajdhani Express at Mumbai
(1, 2, '2024-08-21 14:30:00', '2024-08-21 15:00:00'), -- Rajdhani Express at Delhi
(2, 2, '2024-08-20 05:30:00', '2024-08-20 06:00:00'), -- Shatabdi Express at Delhi
(2, 3, '2024-08-20 17:30:00', '2024-08-20 18:00:00'), -- Shatabdi Express at Howrah
(3, 3, '2024-08-21 07:30:00', '2024-08-21 08:00:00'), -- Duronto Express at Howrah
(3, 4, '2024-08-21 19:30:00', '2024-08-21 20:00:00'), -- Duronto Express at Chennai
(4, 4, '2024-08-22 08:30:00', '2024-08-22 09:00:00'), -- Garib Rath at Chennai
(4, 5, '2024-08-22 21:30:00', '2024-08-22 22:00:00'), -- Garib Rath at Secunderabad
(5, 5, '2024-08-23 06:30:00', '2024-08-23 07:00:00'), -- Intercity Express at Secunderabad
(5, 6, '2024-08-23 18:30:00', '2024-08-23 19:00:00'); -- Intercity Express at Bengaluru

