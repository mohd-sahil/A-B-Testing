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
  
  
  
-------------------------------------------------------------------------------------------------------------------------
 
 
/*
Reformat the final_assignments_qa to look like the final_assignments table, 
filling in any missing values with a placeholder of the appropriate data type.
*/

SELECT 
  item_id,
  test_a       AS test_assignment, 
  'test_a'     AS test_number, 
  '2020-01-01' AS test_start_date
FROM 
  dsv1069.final_assignments_qa



