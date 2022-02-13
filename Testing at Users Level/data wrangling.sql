/*
Figure out how many tests we have running right now
*/

SELECT distinct(parameter_value) as test_id 
FROM dsv1069.events 
WHERE
event_name = 'test_assignment'
AND 
parameter_name = 'test_id'


/*
Check for potential problems with test assignments. For example Make sure there
is no data obviously missing (This is an open ended question)
*/

SELECT 
  parameter_value as test_id,
  date(event_time) AS day,
  COUNT(*)         AS event_rows
FROM dsv1069.events 
WHERE
event_name = 'test_assignment'
AND
parameter_name = 'test_id'
GROUP BY 
  parameter_value,
  date(event_time)


/*
Write a query that returns a table of assignment events.
Please include all of the relevant parameters as columns 
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
