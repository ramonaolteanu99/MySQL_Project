
## Database Project for **Library database**

# Heading level 1
The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: Biblioteca database

Tools used: MySQL Workbench

Database description: The purpose of the library database is to collect and store information about about the number of exemplary available for each book, the publishing house where the books are published and year of publication. This database keeps track of the loans made by each reader, as it is very important to know when a book was borrowed or to track the stock available for each book. Also, the database shows the division of each aisle by book category.

    Database Schema

    You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.

    The tables are connected in the following way:
        **carti** is connected with **fisa_imprumut** through a **Many-to-many** relationship which was implemented through **carti.cod_carte_** as a primary key and **fisa_imprumut.cod_carte** as a foreign key
        **editura** is connected with **carti** through a **Many-to-One** relationship which was implemented through **editura.cod_editura_cheie_primara** as a primary key and **carti.cod_editura_carte_cheie_secundara** as a foreign key
        **** is connected with **nume tabela 6** through a **tip relatie** relationship which was implemented through **nume_tabela.nume_coloana_cheie_primara** as a primary key and **nume_tabela.nume_coloana_cheie_secundara** as a foreign key
        ...........
        **nume tabela n** is connected with **nume tabela n+1** through a **tip relatie** relationship which was implemented through **nume_tabela.nume_coloana_cheie_primara** as a primary key and **nume_tabela.nume_coloana_cheie_secundara** as a foreign key

    Database Queries

DDL (Data Definition Language)

The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)

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

create table carti_fise
(
id int not null primary key auto_increment,
id_carte int not null,
id_fisa int not null
);

Now I will describe as an example one of the created tables.
Book table description
- cod_carte, which is the primary key in the table (is a unique element), is of type int (integer) and is not allowed to have null values
- denumire, has the data type varchar(50), a string of up to 50 characters
- author varchar(30), a string of up to 50 characters
- nr_exemplare, is of type integer
- cod_editura, is of type integer
- data_publicare, is of type date
- nr_pagini, is of type integer
- tip_coperta, has the data type varchar(15), a string of up to 15 characters
- categorie, has the data type varchar(15), a string of up to 15 characters

     After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below:
alter table carti change cod_editura cod_editura_carte int;
alter table carti drop column categorie;
-- Adaugare coloana id_categorie in tabela carti
alter table carti add column id_categorie int not null;
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

-- Inserare date in tabela culoar
insert into culoar (nr_locuri, categorie) values
(12, 'Beletristica'),
(5, 'Non-ficttiune'),
(9, 'Psihologie'), 
(7, 'Fictiune'), 
(4, 'Spiritualitate'), 
(10, 'Nutritie'), 
(10, 'Romane de dragoste'), 
(8, 'Thriller'), 
(10, 'Drama'),
(8, 'Comedie'), 
(10, 'Teatru'), 
(6, 'Astronomie'), 
(10, 'Istorie'), 
(4, 'Horror'), 
(8, 'Poezie'), 
(12, 'Literatura clasica'), 
(18, 'Carti politiste'), 
(8, 'Benzi desenate'),
(10, 'Religie'),
(12,'Filosofie');

-- Inserare date in tabela editura
insert into editura(nume_editura, adresa) values
('Polirom', 'Bulevardul Carol I nr. 4, etaj 4,Iasi'),
('Nemira', 'Str. Iani Buzoiani nr. 14, sector 1, Bucuresti'),
('Nemira', 'Str. Iani Buzoiani nr. 14, sector 1, Bucuresti'),
('Humanitas','Piața Presei Libere nr. 1,Bucuresti'),
('Lifestyle Publishing', 'Ion Micu nr. 23, Craiova'),
('Bookzone', 'Soseaua Berceni nr. 104, sector 4, București'),
('Bookzone', 'Soseaua Berceni nr. 104, sector 4, București'),
('Bookzone', 'Soseaua Berceni nr. 104, sector 4, București'),
('Andreas', 'Str. Petru Maior nr. 32, Sector 1, Bucuresti'),
('Midnight Books', 'Str. Doamnei nr. 27-29, Sector 3, Bucuresti'),
('AGORA', 'Str. Petre Ispirescu nr. 13, sector 2, Bucuresti'),
('AGORA', 'Str. Petre Ispirescu nr. 13, sector 2, Bucuresti'),
('Litera', 'Str. Vasile Lupu nr. 6, sector 1, Bucuresti'),
('Andreas', 'Str. Petru Maior nr. 32, Sector 1, Bucuresti'),
('Polirom', 'Bulevardul Carol I nr. 4, etaj 4,Iasi'),
('Bookzone', 'Soseaua Berceni nr. 104, sector 4, București'),
('Niculescu', 'Bulevardul Chimiei nr. 14, sector 2, Bucuresti'),
('Litera', 'Str. Vasile Lupu nr. 6, sector 1, Bucuresti'),
('Bookzone', 'Soseaua Berceni nr. 104, sector 4, București'),
('Midnight Books', 'Str. Doamnei nr. 27-29, Sector 3, Bucuresti');

