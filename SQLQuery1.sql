--создание БД--

create database AvtoProcat;
GO
use AvtoProcat;

create table Manager(
	manager_id int identity(1, 1),
	surname varchar(255),
	name varchar(255),
	last_name varchar(255),
	telephone varchar(255),
	primary key(manager_id)
);

insert into Manager(surname, name, last_name, telephone) values('Куприн', 'Иван', 'Федорович', '8 992 544 26 75');
insert into Manager(surname, name, last_name, telephone) values('Алексеев', 'Никита', 'Александрович', '8 774 552 32 32');
insert into Manager(surname, name, last_name, telephone) values('Ланских', 'Алексей', 'Дмитриевич', '8 569 654 12 12');
insert into Manager(surname, name, last_name, telephone) values('Ибрагимов', 'Илья', 'Анатольевич', '8 665 332 75 95');
insert into Manager(surname, name, last_name, telephone) values('Ильтубаев', 'Максим', 'Игоревич', '8 966 523 47 89');

create table Klient(
	klient_id int identity(1, 1),
	surname varchar(255),
	name varchar(255),
	last_name varchar(255),
	date_of_birth date,
	telephone varchar(255),
	passport varchar(255),
	car_rights varchar(255),
	primary key(klient_id)
);

insert into Klient(surname, name, last_name, date_of_birth, telephone, passport, car_rights) 
values('Иванов', 'Андрей', 'Ибрагимович', '1999-05-06', '8 999 555 6 44', '89 98 555666', '98 56 1231236');
insert into Klient(surname, name, last_name, date_of_birth, telephone, passport, car_rights) 
values('Золотырев', 'Алексей', 'Павлович', '1986-12-30', '8 996 554 23 32', '85 18 852258', '98 82 145365');
insert into Klient(surname, name, last_name, date_of_birth, telephone, passport, car_rights) 
values('Купринов', 'Артем', 'Олегович', '1976-02-23', '8 523 325 45 56', '96 69 514236', '99 15 789987');
insert into Klient(surname, name, last_name, date_of_birth, telephone, passport, car_rights) 
values('Мартынцева', 'Валерия', 'Александровна', '2001-11-01', '8 654 236 54 54', '85 25 963542', '98 71 456654');
insert into Klient(surname, name, last_name, date_of_birth, telephone, passport, car_rights) 
values('Березин', 'Максим', 'Викторович', '2003-08-15', '8 963 369 58 59', '78 87 452254', '98 52 123321');
insert into Klient(surname, name, last_name, date_of_birth, telephone, passport, car_rights) 
values('Артемьева', 'Александра', 'Валентиновна', '1970-06-16', '8 954 745 63 85', '85 58 458854', '98 32 147741');

create table Brand(
	brand_id int identity(1, 1),
	brand_name varchar(255),
	price_persentage_br int,
	primary key(brand_id)
);

insert into Brand(brand_name, price_persentage_br) 
values ('BMW', '3000');
insert into Brand(brand_name, price_persentage_br) 
values ('Mercedes', '3000');
insert into Brand(brand_name, price_persentage_br) 
values ('Lexus', '2500');
insert into Brand(brand_name, price_persentage_br) 
values ('Mazda', '2000');
insert into Brand(brand_name, price_persentage_br) 
values ('Toyota', '2500');
insert into Brand(brand_name, price_persentage_br) 
values ('Subaru', '2000');
insert into Brand(brand_name, price_persentage_br) 
values ('Nissan', '2000');
insert into Brand(brand_name, price_persentage_br) 
values ('Honda', '2000');
insert into Brand(brand_name, price_persentage_br) 
values ('Usuzu', '2000');
insert into Brand(brand_name, price_persentage_br) 
values ('Party bus', '5000');

create table Class(
	class_id int identity(1, 1),
	class_name varchar(255),
	price_persentage_cl int,
	primary key(class_id)
);

insert into Class(class_name, price_persentage_cl)
values ('A', '500');
insert into Class(class_name, price_persentage_cl)
values ('B', '750');
insert into Class(class_name, price_persentage_cl)
values ('C', '1000');
insert into Class(class_name, price_persentage_cl)
values ('D', '1250');
insert into Class(class_name, price_persentage_cl)
values ('E', '1500');
insert into Class(class_name, price_persentage_cl)
values ('F', '1750');
insert into Class(class_name, price_persentage_cl)
values ('S', '2000');
insert into Class(class_name, price_persentage_cl)
values ('J', '2000');
update Class set class_name = 'Small', price_persentage_cl = 1000
where class_id = 9;
update Class set class_name = 'Medium', price_persentage_cl = 2000
where class_id = 10;
update Class set class_name = 'Large', price_persentage_cl = 3000
where class_id = 11;

create table Groupe(
	groupe_id int identity(1, 1),
	groupe_name varchar(255),
	price_persentage_gr int,
	primary key(groupe_id)
);

insert into Groupe(groupe_name, price_persentage_gr)
values ('Car', '0');
insert into Groupe(groupe_name, price_persentage_gr)
values ('Bus', '3000');

