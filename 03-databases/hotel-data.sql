-- Create a database for the model we built in the example. Create a SQL file that creates the tables and inserts sample data (the questions below will help you create the data). Write queries that demonstrate the following scenarios:
-- Find a guest who exists in the database and has not booked a room.
-- Find bookings for a guest who has booked two rooms for the same dates.
-- Find bookings for a guest who has booked one room several times on different dates.
-- Count the number of unique guests who have booked the same room.

CREATE TABLE guest (id integer, first_name text, last_name text, phone_number varchar(12), email varchar(35), address text);
CREATE TABLE room (id integer, room_number integer, floor_number integer, price_per_night money);
CREATE TABLE visit (id integer, guest_id integer, room_id integer, check_in date, checkout_out date);