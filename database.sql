CREATE DATABASE IF NOT EXISTS ticketing_db;
USE ticketing_db;

-- Users table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Flights table
CREATE TABLE IF NOT EXISTS flights (
  id INT AUTO_INCREMENT PRIMARY KEY,
  flight_number VARCHAR(20) NOT NULL,
  airline VARCHAR(100) NOT NULL,
  source VARCHAR(100) NOT NULL,
  destination VARCHAR(100) NOT NULL,
  departure_time VARCHAR(50) NOT NULL,
  arrival_time VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  seats_available INT NOT NULL,
  duration VARCHAR(30) NOT NULL
);

-- Trains table
CREATE TABLE IF NOT EXISTS trains (
  id INT AUTO_INCREMENT PRIMARY KEY,
  train_number VARCHAR(20) NOT NULL,
  train_name VARCHAR(100) NOT NULL,
  source VARCHAR(100) NOT NULL,
  destination VARCHAR(100) NOT NULL,
  departure_time VARCHAR(50) NOT NULL,
  arrival_time VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  seats_available INT NOT NULL,
  duration VARCHAR(30) NOT NULL
);

-- Buses table
CREATE TABLE IF NOT EXISTS buses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  bus_number VARCHAR(20) NOT NULL,
  operator VARCHAR(100) NOT NULL,
  source VARCHAR(100) NOT NULL,
  destination VARCHAR(100) NOT NULL,
  departure_time VARCHAR(50) NOT NULL,
  arrival_time VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  seats_available INT NOT NULL,
  duration VARCHAR(30) NOT NULL,
  bus_type VARCHAR(50) DEFAULT 'AC Seater'
);

