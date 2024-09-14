
## Database Project for **Library database**

# Heading level 1
The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: Biblioteca database

Tools used: MySQL Workbench

Database description: The purpose of the library database is to collect and store information about about the number of exemplary available for each book, the publishing house where the books are published and year of publication. This database keeps track of the loans made by each reader, as it is very important to know when a book was borrowed or to track the stock available for each book. Also, the database shows the division of each aisle by book category.

    Database Schema

    You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.

    The tables are connected in the following way:
        **carti** is connected with **fisa_imprumut** through a **One-to-many** relationship which was implemented through **carti.cod_carte_cheie_primara** as a primary key and **fisa_imprumut.cod_carte_fisa_imprumut_ibfk_1** as a foreign key
        **editura** is connected with **carti** through a **Many-to-One** relationship which was implemented through **editura.cod_editura_cheie_primara** as a primary key and **carti.cod_editura_carte_cheie_secundara** as a foreign key
        **** is connected with **nume tabela 6** through a **tip relatie** relationship which was implemented through **nume_tabela.nume_coloana_cheie_primara** as a primary key and **nume_tabela.nume_coloana_cheie_secundara** as a foreign key
        ...........
        **nume tabela n** is connected with **nume tabela n+1** through a **tip relatie** relationship which was implemented through **nume_tabela.nume_coloana_cheie_primara** as a primary key and **nume_tabela.nume_coloana_cheie_secundara** as a foreign key

    Database Queries

        DDL (Data Definition Language)

        The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)
Inserati aici toate instructiunile de CREATE pe care le-ati scris, atat create database cat si create table

create database biblioteca;
use biblioteca;
create table carti
(
cod_Carte int not null primary key auto_increment,
denumire varchar(50),
autor varchar(30),
nr_exemplare int,
cod_editura int,
data_publicare date,
numar_pagini int,
tip_coperta varchar(15),
categorie varchar(25)
);

create table cititori
(
cnp int not null primary key,
nume varchar(15) not null,
prenume varchar(15) not null,
adresa varchar(50),
nr_telefon int not null
);

create table fisa_imprumut
(
cod_fisa int not null primary key auto_increment,
cod_carte int not null,
cnp int not null,
data_imprumut date
);

create table editura
(
cod_editura int not null primary key auto_increment,
nume_editura varchar(15),
adresa varchar(50)
);

create table bibliotecari
(
ID int not null primary key,
nume_si_prenume varchar(30),
ID_culoar int not null,
cod_fisa int not null

create table culoar
(
ID int not null primary key auto_increment,
nr_locuri int
);

Book table description
- cod_carte, which is the primary key in the table (is a unique element), is of type int (integer) and is not allowed to have null values
- denumire, has the data type varchar(50), a string of up to 50 characters
- author varchar(30), a string of up to 50 characters
- nr_exemplare, is of type integer
- cod_editura, is of type integer
data_publicare, is of type date
- nr_pagini, is of type integer
- tip_coperta, has the data type varchar(15), a string of up to 15 characters
- categorie, has the data type varchar(15), a string of up to 15 characters

     After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:
alter table carti change cod_editura cod_editura_carte int;
alter table carti drop column categorie;
alter table cititori modify cnp char(13);
alter table fisa_imprumut modify cnp char(13);
alter table bibliotecari drop column cod_fisa;
alter table bibliotecari add column cnp char(13);
alter table bibliotecari modify ID int not null auto_increment;
alter table culoar add column categorie varchar(25);
alter table editura modify nume_editura varchar(25)
alter table fisa_imprumut add column returnat bool;
alter table bibliotecari drop column cod_fisa;

  How I added foreign keys between tables:
alter table carti add foreign key(cod_editura_carte) references editura(cod_editura);
alter table fisa_imprumut add foreign key(cod_carte) references carti(cod_carte);
alter table fisa_imprumut add foreign key(cnp) references cititori(cnp);
alter table bibliotecari add foreign key(cnp) references cititori(cnp);
alter table bibliotecari add foreign key(ID_culoar) references culoar(ID);
alter table carti add foreign key(id_categorie) references culoar(ID);

  DML (Data Manipulation Language)

        In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.

        Below you can find all the insert instructions that were created in the scope of this project:

Insert data into the culoar table


        After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

        Inserati aici toate instructiunile de UPDATE pe care le-ati scris folosind filtrarile necesare astfel incat sa actualizati doar datele de care aveti nevoie
        DQL (Data Query Language)

        After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:

        Inserati aici toate instructiunile de DELETE pe care le-ati scris folosind filtrarile necesare astfel incat sa stergeti doar datele de care aveti nevoie

        In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations:

        Inserati aici toate instructiunile de SELECT pe care le-ati scris folosind filtrarile necesare astfel incat sa extrageti doar datele de care aveti nevoie Incercati sa acoperiti urmatoarele:
        - where
        - AND
        - OR
        - NOT
        - like
        - inner join
        - left join
        - OPTIONAL: right join
        - OPTIONAL: cross join
        - functii agregate
        - group by
        - having
        - OPTIONAL DAR RECOMANDAT: Subqueries - nu au fost in scopul cursului. Puteti sa consultati tutorialul asta si daca nu intelegeti ceva contactati fie trainerul, fie coordonatorul de grupa
    Conclusions

    Inserati aici o concluzie cu privire la ceea ce ati lucrat, gen lucrurile pe care le-ati invatat, lessons learned, un rezumat asupra a ceea ce ati facut si orice alta informatie care vi se pare relevanta pentru o concluzie finala asupra a ceea ce ati lucrat

