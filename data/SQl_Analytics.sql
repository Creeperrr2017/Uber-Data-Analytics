use uber_data

select * from cleaned_uber_date;

-- total request

SELECT COUNT(*) AS total_requests FROM cleaned_uber_date;

-- requests by pickup point--

SELECT Pickup_point, COUNT(*) AS total_requests
FROM cleaned_uber_date
GROUP BY Pickup_point
ORDER BY total_requests DESC;

-- cancelation rate by pickup point

SELECT 
Pickup_point,
COUNT(*) AS total_requests,
SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_requests,
ROUND(SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS cancel_rate_percent
FROM cleaned_uber_date
GROUP BY Pickup_point;

-- min max and  avg delivery time 

SELECT 
  Pickup_point,
  ROUND(AVG(Delivery_Time_Min), 2) AS avg_time_min,
  MAX(Delivery_Time_Min) AS max_time_min,
  MIN(Delivery_Time_Min) AS min_time_min
FROM cleaned_uber_date
WHERE Delivery_Time_Min IS NOT NULL
GROUP BY Pickup_point;







