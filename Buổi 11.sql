EX1

SELECT
    COUNTRY.Continent,
    ROUND(AVG(CITY.Population)) AS avg_population 
FROM
    CITY
 INNER JOIN
    COUNTRY
ON
    CITY.CountryCode = COUNTRY.Code
GROUP BY
    COUNTRY.Continent;
EX2
SELECT 
  ROUND(COUNT(b.email_id)::DECIMAL
    /COUNT(DISTINCT a.email_id),2) AS activation_rate
FROM emails as a 
LEFT JOIN texts as b 
  ON a.email_id = b.email_id
  AND b.signup_action = 'Confirmed';  
ex3 
SELECT 
  age.age_bucket, 
  ROUND(100.0 * 
    SUM(a.time_spent) FILTER (WHERE a.activity_type = 'send') / 
    SUM(a.time_spent), 2) AS send_perc, 
  ROUND(100.0 * 
    SUM(a.time_spent) FILTER (WHERE a.activity_type = 'open') / 
    SUM(a.time_spent), 2) AS open_perc
FROM activities as a
INNER JOIN age_breakdown AS age 
  ON a.user_id = age.user_id 
WHERE a.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket;
EX4 
SELECT 
    a.customer_id, 
    COUNT(DISTINCT b.product_category) AS product_count
  FROM customer_contracts AS a
  INNER JOIN products as b 
    ON a.product_id = b.product_id
  GROUP BY customers.customer_id


SELECT customer_id
FROM supercloud_cust
WHERE product_count = 
  (SELECT COUNT(DISTINCT product_category) FROM products);
EX5 
SELECT 
    a.employee_id AS employee_id,
    a.name AS name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age), 0) AS average_age
FROM 
    Employees a
LEFT JOIN 
    Employees r ON e.employee_id = r.reports_to
WHERE 
    a.reports_to IS NULL
GROUP BY 
    a.employee_id, e.name
ORDER BY 
    a.employee_id;
EX6
SELECT
    p.product_name AS product_name,
    SUM(o.unit) AS unit
FROM
    Orders as o
JOIN
    Products as p ON o.product_id = p.product_id
WHERE
    o.order_date >= '2020-02-01' AND o.order_date <= '2020-02-29'
GROUP BY
    p.product_name
HAVING
    SUM(o.unit) >= 100;
EX7 
SELECT
    p.page_id
FROM
    pages as p
LEFT JOIN
    page_likes as pl ON p.page_id = pl.page_id
WHERE
    pl.page_id IS NULL
ORDER BY
    p.page_id ASC;
    
