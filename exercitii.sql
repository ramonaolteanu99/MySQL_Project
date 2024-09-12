create database exercitii;
use exercitii;
create table owners
(
firstName varchar(25) not null,
lastName varchar(25) not null
);

alter table owners
add column age int;

alter table owners
drop column age;

desc owners;
# modify poate sa modifice proprietatile unei coloane
# !!! Daca in momentul in care executam instructiunea nu specificam toate proprietatile pe care le-am specificat la creare, ele vor fi sterse
alter table owners
modify firstName char(25) not null;
modify lastName char(25) not null;

# schimbam numele unei coloane
alter table owners change lastName ownerlastName char(25) not null;

# schimbam numele tabelei
alter table owners rename to petowner;

# va stterge tabela impreuna cu toate informatiile din ea si nu se mai poate recupera
drop table petowner;


#-------------------------------------------DML
rename table petowner to owners;
alter table owners change ownerLastName lastName char(25) not null;
alter table owners
add column dateOfBirth date;
insert into owners(firstName, lastName, dateofBirth)
values('Jim', 'Jameson', '1980-01-31'), ('Tom', 'Tomson', '1980-03-30');

# verificam rezultatele instructiunii de insert
select * from owners;

# update
update owners 
set lastName='Tinu'
where firstName='Jim';

# delete - stergerea tuturor intregistrarilor din tabela
delete from owners;

# sterge toate inregistrarile din tabela 
truncate table owners;
/* Diferenta dintre truncate si delete
- truncate are capacitatea de a numara inregistrarile pe care le sterge iar truncate sterge fara a numarar
- cu detele putem sa filtram si sa stergem doar anumite inregistrari, iar cu truncate nu putem sa facem filtrare
*/

#--------------------------DQL
select * from owners;
select firstName, lastName from owners;

insert into owners (firstName, lastName, dateOfBirth, age)
values ('Tina','Ionni','1967-09-24',55);
select * from owners
where age<55;

insert into owners (firstName, lastName, dateOfBirth, age)
values ('Cristina','Crap','1993-09-06',19), ('Ana', 'Anton', '1965-04-01', 48);
select * from owners where dateOfBirth > '1989-02-05';

select * from owners where firstName in ('Jim', 'Tom', 'Ana');
select * from owners where firstName not in ('Jim', 'Tom', 'Ana');

alter table owners add column city char(50);
update owners set city='Iasi' where firstName='Tina';
select * from owners where city is null;
select * from owners where city is not null;

# cei care nu au exact 20 de ani
select * from owners where age !=55;
select * from owners where firstName !='Tina';

select * from owners where age between 25 and 56;
select * from owners where firstName liKe 'T%';
select * from owners where firstName like '%im';
select * from owners where lastName like '%on%';
select * from owners where dateOfBirth like '1967%';
select * from owners where dateOfBirth like '196%';
select * from owners where dateOfBirth like '%04%';

insert into owners(firstName, lastName, dateofBirth,age)
values('Andrew', 'Smith', '1966-03-02',45);
select * from owners where dateOfBirth='1966';

select * from owners where firstName like 'An%' or dateOfBirth like '1966%';
select * from owners where firstName like '%ew' and (dateOfBirth like '1980%' or lastName='Anton');

# FUNCTII AGREGATE
select sum(age) from owners;
select avg(age) from owners;
select min(age) from owners;
select max(age) from owners;
select count(city) from owners;

alter table owners add column ownerid int primary key auto_increment;
alter table owners modify column ownerid int primary key auto_increment first;

create table pets(
petid int not null auto_increment,
race char(45) not null,
dateofbirth date,
ownerid int not null,
primary key(petid),
constraint fk_pet_owners foreign key(ownerid) references owners(ownerid)
);

select * from owners;
select * from pets;
insert into pets(race,dateofbirth,ownerid) 
values ('european', '2024-04-02', 3), ('american','2024-06-01', 1);
# ca sa stergem o inregistrare mai intai trebuie stearsa din tabela copil(pets
delete from pets where ownerid=1;
delete from owners where ownerid=1;

select * from  owners;
select * from pets;
select * from owners cross join pets;
select * from owners inner join pets on owners.ownerid=pets.ownerid;
select * from owners left join pets on owners.ownerid=pets.ownerid where pets.ownerid is not null;
select * from owners left join pets on owners.ownerid=pets.ownerid where pets.ownerid is null;
select * from owners right join pets on owners.ownerid=pets.ownerid where owners.ownerid is not null; 
select * from owners right join pets on owners.ownerid=pets.ownerid where owners.ownerid is null; 