-- Inserare date in tabela carti
insert into carti(denumire, autor, nr_exemplare, cod_editura_carte, data_publicare, numar_pagini, tip_coperta, id_categorie) values 
('Atomic Habits', 'James Clear', 8, 41, '2023-08-01', 334, 'Brosata', 214),
('Arta subtila a nepasarii', 'Mark Manson', 11, 42, '2021-04-01', 312, 'Brosata', 215),
('Franturi din el', 'Colleen Hoover', 4, 43, '2020-02-14', 421, 'Cartonata', 216),
('Respiratia', 'Colleen Hoover', 5, 44, '2020-02-14', 421, 'Cartonata', 217),
('Salveaza-ma', 'Mona Kasten', 3, 45, '2024-02-01', 230, 'Cartonata', 218),
('Dovezi ale vietii de apoi', 'Paul Perry', 2, 46, '2024-08-01', 340, 'Brosata', 219),
('Secretul longevitatii creierului', 'Leon Danaila', 5, 47, '2019-10-01', 300, 'Brosata', 220),
('Adevarul nu conteaza', 'Amy Tintera', 3, 48, '2018-12-30', 240, 'Cartonata', 221),
('Ochi de sarpe', 'Isabella Maldonado', 5, 49, '2023-10-01', 222, 'Brosata', 222),
('Luat prin surprindere ', 'Vi Keeland', 4, 50, '2012-10-01', 226, 'Brosata', 223),
('Maitreyi', 'Mircea Eliade', 2, 51, '2019-10-01', 300, 'Brosata', 224),
('Traume ascunse', 'Catherine Gildiner', 1, 52, '2024-11-01', 408, 'Cartonata', 225),
('Cei trei mușchetari', 'Alexandre Dumas', 7, 53, '1995-08-30', 222, 'Brosata', 226),
('Patul lui Procust', 'Camil Petrescu', 9, 54, '2001-10-01', 226, 'Brosata', 227),
('Crima din Orient Express', 'Agatha Christie', 10, 55, '2023-03-10', 285, 'Brosata', 228),
('Lorelei', 'Ionel Teodoreanu', 4, 56, '2011-03-30', 375, 'Cartonata', 229),
('Terapia copilului interior', 'Robert Jackman', 6, 57, '2018-01-20', 222, 'Brosata', 230),
('Moarte pe Nil', 'Agatha Christie', 6, 58, '2023-07-01', 290, 'Cartonata', 231),
('Enigma Otiliei', 'George Calinescu', 3, 59, '1938-04-30', 345, 'Brosata', 232),
('Douăzeci de mii de leghe sub mări', 'Jules Verne', 9, 60, '1925-01-20', 326, 'Brosata', 233);

-- Inserare date in tabela cititori
insert into cititori (cnp, nume, prenume, adresa, nr_telefon) values 
(1687939209432, 'Miron', 'Andreea', 'Str. Cuza Voda nr. 3, Iasi', 0734674512),
(1715643786534, 'Avram', 'Marta', 'Str. Ion Miculescu nr. 13, Iasi', 0724874512),
(1234467876434, 'Campean', 'Savin', 'Str. Ion Costin nr. 1, Iasi', 0744873511),
(1643256789076, 'Marcus', 'Cristina', 'Str. Lucian Blaga nr. 32, Iasi', 0765467451),
(1669086543235, 'Miron', 'Sandra', 'Str. Vasile Lupu nr. 1, Pascani', 0734864512),
(1809832116543, 'Aura', 'Marta', 'Str. Vasile Iorga nr. 3, Iasi', 0748873510),
(1234567998763, 'Miran', 'Andrei', 'Str. Canta Cuzino nr. 34, Iasi', 0778873510),
(1498765234578, 'Agaita', 'Mirel', 'Str. Cuza Voda nr. 10, Iasi', 0734674512),
(1905432675423, 'Costelic', 'Ana', 'Podu Iloaiei nr. 13, Iasi', 0774874510),
(1709087665342, 'Auroi', 'Anca', 'Str. Ion Corvin nr. 21, Voinesti', 0744873511),
(1738978553210, 'Vlaicu', 'Andreea', 'Str. Principala nr. 33, Aroneanu', 0765467451),
(1714565908975, 'Puntea', 'Mihai', 'Str. Principala, nr. 2, Barnova', 0730864512),
(1874532459087, 'Candrescu', 'Irina', 'Str. Principala nr. 30, Iasi', 0764873510),
(1709811338954, 'Candrea', 'Viorel', 'Str. Lucian Blaga nr. 35, Iasi', 0750887351),
(1778097554389, 'Mihai', 'Aurel', 'Str. Principala nr. 4, Barnova', 0740674518),
(1673421889076, 'Cauniac', 'Maria', 'Str. Anton Pan nr. 10, Pascani', 0720874513),
(1563267098754, 'Corvoc', 'Simina', 'Str. Ion Neculce nr. 14, Iasi', 0756873515),
(1983256779086, 'Sava', 'Paula', 'Str. Principala nr. 23, Cotnari', 0745467451),
(1702317889065, 'Rusu', 'Andrei', 'Str. Vasile Lupu nr. 18, Pascani', 0743864510),
(1702317889068, 'Neculai', 'Miruna', 'Str. Anton Pan nr. 9, Iasi', 0788873576);

