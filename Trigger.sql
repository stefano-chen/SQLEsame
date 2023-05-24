
DROP TRIGGER if exists trg_GestioneMagazzino;

DELIMITER $$

CREATE TRIGGER trg_GestioneMagazzino
AFTER INSERT ON online_shop.contenuti FOR EACH ROW
BEGIN
    declare qnt int;
    set qnt = NEW.qntordinata;

    UPDATE prodotti SET qntDisp = qntDisp - qnt WHERE idProd = NEW.idprod;

end $$

DELIMITER ;

INSERT into contenuti(numord, idprod, qntordinata) VALUE (3,2,5);