DELIMITER $$
CREATE PROCEDURE count_names(IN letter varchar(1))
BEGIN
	DECLARE counter INT DEFAULT 0;
    DECLARE concat_name VARCHAR(2);
	SET concat_name = CONCAT(letter, "%");
    SELECT COUNT(customerName) INTO counter FROM customers WHERE customerName LIKE concat_name;
    SELECT counter;
END $$
DELIMITER ;

CALL count_names("O");

DROP PROCEDURE `classicmodels`.`count_names`;