create database cinema;
# drop database cinema;
use cinema;

create table filme
(
ID int not null auto_increment,
numeFilm varchar(50) not null,
idGen int not null,
dataStart date,
dataFinal date,
durata int,
idRaiting int,
idSala int,
primary key(ID)
);

create table gen
(
ID int not null,
tipGen varchar(15)
);

# Redenumire tabela
rename table gen to genFilm;

# Modificare tip coloana
alter table genfilm
modify tipGen varchar(25);

# Redenumire coloana 
alter table genFilm
change tipGen gen varchar(25);

# structura tabela
desc genFilm;
desc filme;
select * from filme;

# stergerea unei coloane dintr-o tabela
alter table genFilm
drop column gen;

# adaugarea unei coloane
alter table genFilm
add tipGen varchar(25);

# stergeere tabela
drop table genFilm;

# stergere continutul tabelei instant, fata de delete care sterge rand cu rand
truncate table genfilm;

# setare primary key ulterior
alter table genFilm
modify ID int not null auto_increment;

create table raiting
(
ID int not null auto_increment primary key,
valoareRaiting int
);

create table sali
(
ID int auto_increment primary key,
nrLocuriTotal int,
nrLocuriDisponibile int,
VIP bool
);

# legaturi intre tabele
alter table filme 
add foreign key(idGen) references genFilm(ID);

# stergerea unei foreign key
alter table filme
drop foreign key filme_ibfk_1;

alter table filme
add foreign key(idRaiting) references raiting(ID);

alter table filme
add foreign key(idSala) references sali(ID);

create table bilete
(
ID int not null auto_increment primary key,
tipBilet varchar(10) not null,
pret double not null,
idFilm int not null,
idTipFilm int not null
);

create table tipFilm
(
ID int not null auto_increment primary key,
formatFilm varchar(5)
);

alter table bilete
add foreign key(idFilm) references filme(ID);

alter table bilete
add foreign key(idTipFilm) references tipFilm(ID);


# ------------------------------------------------------
# inseram date in tabela genFilm
insert into genFilm(tipGen) values
('Comedie'),
('Drama'),
('SF'),
('Horror'),
('Romantic'),
('Thriler'),
('Animatie'),
('Actiune'),
('Istoric');
select * from genFilm;

insert into raiting(valoareRaiting) values
(1),
(2),
(3),
(4),
(5);
select * from raiting;

insert into sali(nrLocuriTotal,nrLocuriDisponibile,VIP) values
(100,50,True),
(50,20,True),
(50,25,False),
(50,20,False);
select * from sali;

insert into filme(numeFilm,idGen,dataStart,dataFinal,durata,idRaiting,idSala) values
('Titanic',2,'2024-03-06','2024-03-31',2,5,1),
('Seven',8,'2024-03-07','2024-04-30',3,4,2),
('Las Fierbinti',1,'2024-01-10','2024-12-31',1,1,3),
('The last Kingdom',10,'2024-05-01','2024-06-30',2,4,1);
select * from filme;

insert into tipFilm(formatFilm) values
('2D'),
('3D'),
('4D');
select * from tipfilm;

insert into bilete(tipBilet,pret,idFilm,idTipFilm) values
('Normal',25.55,9,1),
('Pensionar',15,10,2),
('Student',20,11,3);
select * from bilete;

update genFilm
set tipGen='S Fiction' 
where ID=3;
select * from genFilm;

delete from genFilm
where ID=18;
select * from genFilm;

insert into filme(numeFilm,idGen,dataStart,dataFinal,durata,idRaiting,idSala) values
('Zâmbește!',6,'2024-02-10','2024-06-01',1,4,3),
('The Shining',8,'2024-04-20','2024-05-30',2,2,1);
select * from filme;

insert into bilete(tipBilet,pret,idFilm,idTipFilm) values
('VIP',50,11,3);
select * from bilete;

update bilete
set pret=40
where ID=20;
select * from bilete;

delete from genfilm
where ID=17;
select * from genfilm;

#------------------------------------DQL
select * from filme;

# afisati toate genurile de filme disponibile in cinema
select TipGen from genFilm;

# afisati valorile raiting-urilor ce pot fi atribuite unui anumit film
select valoareRaiting from raiting;

# afisati numele filmelor si perioada intre care ruleaza filmele
select numeFilm, dataStart, dataFinal from filme;

# afisati toate tipurile de bilete pentru care pretul este mai mic de 35 ron
select tipBilet, pret from bilete
where pret<35;

# afisati tipurile de bilete pentru care pretul este intre 10 si 30 de ron
select tipBilet, pret from bilete
where pret>10 and pret<30;
select tipBilet, pret from bilete
where pret between 10 and 30;

# afisati filmele care ruleaza intre 5 martie si 30 iunie
select numeFilm, dataStart, dataFinal from filme
where (dataStart between '2024-03-05' and '2024-06-30') and (dataFinal between '2024-03-05' and '2024-06-30');

select numeFilm, dataStart, dataFinal from filme
where (dataStart between '2024-03-05' and '2024-06-30') or (dataFinal between '2024-03-05' and '2024-06-30');

# afisati numarul total de filme a caror durata este de 2 ore
select count(*) from filme 
where durata=2;
select numeFilm, durata from filme
where durata=2;

# afisati numele filmelor disponibile in cinema si raiting-ul aferent
select filme.numeFilm,raiting.valoareRaiting
from filme inner join raiting
on filme.idRaiting=raiting.ID;

#afisati numele filmelor si numarul de locuri disponibile pentru salile in care ruleaza
select filme.numeFilm,sali.nrLocuriDisponibile,sali.ID
from filme inner join sali
on filme.idSala=sali.ID;

# afisati numele filmelor, genul lor si daca sala in care ruleaza este VIP sau nu
select filme.numeFilm, genfilm.tipGen, sali.VIP
from filme inner join genfilm inner join sali
on filme.idGen=genfilm.ID and filme.idSala=sali.ID;

# afisati filmele, numarul total de locuri disponibile in care ruleaza si pretul biletului
select filme.numeFilm, sali.nrLocuriTotal, bilete.pret
from filme inner join sali inner join bilete
on filme.idSala=sali.ID and bilete.idFilm=filme.ID;

# afisati filmele, numarul total de locuri disponibile in care ruleaza si pretul biletului, afisate descrescator dupa valoare pretului
select filme.numeFilm, sali.nrLocuriTotal, bilete.pret
from filme inner join sali inner join bilete
on filme.idSala=sali.ID and bilete.idFilm=filme.ID
order by bilete.pret desc;

# afisati primele doua filme cu pretul cel mai mare
select filme.numeFilm, sali.nrLocuriTotal, bilete.pret
from filme inner join sali inner join bilete
on filme.idSala=sali.ID and bilete.idFilm=filme.ID
order by bilete.pret desc
limit 2;

#EXERCITII
select * from filme;
select numeFilm,dataStart from filme;

select numeFilm,dataStart from filme
where dataStart between'2024-04-30' and'2024-08-20';