-- Cars table
CREATE TABLE IF NOT EXISTS cars (
  id INT AUTO_INCREMENT PRIMARY KEY,
  car_model VARCHAR(100) NOT NULL,
  car_type VARCHAR(50) NOT NULL,
  operator VARCHAR(100) NOT NULL,
  source VARCHAR(100) NOT NULL,
  destination VARCHAR(100) NOT NULL,
  pickup_time VARCHAR(50) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  seats_available INT NOT NULL,
  duration VARCHAR(30) NOT NULL,
  amenities VARCHAR(255)
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  transport_type ENUM('flight','train','bus','car') NOT NULL,
  transport_id INT NOT NULL,
  passenger_name VARCHAR(100) NOT NULL,
  passenger_age INT NOT NULL,
  source VARCHAR(100) NOT NULL,
  destination VARCHAR(100) NOT NULL,
  booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  pnr VARCHAR(20) UNIQUE NOT NULL,
  status ENUM('confirmed','cancelled') DEFAULT 'confirmed',
  amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============================================
-- SEED DATA
-- ============================================

-- Flights
INSERT INTO flights (flight_number, airline, source, destination, departure_time, arrival_time, price, seats_available, duration) VALUES
('AI-101', 'Air India', 'Mumbai', 'Delhi', '06:00 AM', '08:15 AM', 4500.00, 42, '2h 15m'),
('6E-302', 'IndiGo', 'Mumbai', 'Delhi', '08:30 AM', '10:45 AM', 3800.00, 28, '2h 15m'),
('SG-501', 'SpiceJet', 'Mumbai', 'Bangalore', '07:00 AM', '08:30 AM', 3200.00, 55, '1h 30m'),
('AI-203', 'Air India', 'Delhi', 'Chennai', '09:00 AM', '11:45 AM', 5200.00, 18, '2h 45m'),
('6E-780', 'IndiGo', 'Bangalore', 'Hyderabad', '10:15 AM', '11:30 AM', 2800.00, 60, '1h 15m'),
('UK-512', 'Vistara', 'Mumbai', 'Kolkata', '11:00 AM', '02:00 PM', 6100.00, 22, '3h 00m'),
('AI-455', 'Air India', 'Chennai', 'Mumbai', '01:00 PM', '03:15 PM', 4700.00, 35, '2h 15m'),
('SG-210', 'SpiceJet', 'Delhi', 'Goa', '02:30 PM', '04:45 PM', 4100.00, 40, '2h 15m');

-- Trains
INSERT INTO trains (train_number, train_name, source, destination, departure_time, arrival_time, price, seats_available, duration) VALUES
('12951', 'Mumbai Rajdhani', 'Mumbai', 'Delhi', '05:00 PM', '08:35 AM', 1450.00, 120, '15h 35m'),
('12301', 'Howrah Rajdhani', 'Delhi', 'Kolkata', '04:55 PM', '09:55 AM', 1650.00, 88, '17h 00m'),
('12163', 'Chennai Express', 'Mumbai', 'Chennai', '11:00 PM', '03:15 PM', 1250.00, 200, '16h 15m'),
('12627', 'Karnataka Express', 'Delhi', 'Bangalore', '10:30 PM', '11:00 AM', 1800.00, 150, '36h 30m'),
('12839', 'Howrah Mail', 'Chennai', 'Kolkata', '11:45 PM', '07:30 AM', 1100.00, 95, '31h 45m'),
('12009', 'Shatabdi Express', 'Mumbai', 'Pune', '06:10 AM', '08:05 AM', 420.00, 180, '1h 55m'),
('22691', 'Rajdhani Express', 'Bangalore', 'Delhi', '08:00 PM', '11:30 AM', 2100.00, 60, '39h 30m'),
('12621', 'Tamil Nadu Exp', 'Delhi', 'Chennai', '10:30 PM', '07:15 AM', 1550.00, 110, '32h 45m');

-- Buses
INSERT INTO buses (bus_number, operator, source, destination, departure_time, arrival_time, price, seats_available, duration, bus_type) VALUES
('MH-01-AB-1234', 'RedBus Premium', 'Mumbai', 'Pune', '07:00 AM', '10:00 AM', 350.00, 38, '3h 00m', 'AC Sleeper'),
('MH-02-CD-5678', 'VRL Travels', 'Mumbai', 'Goa', '09:30 PM', '06:00 AM', 750.00, 28, '8h 30m', 'AC Sleeper'),
('KA-01-EF-9012', 'KSRTC', 'Bangalore', 'Mysore', '06:00 AM', '09:00 AM', 280.00, 52, '3h 00m', 'AC Seater'),
('TN-01-GH-3456', 'Parveen Travels', 'Chennai', 'Coimbatore', '08:00 PM', '04:00 AM', 600.00, 40, '8h 00m', 'AC Sleeper'),
('DL-01-IJ-7890', 'Raj National', 'Delhi', 'Agra', '06:30 AM', '10:00 AM', 450.00, 45, '3h 30m', 'AC Seater'),
('MH-03-KL-2345', 'Orange Travels', 'Mumbai', 'Nashik', '07:30 AM', '11:00 AM', 300.00, 48, '3h 30m', 'Non-AC Seater'),
('AP-01-MN-6789', 'APSRTC', 'Hyderabad', 'Vijayawada', '05:00 PM', '10:00 PM', 380.00, 50, '5h 00m', 'AC Seater'),
('RJ-01-OP-0123', 'Raj Travels', 'Delhi', 'Jaipur', '08:00 AM', '01:00 PM', 520.00, 36, '5h 00m', 'AC Seater');

-- Cars
INSERT INTO cars (car_model, car_type, operator, source, destination, pickup_time, price, seats_available, duration, amenities) VALUES
('Toyota Innova', 'SUV', 'Ola Outstation', 'Mumbai', 'Pune', 'Flexible', 2200.00, 6, '3h 00m', 'AC, Music, GPS'),
('Maruti Swift Dzire', 'Sedan', 'Zoomcar', 'Delhi', 'Agra', 'Flexible', 1800.00, 4, '3h 30m', 'AC, Music'),
('Honda City', 'Sedan', 'Rapido Cab', 'Bangalore', 'Mysore', 'Flexible', 1600.00, 4, '3h 00m', 'AC, WiFi, GPS'),
('Toyota Fortuner', 'SUV', 'Luxury Rides', 'Mumbai', 'Goa', 'Flexible', 8500.00, 7, '8h 30m', 'AC, Music, GPS, Sunroof'),
('Maruti Ertiga', 'MPV', 'Ola Outstation', 'Chennai', 'Pondicherry', 'Flexible', 2400.00, 6, '3h 30m', 'AC, Music, GPS'),
('Hyundai Creta', 'SUV', 'Zoomcar', 'Hyderabad', 'Warangal', 'Flexible', 1900.00, 5, '2h 30m', 'AC, GPS'),
('Toyota Innova Crysta', 'SUV', 'Luxury Rides', 'Delhi', 'Haridwar', 'Flexible', 4500.00, 7, '5h 00m', 'AC, Music, GPS, Water Bottles'),
('Mercedes E-Class', 'Luxury', 'Elite Cars', 'Mumbai', 'Delhi', 'Flexible', 15000.00, 4, 'By Air+Transfer', 'AC, WiFi, Minibar, Leather Seats');