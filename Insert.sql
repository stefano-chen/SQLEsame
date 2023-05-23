use online_shop;

INSERT INTO stati VALUES ('Elaborazione','Il tuo ordine è in elaborazione'),
                         ('Pronto','Pronto per la consegna al corriere'),
                         ('Transito','Il pacco è in viaggio'),
                         ('Consegnato','Il pacco è stato consegnato'),
                         ('Annullato', 'l ordine è stato anullato');

INSERT INTO indirizzi VALUES ('Via leonardo da vinci,100', 'Udine', 33100),
                             ('Via generale antonio cantore,40', 'Pordenone', 33170),
                             ('piazza XX settembre', 'Pordenone', 33170),
                             ('Via del pordenone,69','Trieste', 34139);

INSERT INTO corrieri VALUES ('BRT','Affidabile', null),
                            ('DHL','Lento',3331529498),
                            ('GLS','Veloce', null);

INSERT INTO tags VALUES ('Monitor',''),
                        ('Tastiera',''),
                        ('Gaming','The best'),
                        ('RAM',''),
                        ('OS',''),
                        ('SSD','Veloce');

INSERT INTO metodipagamento VALUES ('PayPal','Veloce'),
                                   ('Bonifico','Lento'),
                                   ('Visa',''),
                                   ('MasterCard','');

INSERT INTO clienti VALUES
('stefano@gmail.com',sha('Pass1234'),'Stefano','Verdi','3314845515','via generale antonio cantore,40','Pordenone',33170),
('Rosso@libero.it',sha('Pass1234'),'Mario','Rossi','3314845515','via leonardo da vinci,100','Udine',33100),
('Lgb@yahoo.com',sha('Pass1234'),'Luigi','Blue','3314845515','piazza XX settembre', 'Pordenone', 33170);

INSERT INTO prodotti(nome, modello, descrizione, qntdisp, prezzo) VALUES
('ASUS TUF', '24FE23', 'Monitor da 144hz', 30, 180.99),
('Logitech Mechanical Keyboard', 'G413', 'Mechanical Keyboard Us layout', 15, 82.90),
('Windows', '11', 'The slowest Operating System', 100, 19.99);

INSERT INTO associazioni VALUES (1,'Monitor'),(1,'Gaming'),
                                (2,'Tastiera'),(2,'Gaming'),
                                (3,'OS'),(3,'SSD');

INSERT INTO ordini(cliente, dataordine, stato, metodopag, ricevutapag, corriere, trackcode, dataritiro, dataconsegna)
values ('stefano@gmail.com',curdate(),'Elaborazione','Paypal','#36648',null,null,null,null),
        ('stefano@gmail.com','2022-07-19','Consegnato','Bonifico','#8936cdu','BRT','IT9278433','2022-07-20','2022-08-01'),
        ('stefano@gmail.com','2022-05-13','Consegnato','Visa','#8rtrcdu','DHL','ITfwui78433','2022-05-20','2022-06-01'),
        ('Rosso@libero.it','2022-07-19','Consegnato','Bonifico','#8936cdu','BRT','IT9278433','2022-07-20','2022-08-01'),
        ('Rosso@Libero.it',curdate(),'Elaborazione','Paypal','#36648',null,null,null,null),
        ('Lgb@yahoo.com','2022-07-19','Consegnato','Bonifico','#8936cdu','BRT','IT9278433','2022-07-20','2022-08-01'),
        ('Lgb@yahoo.com',curdate(),'Transito','Paypal','#36648','GLS','utfdyr96',curdate(),curdate());

INSERT INTO contenuti(numord, idprod, qntordinata) VALUES
(1,1,1),(1,2,3),(1,3,1),(2,2,2),(2,1,2),(2,3,3),(3,1,1),(4,2,3),(5,1,5),(6,1,3),(7,3,2);