-- Inserare date in tabela bibliotecari
insert into bibliotecari(nume_si_prenume, ID_culoar, cnp) values
('Miron Andreea', 214, 1687939209432),
('Avram Marta', 215, 1715643786534),
('Campean Savin', 216, 1234467876434),
('Marcus Cristina', 217, 1643256789076),
('Miron Sandra', 218, 1669086543235),
('Aura Marta', 219, 1809832116543),
('Miran Andrei', 220, 1234567998763),
('Agaita Mirel', 221, 1498765234578),
('Costelic Ana', 222, 1905432675423),
('Auroi Anca', 223, 1709087665342),
('Vlaicu Andreea', 224, 1738978553210),
('Puntea Mihai', 225, 1714565908975),
('Candrescu Irina', 226, 1874532459087),
('Candrea Viorel', 227, 1709811338954),
('Miha Aurel', 228, 1778097554389),
('Cauniac Maria', 229, 1673421889076),
('Corvoc Simina', 230, 1563267098754),
('Sava Paula', 231, 1983256779086),
('Rusu Andrei', 232, 1702317889065),
('Neculai Miruna', 233, 1702317889068);

-- Inserare date in tabela fisa_imprumut
insert into fisa_imprumut (cod_carte,cnp, data_imprumut, returnat) values
(41, 1687939209432, '2024-05-01', False),
(42, 1715643786534, '2024-04-23', False),
(43, 1234467876434, '2024-07-20', True),
(44, 1643256789076, '2024-05-20', True),
(45, 1669086543235, '2024-07-20', False),
(46, 1809832116543, '2024-07-28', True),
(47, 1234567998763, '2024-07-21', True),
(48, 1498765234578, '2024-07-05', False),
(49, 1905432675423, '2024-04-20', True),
(50, 1709087665342, '2024-03-20', True),
(51, 1738978553210, '2024-06-13', True),
(52, 1714565908975, '2024-05-29', False),
(53, 1874532459087, '2024-05-05', True),
(54, 1709811338954, '2024-06-30', False),
(55, 1778097554389, '2024-07-07', True),
(56, 1673421889076, '2024-08-02', False),
(57, 1563267098754, '2024-07-20', True),
(58, 1983256779086, '2024-06-20', False),
(59, 1702317889065, '2024-07-20', False),
(60, 1702317889068, '2024-07-20', True);

-- Inserarare date in tabela carti_fise
insert into carti_fise (id_carte, id_fisa) values 
(41, 201),
(42, 202),
(43, 203),
(44, 204),
(45, 205),
(46, 206),
(47, 207), 
(48, 208),
(49, 209),
(50, 210),
(51, 211),
(52, 212),
(53, 213),
(54, 214),
(55, 215),
(56, 216),
(57, 217),
(58, 218),
(59, 219),
(60, 220);
After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way:

-- Actualizarea numelui unui cititor
update cititori
set nume='Simionescu'
where prenume='Andra';

-- actualizare numar de exemplare pentru Enigma Otiliei
update carti
set nr_exemplare=10 where denumire='Enigma Otiliei';

-- Actualizarea adresei si a numarului de telefon pentru citorul Miran Andrei
update cititori set nr_telefon=0751452517 where (nume='Miran' and prenume='Andrei');
update cititori set adresa='Str. Principala nr. 12, Voinesti' where nume='Miran' and prenume='Andrei';

-- Actualizarea statusului unor carti la momentul returnarii
update fisa_imprumut set returnat=1 where cnp=1715643786534 and cnp=1643256789076;


update cititori set adresa='Str. Principala nr. 12, Voinesti' where nume='Miran' and prenume='Andrei';
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean:
-- Stergerea unor bibliotecari din tabela
delete from bibliotecari where nume_si_prenume='Rusu Andrei' and nume_si_prenume='Candrea Viorel';

        DQL (Data Query Language)

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

