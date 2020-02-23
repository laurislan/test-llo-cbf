SELECT
  FORMAT_TIMESTAMP("%m", created_at) AS month,
  FORMAT_TIMESTAMP("%Y", created_at) AS year,
  currency,
  trunc(sum(amount)/100) as totalSales
FROM sales S
GROUP BY FORMAT_TIMESTAMP("%m", created_at), FORMAT_TIMESTAMP("%Y", created_at), currency