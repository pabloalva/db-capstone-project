CREATE DEFINER=`admin1`@`%` PROCEDURE `AddValidBooking`(NewBookingDate Datetime, NewClientID INT, NewStaffID INT, NewTableNumber INT)
BEGIN
declare table_status int;
declare new_booking_number int;
set table_status = Check_Booking(NewBookingDate, NewTableNumber);
set new_booking_number = (select max(BookingID) from Bookings) + 1;
start transaction;
if(table_status = 0)
then
rollback;
select 'Booking not valid. Table taken.';

else


insert into Bookings(BookingID, BookingDate, ClientID, StaffID, TableNumber) values
(new_booking_number, NewBookingDate, NewClientID, NewStaffID, NewTableNumber);
select 'Booking valid.';


end if;
END