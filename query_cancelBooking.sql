CREATE PROCEDURE `cancelBooking` (NewBookingID INT)
BEGIN
delete from Bookings where BookingID = NewBookingID;
select('Booking deleted');
END
