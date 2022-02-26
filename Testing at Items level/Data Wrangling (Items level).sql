/*
We are running an experiment at an item-level, which means all users who visit will see the same page,
but the layout of different item pages may differ.
Comparing this table to the assignment events table (captured for user_level_testing)
*/


SELECT 
  * 
FROM 
  dsv1069.final_assignments_qa
  
--Note: the date of the assighnment is not present. Therefore no 30-day binary matric can be created
  
-------------------------------------------------------------------------------------------------------------------------
 
 
/*
Reformating the final_assignments_qa table to look like the final_assignments table
*/

SELECT item_id,
       test_a AS test_assignment,
       (CASE
            WHEN test_a IS NOT NULL then 'test_a'
            ELSE NULL
        END) AS test_number,
       (CASE
            WHEN test_a IS NOT NULL then '2013-01-05 00:00:00'
            ELSE NULL
        END) AS test_start_date
FROM dsv1069.final_assignments_qa
UNION
SELECT item_id,
       test_b AS test_assignment,
       (CASE
            WHEN test_b IS NOT NULL then 'test_b'
            ELSE NULL
        END) AS test_number,
       (CASE
            WHEN test_b IS NOT NULL then '2013-01-05 00:00:00'
            ELSE NULL
        END) AS test_start_date
FROM dsv1069.final_assignments_qa
UNION
SELECT item_id,
       test_c AS test_assignment,
       (CASE
            WHEN test_c IS NOT NULL then 'test_c'
            ELSE NULL
        END) AS test_number,
       (CASE
            WHEN test_c IS NOT NULL then '2013-01-05 00:00:00'
            ELSE NULL
        END) AS test_start_date
FROM dsv1069.final_assignments_qa
UNION
SELECT item_id,
       test_d AS test_assignment,
       (CASE
            WHEN test_d IS NOT NULL then 'test_d'
            ELSE NULL
        END) AS test_number,
       (CASE
            WHEN test_d IS NOT NULL then '2013-01-05 00:00:00'
            ELSE NULL
        END) AS test_start_date
FROM dsv1069.final_assignments_qa
UNION
SELECT item_id,
       test_e AS test_assignment,
       (CASE
            WHEN test_e IS NOT NULL then 'test_e'
            ELSE NULL
        END) AS test_number,
       (CASE
            WHEN test_e IS NOT NULL then '2013-01-05 00:00:00'
            ELSE NULL
        END) AS test_start_date
FROM dsv1069.final_assignments_qa
UNION
SELECT item_id,
       test_f AS test_assignment,
       (CASE
            WHEN test_f IS NOT NULL then 'test_f'
            ELSE NULL
        END) AS test_number,
       (CASE
            WHEN test_f IS NOT NULL then '2013-01-05 00:00:00'
            ELSE NULL
        END) AS test_start_date
FROM dsv1069.final_assignments_qa



