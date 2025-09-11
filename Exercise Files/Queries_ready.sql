/* LeetCode 183: Duplicate Emails */
SELECT w1.id, w1.recorddate as today, w1.temperature as cur_temp,
       w2.temperature as prev_temp
FROM check1 w1
JOIN check1 w2 
ON w1.recorddate = w2.recorddate + INTERVAL '1 month'
where w1.temperature > w2.temperature



/* LeetCode 183: Duplicate Emails */
delete from check1 
where id NOT IN (
SELECT c1.id
FROM check1 c1
JOIN (
    SELECT email, MIN(id) as min_id
    FROM check1
    GROUP BY email
    HAVING COUNT(*) > 0
) dup ON c1.email = dup.email AND c1.id = dup.min_id)



/* LeetCode 177. Nth Highest Salary */
CREATE OR REPLACE FUNCTION NthHighestSalary(n INT)
RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY
SELECT ranked.salary
FROM (
  SELECT c.salary, RANK() OVER (ORDER BY c.salary DESC) AS s_rank
  FROM check1 c
) ranked
WHERE ranked.s_rank = n
LIMIT 1;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM NthHighestSalary(88);
