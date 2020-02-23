SELECT
  city,
  country,
  sum(price*(1-discount/100)) AS totalCitySales
FROM sales S
LEFT JOIN sales_entries SE ON S.sale_id=SE.sale_id
LEFT JOIN journeys J ON SE.journey_id=J.journey_id
GROUP BY city,country
HAVING sum(price*(1-discount/100))<1500