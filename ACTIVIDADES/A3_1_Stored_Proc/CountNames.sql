DELIMITER $$
CREATE PROCEDURE count_names(IN letter varchar(2))
BEGIN
	DECLARE counter INT DEFAULT 0;
	SET letter = CONCAT(letter, "%");
    SELECT COUNT(customerName) INTO counter FROM customers WHERE customerName LIKE letter;
    SELECT counter;
END $$
DELIMITER ;

CALL count_names("O");

DROP PROCEDURE `classicmodels`.`count_names`;