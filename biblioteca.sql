create database biblioteca;
create table carti
(
cod_Carte int not null primary key auto_increment,
denumire varchar(50),
autor varchar(30),
nr_exemplare int,
cod_editura int,
data_publicare date,
numar_pagini int,
tip_coperta varchar(15)
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
);
alter table bibliotecari modify ID int not null auto_increment;

create table culoar
(
ID int not null primary key auto_increment,
nr_locuri int
);

alter table carti
change cod_editura cod_editura_carte int;

alter table carti add foreign key(cod_editura_carte) references editura(cod_editura);
alter table fisa_imprumut add foreign key(cod_carte) references carti(cod_carte);
alter table fisa_imprumut add foreign key(cnp) references cititori(cnp);
alter table bibliotecari add foreign key(cod_fisa) references fisa_imprumut(cod_fisa);
alter table bibliotecari add foreign key(ID_culoar) references culoar(ID);

alter table carti add column categorie varchar(25);
alter table editura modify nume_editura varchar(25);
# inserare date in tabela editura
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

# inserare date in tabela carti
insert into carti(denumire, autor, nr_exemplare, cod_editura_carte, data_publicare, numar_pagini, tip_coperta, categorie) values 
('Atomic Habits', 'James Clear', 8, 21, '2023-08-01', 334, 'Brosata', 'Non-fictiune'),
('Arta subtila a nepasarii', 'Mark Manson', 11, 22, '2021-04-01', 312, 'Brosata','Psihologie'),
('Franturi din el', 'Colleen Hoover', 4, 23, '2020-02-14', 421, 'Cartonata','Fictiune'),
('Respiratia', 'Colleen Hoover', 5, 24, '2020-02-14', 421, 'Cartonata', 'Psihologie'),
('Salveaza-ma', 'Mona Kasten', 3, 25, '2024-02-01', 230, 'Cartonata', 'Fictiune'),
('Dovezi ale vietii de apoi', 'Paul Perry', 2, 26, '2024-08-01', 340, 'Brosata', 'Spiritualitate'),
('Secretul longevitatii creierului', 'Leon Danaila', 5, 27, '2019-10-01', 300, 'Brosata', 'Nutritie'),
('Adevarul nu conteaza', 'Amy Tintera', 3, 28, '2018-12-30', 240, 'Cartonata', 'Beletristica'),
('Ochi de sarpe', 'Isabella Maldonado', 5, 29, '2023-10-01', 222, 'Brosata', 'Beletristica'),
('Luat prin surprindere ', 'Vi Keeland', 4, 30, '2012-10-01', 226, 'Brosata', 'Beletristica'),
('Maitreyi', 'Mircea Eliade', 2, 31, '2019-10-01', 300, 'Brosata', 'Romane de dragoste'),
('Traume ascunse', 'Catherine Gildiner', 1, 32, '2024-11-01', 408, 'Cartonata', 'Thriller'),
('Cei trei mușchetari', 'Alexandre Dumas', 7, 33, '1995-08-30', 222, 'Brosata', 'Aventura'),
('Patul lui Procust', 'Camil Petrescu', 9, 34, '2001-10-01', 226, 'Brosata', 'Romane de dragoste'),
('Crima din Orient Express', 'Agatha Christie', 10, 35, '2023-03-10', 285, 'Brosata', 'Romane politiste'),
('Lorelei', 'Ionel Teodoreanu', 4, 36, '2011-03-30', 375, 'Cartonata', 'Romane de dragoste'),
('Terapia copilului interior', 'Robert Jackman', 6, 37, '2018-01-20', 222, 'Brosata', 'Dezvoltare personala'),
('Moarte pe Nil', 'Agatha Christie', 6, 38, '2023-07-01', 290, 'Cartonata', 'Romane politiste'),
('Enigma Otiliei', 'George Calinescu', 3, 39, '1938-04-30', 345, 'Brosata', 'Beletristica'),
('Douăzeci de mii de leghe sub mări', 'Jules Verne', 9, 40, '1925-01-20', 326, 'Brosata', 'Aventura');
select * from carti;

