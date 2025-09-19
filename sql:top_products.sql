-- This query identifies the top 10 most sold products by quantity.
-- It joins the order_items and products tables and translates category names to English.

SELECT
    p.product_id,
    pt.product_category_name_english AS product_category,
    COUNT(oi.order_id) AS total_units_sold
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
JOIN
    product_category_name_translation pt ON p.product_category_name = pt.product_category_name
GROUP BY
    p.product_id,
    product_category
ORDER BY
    total_units_sold DESC
LIMIT 10;