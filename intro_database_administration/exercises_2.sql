USE sloppyjoes;

SELECT * from customer_orders;
SELECT * from menu_items;
SELECT * from staff;

UPDATE customer_orders
SET order_total = 0
WHERE order_id IN (3, 8, 12, 16, 19);

DELIMITER //
CREATE PROCEDURE sp_staffOrdersServed()
BEGIN
	SELECT staff_id, COUNT(order_id) AS orders_served
    FROM customer_orders
    GROUP BY staff_id;
END //
DELIMITER ;

CALL sp_staffOrdersServed;

SELECT * FROM customer_orders;

CREATE TRIGGER updateOrdersServed
	AFTER INSERT ON customer_orders
		FOR EACH ROW
			UPDATE staff
            SET orders_served = orders_served + 1
            WHERE staff.staff_id = NEW.staff_id
;
INSERT INTO customer_orders VALUES
(21, 1, 10.98),
(22, 2, 5.99),
(23, 2, 7.99),
(24, 2, 12.97);