insert into cititori (cnp, nume, prenume, adresa, nr_telefon) values 
(1687939209, 'Ionecu', 'Nicu', 'Str. Cuza Voda nr. 3, Iasi', 0734674512),
(1847939208, 'Canton', 'Alina', 'Str. Ion Miculescu nr. 13, Iasi', 0724874512),
(1886793920, 'Ciurea', 'Silvia', 'Str. Ion Costin nr. 1, Iasi', 0744873511),
(1677939271, 'Voicu', 'Aurel', 'Str. Lucian Blaga nr. 32, Iasi', 0765467451),
(1993939244, 'Loghin', 'Mihai', 'Str. Vasile Lupu nr. 1, Pascani', 0734864512),
(2017937290, 'Candrea', 'Simion', 'Str. Vasile Iorga nr. 3, Iasi', 0748873510),
(1777909204, 'Ursu', 'Sanda', 'Str. Canta Cuzino nr. 34, Iasi', 0778873510),
(1677939200, 'Iovu', 'Corina', 'Str. Cuza Voda nr. 10, Iasi', 0734674512),
(1807939200, 'Corvin', 'Alina', 'Podu Iloaiei nr. 13, Iasi', 0774874510),
(1896793920, 'Caucaz', 'Nina', 'Str. Ion Corvin nr. 21, Voinesti', 0744873511),
(1677939270, 'Varvar', 'Ana', 'Str. Principala nr. 33, Aroneanu', 0765467451),
(1993939200, 'Lipan', 'Mircea', 'Str. Principala, nr. 2, Barnova', 0730864512),
(2077937290, 'Frivon', 'Andra', 'Str. Principala nr. 30, Iasi', 0764873510),
(1777909202, 'Usieru', 'Sorin', 'Str. Lucian Blaga nr. 35, Iasi', 0750887351),
(1877872809, 'Sava', 'Carmen', 'Str. Principala nr. 4, Barnova', 0740674518),
(1863139299, 'Rusu', 'Alina', 'Str. Anton Pan nr. 10, Pascani', 0720874513),
(1667939212, 'Urs', 'Maria', 'Str. Ion Neculce nr. 14, Iasi', 0756873515),
(1777939201, 'Vinea', 'Mihai', 'Str. Principala nr. 23, Cotnari', 0745467451),
(1989779398, 'Lotru', 'Mioara', 'Str. Vasile Lupu nr. 18, Pascani', 0743864510),
(1677939203, 'Ignat', 'Laura', 'Str. Anton Pan nr. 9, Iasi', 0788873576);
select * from cititori;
# adaugare coloana in tabela fisa_imprumut 
alter table fisa_imprumut add column returnat bool;

# inserare date in tabela fisa_imprumut
insert into fisa_imprumut (cod_carte,cnp, data_imprumut, returnat) values
(101, 1667939212, '2024-05-01', False),
(102, 1677939200, '2024-04-23', False),
(103, 1677939203, '2024-07-20', True),
(104, 1677939270, '2024-05-20', True),
(105, 1677939271, '2024-07-20', False),
(106, 1687939209, '2024-07-28', True),
(107, 1777909202, '2024-07-21', True),
(108, 1777909204, '2024-07-05', False),
(109, 1777939201, '2024-04-20', True),
(110, 1807939200, '2024-03-20', True),
(111, 1847939209, '2024-06-13', True),
(112, 1863139299, '2024-05-29', False),
(113, 1877872809, '2024-05-05', True),
(114, 1886793920, '2024-06-30', False),
(115, 1896793920, '2024-07-07', True),
(116, 1989779398, '2024-08-02', False),
(117, 1993939200, '2024-07-20', True),
(118, 1993939244, '2024-06-20', False),
(119, 2017937290, '2024-07-20', False),
(120, 2077937290, '2024-07-20', True);
select * from bibliotecari;
insert into bibliotecari(nume_si_prenume, ID_culoar, cod_fisa) values 
('Miron Andreea', 1, 161),
('Avram Marta', 2, 162),
('Campean Savin', 3, 163),
('Marcus Cristina', 4, 164),
('Miron Sandra', 5, 165),
('Aura Marta', 6, 166),
('Miran Andrei', 7, 167),
('Agaita Mirel', 8, 168),
('Costelic Ana', 9, 169),
('Auroi Anca', 10, 170),
('Vlaicu Andreea', 11, 171),
('Puntea Mihai', 12, 172),
('Candrescu Irina', 13, 173),
('Candrea Viorel', 14, 174),
('Miha Aurel', 15, 175),
('Cauniac Maria', 16, 176),
('Corvoc Simina', 1, 177),
('Sava Paula', 2, 178),
('Rusu Andrei', 1, 179),
('Neculai Miruna', 2, 180);

