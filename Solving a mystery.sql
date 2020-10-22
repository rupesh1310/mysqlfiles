CREATE VIEW suspected_rides AS
SELECT * FROM vehicle_location_histories AS v1h
WHERE
	city = 'new york' AND
	long BETWEEN 40.5 AND 40.6 AND
	lat BETWEEN -74.997 AND -74.9968 AND
	v1h.timestamp::date = '2020-06-23'::date
ORDER BY long;



SELECT DISTINCT r.vehicle_id, u.name AS "owner name", u.address, u.status,
v.current_location
FROM suspected_rides AS sr
JOIN rides AS r ON r.id = sr.ride_id
JOIN vehicles AS v ON v.id = r.vehicle_id
JOIN users AS u ON u.id = v.owner_id