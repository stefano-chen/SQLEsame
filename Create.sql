DROP DATABASE if exists online_shop;
create database if not exists online_shop;
use online_shop;

create table if not exists indirizzi(
    via varchar(50),
    citta varchar(50) not null,
    cap int,
    primary key (via,citta,cap)
);

create table if not exists corrieri(
    nome varchar(50),
    descrizione varchar(256),
    telefono varchar(15),
    primary key (nome)
);

create table if not exists tags(
    nome varchar(50),
    descrizione varchar(256),
    primary key (nome)
);

create table if not exists metodipagamento(
    nome varchar(50),
    descrizione varchar(256),
    primary key (nome)
);

create table if not exists prodotti(
    idProd int auto_increment,
    nome varchar(50) not null ,
    modello varchar(50),
    descrizione varchar(256),
    qntDisp int not null check ( qntDisp >= 0 ),
    prezzo decimal(10,2) not null check ( prezzo > 0 ),
    primary key (idProd)
);

create table if not exists stati(
    nome varchar(50),
    descrizione varchar(256),
    primary key (nome)
);

create table if not exists clienti(
    numCliente int auto_increment,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    telefono varchar(15) not null,
    via varchar(50),
    citta varchar(50),
    cap int,
    primary key (numCliente),
    foreign key (via,citta,cap) references indirizzi(via,citta,cap)
);

create table if not exists accounts(
    idAccount int auto_increment,
    email varchar(50) not null,
    password varchar(256) not null,
    cliente int not null,
    unique(email, password),
    primary key (idAccount),
    foreign key (cliente) references clienti(numCliente)
);

create table if not exists ordini(
    numord int auto_increment,
    account int not null ,
    dataordine date not null,
    stato varchar(50) not null,
    metodopag varchar(50),
    ricevutapag varchar(50),
    corriere varchar(50),
    trackcode varchar(50),
    dataritiro date,
    dataconsegna date,
    primary key (numord),
    foreign key (account) references accounts(idAccount),
    foreign key (stato) references stati(nome),
    foreign key (metodopag) references metodipagamento(nome),
    foreign key (corriere) references corrieri(nome)
);

create table if not exists contenuti(
    numord int,
    idprod int,
    qntordinata int not null check ( qntordinata > 0 ),
    primary key (numord,idprod),
    foreign key (numord) references ordini(numord),
    foreign key (idprod) references prodotti(idprod)
);

create table if not exists associazioni(
    idprod int,
    tag varchar(50),
    primary key (idprod,tag),
    foreign key (idprod) references prodotti(idprod),
    foreign key (tag) references tags(nome)
);
