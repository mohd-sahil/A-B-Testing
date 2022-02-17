/*
Computing a metric that measures
Whether a user created an order after their test assignment
Note :
- Even if a user had zero orders, we should have a row that counts their number of orders as zero
- If the user is not in the experiment they should not be included
*/

SELECT
  test_events.test_id,
  test_events.test_assignment,
  test_events.user_id,
  MAX (CASE WHEN orders.created_at > test_events.event_time THEN 1 ELSE 0 END) AS orders_after_assignment_binary
FROM 
    (
    SELECT event_id,
         event_time,
         user_id,
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
           user_id) test_events
    LEFT JOIN 
      dsv1069.orders
    ON 
      orders.user_id = test_events.user_id
    GROUP BY 
        test_events.test_id,
        test_events.test_assignment,
        test_events.user_id
      
      
