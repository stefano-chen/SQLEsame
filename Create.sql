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
    idprod int auto_increment,
    nome varchar(50) not null ,
    modello varchar(50),
    descrizione varchar(256),
    qntdisp int not null check ( qntdisp >= 0 ),
    prezzo decimal not null check ( prezzo > 0 ),
    primary key (idprod),
    unique (nome,modello)
);

create table if not exists stati(
    nome varchar(50),
    descrizione varchar(256),
    primary key (nome)
);

create table if not exists clienti(
    email varchar(50),
    password varchar(256) not null,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    telefono varchar(15) not null,
    via varchar(50),
    citta varchar(50),
    cap int,
    primary key (email),
    foreign key (via,citta,cap) references indirizzi(via,citta,cap)
);

create table if not exists ordini(
    numord int auto_increment,
    cliente varchar(50) not null ,
    dataordine datetime not null,
    stato varchar(50) not null,
    metodopag varchar(50),
    ricevutapag varchar(50),
    corriere varchar(50),
    trackcode varchar(50),
    dataritiro datetime,
    dataconsegna datetime,
    primary key (numord),
    foreign key (cliente) references clienti(email),
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
