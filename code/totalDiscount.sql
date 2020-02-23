SELECT
  FORMAT_TIMESTAMP("%m", created_at) AS month,
  FORMAT_TIMESTAMP("%Y", created_at) AS year,
  currency,
  sum(discount*price)/100 AS totalDiscount
FROM sales S
LEFT JOIN sales_entries SE ON S.sale_id=SE.sale_id
WHERE FORMAT_TIMESTAMP("%Y", created_at) != '2017'
GROUP BY FORMAT_TIMESTAMP("%m", created_at), FORMAT_TIMESTAMP("%Y", created_at), currency