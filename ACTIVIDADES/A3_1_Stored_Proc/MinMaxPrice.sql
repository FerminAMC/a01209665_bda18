DELIMITER $$
CREATE PROCEDURE min_max_price()
BEGIN
	DECLARE min varchar(20);
    DECLARE max varchar(20);
	SELECT min(buyPrice) INTO min FROM products;
    SELECT max(buyPrice) INTO max FROM products;
    SELECT min, max;
END $$
DELIMITER ;

CALL min_max_price;

DROP PROCEDURE `classicmodels`.`min_max_price`;