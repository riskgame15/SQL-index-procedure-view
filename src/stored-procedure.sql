USE classicmodels;



DELIMITER //

DROP PROCEDURE IF EXISTS findAllCustomers //

CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers WHERE customerNumber = 175;

END //

DELIMITER ;


CALL findAllCustomers();



delimiter //

DROP PROCEDURE IF EXISTS getCusByID //

CREATE PROCEDURE getCusByID (IN cusNum INT)

BEGIN

SELECT * FROM customers WHERE customerNumber = cusNum;

END //

delimiter ;


CALL getCusByID(175);



DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

SELECT COUNT(customerNumber)
INTO total		-- assign COUNT(...) to variable 'total'
FROM customers
WHERE city = in_city;

END//

DELIMITER ;


CALL GetCustomersCountByCity('lyon', @total);
SELECT @total;



DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;


SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8