insert into culoar (nr_locuri) values
(12), (5), (9), (7), (4), (10), (10), (8), (10), (5), (8), (10), (6), (10), (4), (8), (12), (18), (8), (12);

# actualizarea numelui unui cititor
update cititori
set nume='Simionescu'
where prenume='Andra';

# actualizare numar de exemplare pentru Enigma Otiliei
update carti
set nr_exemplare=10 where denumire='Enigma Otiliei';

# stergerea unui bibliotecar din tabela curenta
delete from bibliotecari where nume_si_prenume='Rusu Andrei';

# afisarea datelor pentru editura Litera
select * from editura where nume_editura='Litera';

# afisarea tuturor datelor pentru editura Corint sau pentru cea/cele care contin in nume grupul de litere 'escu'
select * from editura where nume_editura='Corint' or nume_editura like '%escu';

# afisare numele, autorului, cate exemplare sunt disponibile, data publicarii pentru cartile publicate dupa 30 decembrie 2019 si la Humanitas
select denumire, autor, nr_exemplare, data_publicare, nume_editura from carti inner join editura
on carti.cod_editura_carte=editura.cod_editura
where data_publicare > '2019-12-30' and nume_editura='Humanitas';

# afisati numele si autorul cartilor care nu sunt scrise de Mircea Eliade, Ionel Teodoreanu si Camil Petrescu
select denumire, autor from carti where autor not in ('Mircea Eliade', 'Ionel Teodoreanu', 'Camil Petrescu');

# afisarea tuturor datelor din tabela cititori care au imprumutat carti intre 1 februare 2024 si 30 mai 2024
select * from cititori left join fisa_imprumut on cititori.cnp=fisa_imprumut.cnp where data_imprumut between '2024-02-01'and '2024-05-30';

# afisati cartile, autorul si numarul de exemplare pentru care media nr de exemplare este mai mare decat nr de bucati disponibile, ordonate descrescator dupa data publicarii
select denumire, autor, nr_exemplare, data_publicare from carti where nr_exemplare > (select avg(nr_exemplare) from carti)
order by data_publicare desc;

# afisarea cartilor pentru care codul de carte este mai mic decat media nr de pagini
select denumire, cod_carte, autor from carti
where cod_carte < (select avg(numar_pagini))
group by autor;

# afisati primii 6 cititori care locuiesc in Iasi, indiferent de adresa exacta
select nume, prenume, adresa from cititori where adresa like '%Iasi' 
order by nume limit 6;

# afisati editurile care sunt din Iasi sau sunt Bookzone dar care sa aiba codul mai mic decat 30
select * from editura where cod_editura <30 and (adresa like '%IIasi' or nume_editura='Bookzone');

# returnarea cititorilor care au luat o acrte intre 1 iulie 2024 si 15 iulie 2024
select cititori.nume, cititori.prenume, fisa_imprumut.data_imprumut from cititori inner join fisa_imprumut
on cititori.cnp=fisa_imprumut.cnp
where data_imprumut between '2024-07-01' and '2024-07-15';
# afisarea cartilor care sunt de la editura Nemira, grupate dupa denumire
select carti.denumire, editura.nume_editura from carti inner join editura 
on carti.cod_editura_carte=editura.cod_editura
where nume_editura='Nemira'
group by denumire;

# Afisarea cititorilor care nu au returnat cartile imprumutate
select cititori.nume, cititori.prenume, fisa_imprumut.returnat from cititori inner join fisa_imprumut 
on cititori.cnp=fisa_imprumut.cnp
where returnat=False;













