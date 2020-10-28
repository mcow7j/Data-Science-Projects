
--order of clauses
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY
--LIMIT


-- counts rows
SELECT COUNT(*)
FROM fake_apps;

--sums other operators include ,MAX, MIN, AVG
SELECT SUM(downloads)
FROM fake_apps;

-- integer is number of d.p
SELECT name, ROUND(price, 0)
FROM fake_apps;

-- groups data after it has been functioned
SELECT price, COUNT(*)
FROM fake_apps
GROUP BY price;

-- harder group by example
SELECT category,
   price,
   AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;

-- having statement
SELECT price,
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(price)>10;

--JOIN example
SELECT *
FROM orders
JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine'  ;

-- outer join will join columns with left column dominating
SELECT *
FROM table1
LEFT JOIN table2
  ON table1.c2 = table2.c2;


-- When the primary key for one table appears in a different table, it is called a foreign key e.g
  SELECT *
FROM classes
JOIN students
  ON classes.id = students.class_id;

--cross gets all possible outcomes
  SELECT shirts.shirt_color,
   pants.pants_color
FROM shirts
CROSS JOIN pants;

--where with join logic
SELECT month,
   COUNT(*) AS 'subscribers'
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
   AND end_month >= month
GROUP BY month;


--combines tables together
SELECT *
FROM newspaper
UNION
SELECT *
FROM online;

-- example with statement
WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name,
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;


  select
  submission_date ,

  ( SELECT COUNT(distinct hacker_id)
   FROM Submissions s2
   WHERE s2.submission_date = s1.submission_date AND    (SELECT COUNT(distinct s3.submission_date) FROM      Submissions s3 WHERE s3.hacker_id = s2.hacker_id AND s3.submission_date < s1.submission_date) = dateDIFF(s1.submission_date , '2016-03-01')) ,

  (select hacker_id  from submissions s2 where s2.submission_date = s1.submission_date
  group by hacker_id order by count(submission_id) desc , hacker_id limit 1) as shit,
  (select name from hackers where hacker_id = shit)
  from
  (select distinct submission_date from submissions) s1
  group by submission_date
