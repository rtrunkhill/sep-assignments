-- Create a database for the model we built in the example. Create a SQL file that creates the tables and inserts sample data (the questions below will help you create the data). Write queries that demonstrate the following scenarios:
-- Find a guest who exists in the database and has not booked a room.
-- Find bookings for a guest who has booked two rooms for the same dates.
-- Find bookings for a guest who has booked one room several times on different dates.
-- Count the number of unique guests who have booked the same room.

CREATE TABLE guest (id integer, first_name text, last_name text, phone_number varchar(12), email varchar(35), address text);
CREATE TABLE room (id integer, room_number integer, floor_number integer, price_per_night money);
CREATE TABLE visit (id integer, guest_id integer, room_id integer, check_in date, checkout_out date);

INSERT INTO guests (id, first_name, last_name, phone_number, email, address) VALUES
  (1, 'rory', 'trunkhill', '111-111-1111', 'rory@email.com', '123 lvbd'),
  (2, 'sarah', 'hawkins', '222-222-2222', 'sarah@email.com', '234 sunset'),
  (3, 'lisa', 'something', '333-333-3333', 'lisa@email.com', '456 main'),
  (4, 'tove', 'trunkhill', '444-444-4444', 'tove@email.com', '789 mlk'),
  (5, 'cheryll', 'brooks', '555-555-5555', 'cheryll@email.com', '357 broad');
  
INSERT INTO rooms (id, room_number, floor_number, price_per_night) VALUES
  (1, 100, 1, '100.00'),
  (2, 110, 1, '100.00'),
  (3, 120, 1, '100.00'),
  (4, 200, 2, '150.00'),
  (5, 210, 2, '150.00'),
  (6, 220, 2, '150.00');
  
INSERT INTO visits (id, guest_id, room_id, check_in, check_out) VALUES
  (1, 1, 1, '2017-03-24', '2017-03-27'),
  (2, 1, 1, '2016-03-24', '2016-03-26'),
  (3, 2, 4, '2018-02-10', '2018-02-16'),
  (4, 2, 5, '2018-02-10', '2018-02-16'),
  (5, 3, 1, '2017-12-23', '2018-01-03'),
  (6, 4, 6, '2017-07-02', '2017-07-06');