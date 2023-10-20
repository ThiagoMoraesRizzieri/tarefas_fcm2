SELECT MAX(price), MIN(price), brand
FROM sales.products
GROUP BY sales.products.brand

