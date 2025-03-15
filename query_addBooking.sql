CREATE PROCEDURE `addBooking` 
(NewBookingID INT, NewBookingDate Datetime, NewClientID INT, NewStaffID INT, NewTableNumber INT)
BEGIN
insert into Bookings(BookingID, BookingDate, ClientID, StaffID, TableNumber) values
(newBookingID, NewBookingDate, NewClientID, NewStaffID, NewTableNumber);
select 'Booking added.';
END
