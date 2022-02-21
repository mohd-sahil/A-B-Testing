/*
ORDER BINARY Metric
(computing order_binary for the 30 day window after the test_start_date
for the test named item_test_2)
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
GROUP BY test_assignment


-------------------------------------------------------------------------------------------------------------------------------

/*
VIEW ITEM Metric 
(computing view_binary for the 30 day window after the test_start_date
for the test named item_test_2)
*/

SELECT
test_assignment,
COUNT(item_id) AS items,
SUM(view_binary_30d) AS viewed_items,
CAST(100*SUM(view_binary_30d)/COUNT(item_id) AS FLOAT) AS viewed_percent,
SUM(views) AS views,
SUM(views)/COUNT(item_id) AS average_views_per_item
FROM 
(
 SELECT 
   fa.test_assignment,
   fa.item_id, 
   MAX(CASE WHEN views.event_time > fa.test_start_date THEN 1 ELSE 0 END)  AS view_binary_30d,
   COUNT(views.event_id) AS views
  FROM 
    dsv1069.final_assignments fa
    
  LEFT OUTER JOIN 
    (
    SELECT 
      event_time,
      event_id,
      CAST(parameter_value AS INT) AS item_id
    FROM 
      dsv1069.events 
    WHERE 
      event_name = 'view_item'
    AND 
      parameter_name = 'item_id'
    ) views
  ON 
    fa.item_id = views.item_id
  AND 
    views.event_time >= fa.test_start_date
  AND 
    DATE_PART('day', views.event_time - fa.test_start_date ) <= 30
  WHERE 
    fa.test_number= 'item_test_2'
  GROUP BY
    fa.test_assignment,
    fa.item_id
) item_level
GROUP BY 
 test_assignment
 
 


