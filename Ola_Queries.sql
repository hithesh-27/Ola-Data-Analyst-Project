Create Database Ola;
Use Ola;

#1. Retrive all successful Bookings:
Create View successful_Bookings as
SELECT * FROM Bookings where Booking_Status="Success";

Select * from successful_Bookings;

#2. Find the average ride distance for each Vehicle type:
create View ride_distance_for_each_Vehicle as
Select Vehicle_Type,avg(Ride_Distance)
as avg_distance from Bookings
group by Vehicle_Type;

Select * from ride_distance_for_each_Vehicle;

#3. Get the total number of cancelled rides by customers:
Create View total_number_of_cancelled_rides_by_customers as 
select count(*) from Bookings
where Booking_Status = 'Canceled by Customer';

select * from  total_number_of_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Create View top_5_customers_who_booked_the_highest_number_of_rides as
Select Customer_ID , COUNT(Booking_ID) as total_rides
from Bookings
group by Customer_ID
order by total_rides desc limit 5;

Select * from top_5_customers_who_booked_the_highest_number_of_rides;

#5. Get the number of rides canceled by drivers due to personal and car-related issues:
Create View canceled_by_drivers_due_to_personal_and_car_related_issues as
Select count(*) from Bookings 
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from canceled_by_drivers_due_to_personal_and_car_related_issues;

#6 Find the maximum and minimum driver ratings from Prime Sedan bookings:
Create View maximum_and_minimum_driver_ratings_from_Prime_Sedan_bookings as 
Select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from Bookings
where Vehicle_Type = "Prime Sedan";

select * from maximum_and_minimum_driver_ratings_from_Prime_Sedan_bookings;

#7. Retrieve all rides where payment was made using UPI;
Create View rides_where_payment_was_made_using_UPI as
Select * from Bookings
where Payment_Method = "UPI";

Select * from rides_where_payment_was_made_using_UPI;

#8. Find the average customer rating per vehicle:
Create View average_customer_rating_per_vehicle as 
Select Vehicle_Type,avg(Driver_Ratings) as Ratings
from Bookings
Group by Vehicle_Type;

Select * from  average_customer_rating_per_vehicle;

#9. Calculate the total booking value of rides completed successfully:
Create View total_booking_value_of_rides_completed_successfully as 
select sum(Booking_Value) as Total_successful_value
from bookings
where Booking_Status='Success';

Select * from total_booking_value_of_rides_completed_successfully;

#10. List all incomplete rides along with the reason:
Create View  incomplete_rides_along_with_the_reason as
Select Booking_ID,Incomplete_Rides_Reason
from Bookings
where Incomplete_Rides = "Yes";

Select * from  incomplete_rides_along_with_the_reason;






