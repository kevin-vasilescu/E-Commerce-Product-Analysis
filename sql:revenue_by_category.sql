-- This query calculates the total revenue for each product category.
-- It joins order_items, products, and the translation table.
-- Revenue is calculated as the sum of the price for all items sold in each category.

SELECT
    pt.product_category_name_english AS category,
    SUM(oi.price) AS total_revenue
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
JOIN
    product_category_name_translation pt ON p.product_category_name = pt.product_category_name
GROUP BY
    category
ORDER BY
    total_revenue DESC;