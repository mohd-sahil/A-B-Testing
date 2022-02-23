/*
Figuring out how many tests we have running right now
*/

SELECT DISTINCT parameter_value AS test_id
FROM dsv1069.events
WHERE 
  event_name = 'test_assignment'
    AND 
  parameter_name = 'test_id'


--------------------------------------------------------------------------------------------------------

/*
Check for potential problems with test assignments
*/

SELECT 
  parameter_value as test_id,
  DATE(event_time) AS day,
  COUNT(*)         AS event_rows
FROM dsv1069.events 
WHERE
event_name = 'test_assignment'
AND
parameter_name = 'test_id'
GROUP BY 
  parameter_value,
  DATE(event_time)


--------------------------------------------------------------------------------------------------------

/*
Table of assignment events
*/

SELECT event_id,
       event_time,
       user_id,
       platform,
       MAX(CASE
               WHEN parameter_name = 'test_id' THEN CAST(parameter_value AS INT)
               ELSE NULL
           END) AS test_id,
       MAX(CASE
               WHEN parameter_name = 'test_assignment' THEN parameter_value
               ELSE NULL
           END) AS test_assignment
FROM dsv1069.events
WHERE event_name = 'test_assignment'
GROUP BY event_id,
         event_time,
         user_id,
         platform
ORDER BY event_id



