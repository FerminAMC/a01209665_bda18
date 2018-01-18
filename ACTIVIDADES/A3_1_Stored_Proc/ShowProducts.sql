DELIMITER $$
CREATE PROCEDURE show_products(IN product_line VARCHAR(50))
BEGIN 
	SET product_line = CONCAT(product_line, "%");
    SELECT * FROM products WHERE productLine LIKE product_line;
END $$
DELIMITER ;

CALL show_products("M");

DROP PROCEDURE `classicmodels`.`show_products`;


