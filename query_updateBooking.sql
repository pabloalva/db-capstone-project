CREATE DEFINER=`admin1`@`%` PROCEDURE `updateBooking`(NewBookingID INT, NewBookingDate Datetime)
BEGIN
update Bookings
set BookingDate = NewBookingDate
where BookingID = NewBookingID;
select 'Booking updated.';

END