use online_shop;

DELIMITER $$

CREATE PROCEDURE orderByClient(IN email varchar(50))
BEGIN
    SELECT numord, dataordine, stato, metodopag
end $$

DELIMITER ;