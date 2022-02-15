/*
We are running an experiment at an item-level, which means all users who visit will see the same page,
but the layout of different item pages may differ.
Compare this table to the assignment events we captured for user_level_testing.
Does this table have everything you need to compute metrics like 30-day view-binary?
*/


SELECT 
  * 
FROM 
  dsv1069.final_assignments_qa
  
    
/*
Reformat the final_assignments_qa to look like the final_assignments table, 
filling in any missing values with a placeholder of the appropriate data type
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
FROM dsv1069.final_assignments_qa;


/*
Use this table to 
compute order_binary for the 30 day window after the test_start_date
for the test named item_test_2
*/

SELECT test_assignment,
       COUNT(DISTINCT item_id) AS number_of_items,
       SUM(order_binary) AS items_ordered_30d
FROM
  (SELECT item_test_2.item_id,
          item_test_2.test_assignment,
          item_test_2.test_number,
          item_test_2.test_start_date,
          item_test_2.created_at,
          MAX(CASE
                  WHEN (created_at > test_start_date
                        AND DATE_PART('day', created_at - test_start_date) <= 30) THEN 1
                  ELSE 0
              END) AS order_binary
   FROM
     (SELECT final_assignments.*,
             DATE(orders.created_at) AS created_at
      FROM dsv1069.final_assignments AS final_assignments
      LEFT OUTER JOIN dsv1069.orders AS orders
        ON final_assignments.item_id = orders.item_id
        WHERE test_number = 'item_test_2') AS item_test_2   /* for item test 2 */
   GROUP BY item_test_2.item_id,
            item_test_2.test_assignment,
            item_test_2.test_number,
            item_test_2.test_start_date,
            item_test_2.created_at) AS order_binary
GROUP BY test_assignment;



