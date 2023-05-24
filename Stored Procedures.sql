use online_shop;

DROP PROCEDURE if exists allOrdersByAccount;

DELIMITER $$

CREATE PROCEDURE allOrdersByAccount(IN idAccount int)
BEGIN
    SELECT numord,dataordine,stato,corriere,trackcode,dataconsegna
    from ordini where account = idAccount
    order by numord DESC;
end $$

DELIMITER ;

set @idAccount = 1;

Call allOrdersByAccount(@idAccount);


DROP PROCEDURE if exists allOrdersByStatus;

DELIMITER $$

CREATE PROCEDURE allOrdersByStatus(IN status varchar(50))
BEGIN
    SELECT numord, dataordine, corriere, trackcode, email,nome,cognome,telefono,via,citta,cap
    from ordini o inner join accounts a on o.account = a.idAccount
        inner join clienti c on a.cliente = c.numCliente
    where stato = status;
end $$

DELIMITER ;

set @status = 'Elaborazione';

Call allOrdersByStatus(@status);


DROP PROCEDURE if exists orderDetail;

DELIMITER $$

CREATE PROCEDURE orderDetail(IN numeroOrd int, OUT totale decimal(10,2))
BEGIN

    SELECT sum(qntordinata * prezzo) into totale from contenuti c inner join prodotti p on c.idprod = p.idProd
    group by numOrd having numOrd = numeroOrd;

    SELECT  nome,modello,qntordinata,prezzo
    from contenuti c inner join prodotti p on c.idprod = p.idProd
    where numord = numeroOrd;
end $$

DELIMITER ;

set @numeroOrd = 1;

set @result = 0;

Call orderDetail(@numeroOrd,@result);

select @result;

DROP PROCEDURE if exists addProduct;

DELIMITER $$

CREATE PROCEDURE addProduct(IN name varchar(50), IN model varchar(50), IN descr varchar(256),
                            IN qnt int, IN prz decimal(10,2))
BEGIN
    declare x int;
    select count(nome) into x from prodotti p where p.nome = name AND p.modello = model;
    IF (x > 0) THEN
        UPDATE prodotti p SET qntDisp = qntDisp + qnt where p.nome = name and p.modello = model;
    ELSE
        INSERT INTO prodotti(nome, modello, descrizione, qntDisp, prezzo) VALUE (name,model,descr,qnt,prz);
    end if;
end $$

DELIMITER ;

call addProduct('ASUS TUF','24FE23','',2,100);