create table Avto(
	avto_id int identity(1, 1),
	brand_id int foreign key references Brand(brand_id),
	mark varchar(255),
	class_id int foreign key references Class(class_id),
	groupe_id int foreign key references Groupe(groupe_id)
	primary key(avto_id)
);

insert into Avto(brand_id, mark, class_id, groupe_id) 
values (3, 'ES', 5, 1);
insert into Avto(brand_id, mark, class_id, groupe_id) 
values (4, 'MX-5', 7, 1);
insert into Avto(brand_id, mark, class_id, groupe_id) 
values (5, 'Camry', 5, 1);
insert into Avto(brand_id, mark, class_id, groupe_id) 
values (6, 'WRX STI 2.5T', 7, 1);
insert into Avto(brand_id, mark, class_id, groupe_id) 
values (10, 'Karobka', 11, 2);

create table Price(
	price_id int identity(1, 1),
	brand_id int foreign key references Brand(brand_id),
	class_id int foreign key references Class(class_id),
	groupe_id int foreign key references Groupe(groupe_id),
	price int,
	pledge int,
	primary key(price_id)
);

insert into Price(brand_id, class_id, groupe_id, price, pledge)
values (3, 5, 1, 5000, 10000);
insert into Price(brand_id, class_id, groupe_id, price, pledge)
values (4, 7, 1, 4000, 7000);
insert into Price(brand_id, class_id, groupe_id, price, pledge)
values (5, 5, 1, 4500, 12000);
insert into Price(brand_id, class_id, groupe_id, price, pledge)
values (6, 7, 1, 4000, 8000);
insert into Price(brand_id, class_id, groupe_id, price, pledge)
values (10, 11, 2, 20000, 100000);

create table Chek(
	check_id int identity(1, 1),
	klient_id int foreign key references Klient(klient_id),
	avto_id int foreign key references Avto(avto_id),
	manager_id int foreign key references Manager(manager_id),
	price_id int foreign key references Price(price_id),
	primary key(check_id)
);

insert into Chek(klient_id, avto_id, manager_id, price_id)
values (1, 1, 5, 1);
insert into Chek(klient_id, avto_id, manager_id, price_id)
values (2, 4, 3, 4);
insert into Chek(klient_id, avto_id, manager_id, price_id)
values (3, 3, 1, 3);
insert into Chek(klient_id, avto_id, manager_id, price_id)
values (4, 5, 2, 5);
insert into Chek(klient_id, avto_id, manager_id, price_id)
values (5, 2, 4, 2);


--выполнение запросов--

--1-- --вывести всех клиентов старше 25 лет--
select surname, name, last_name, date_of_birth from Klient
where date_of_birth < '1997-01-01';

--2-- --вывести, сколько и за какой автомобиль заплатил Купринов с учетом всех надбавок и залога.
select distinct surname, brand_name, mark, (price_persentage_br+price_persentage_cl+price_persentage_gr+price+pledge) from Klient, Avto, Chek, Price, Groupe, Class, Brand
where Avto.avto_id = Chek.avto_id
and Groupe.groupe_id = Avto.groupe_id
and Class.class_id = Avto.avto_id
and Brand.brand_id = Avto.brand_id
and Klient.klient_id = Chek.klient_id
and Chek.price_id = Price.price_id
and Klient.surname = 'Купринов';

--3-- --вывести фио арендаторов и марки машин которые они арендовали--
select surname, name, last_name, mark from Klient, Avto, Chek
where Avto.avto_id = Chek.avto_id
and Klient.klient_id = Chek.klient_id;

--4-- --вывести фамилии и номера телефонов клиентов и менеджера, которые их обслуживали--
select Klient.surname, Klient.telephone, Manager.surname, Manager.telephone from Chek, Klient, Manager
where Manager.manager_id = Chek.manager_id
and Klient.klient_id = Chek.klient_id;

--5-- --полную цену на Party Bus--
select distinct brand_name, mark, (price_persentage_br+price_persentage_cl+price_persentage_gr+price+pledge) from Klient, Avto, Chek, Price, Groupe, Class, Brand
where Avto.avto_id = Chek.avto_id
and Groupe.groupe_id = Avto.groupe_id
and Class.class_id = Avto.avto_id
and Brand.brand_id = Avto.brand_id
and Chek.price_id = Price.price_id
and brand_name = 'Party bus';

--6-- --вывести все машины класса S--
select mark, class_name, brand_name, groupe_name from Avto, Class, Brand, Groupe
where Avto.groupe_id = Groupe.groupe_id
and Avto.class_id = Class.class_id
and Avto.brand_id = Brand.brand_id
and class_name = 'S';

--7-- --вывести каждую машину и колличество залога на нее--
select distinct brand_name, mark, pledge from Avto, Class, Price, Brand
where Avto.avto_id = Price.price_id
and Avto.brand_id = Brand.brand_id;

--8-- --вывести фио менеджера который сдавал в аренду Party Bus--
select distinct surname, name, last_name from Manager, Avto, Groupe, Class, Brand, Chek
where Chek.avto_id = Avto.avto_id
and Manager.manager_id = Chek.check_id
and Brand.brand_id = Avto.brand_id
and brand_name = 'Party bus';
