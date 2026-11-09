SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(SUM(oi.line_sales), 2) AS total_revenue,
    ROUND(SUM(oi.line_profit), 2) AS total_profit,
    ROUND(
        SUM(oi.line_profit) / NULLIF(SUM(oi.line_sales), 0) * 100,
        2
    ) AS profit_margin_pct,
    ROUND(
        SUM(oi.line_sales) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM Orders o
JOIN OrderItems oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';