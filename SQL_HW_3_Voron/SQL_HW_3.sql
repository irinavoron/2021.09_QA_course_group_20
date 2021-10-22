--1. Создайте базу из представленной картинки.
      --У каждой таблицы должно быть поле id
      --id автоинкрементальный и является первичным ключом
	 	 
 --2. Заполните таблицы данными. Не менее 10 строк в каждой таблице

create table roles (
id serial primary key,
role_title varchar(50) not null
);

insert into roles (id, role_title)
values (default, 'General Dentist');

insert into roles (id, role_title)
values (default, 'Orthodontist');

insert into roles (id, role_title)
values (default, 'Periodontist');

insert into roles (id, role_title)
values (default, 'Dental Assistant');

insert into roles (id, role_title)
values (default, 'Dental Hygienist');

insert into roles (id, role_title)
values (default, 'Laboratory Technician');

insert into roles (id, role_title)
values (default, 'Medical receptionist');

insert into roles (id, role_title)
values (default, 'Oral and maxillofacial surgeon');

insert into roles (id, role_title)
values (default, 'Orthodontic assistant');

insert into roles (id, role_title)
values (default, 'Endodontist');

create table employees (
id serial primary key,
employee_name varchar(50) not null
);

insert into employees (id, employee_name)
values (default, 'Smith');

insert into employees (id, employee_name)
values (default, 'Johnson');

insert into employees (id, employee_name)
values (default, 'Williams');

insert into employees (id, employee_name)
values (default, 'Brown');

insert into employees (id, employee_name)
values (default, 'Jones');

insert into employees (id, employee_name)
values (default, 'Garcia');

insert into employees (id, employee_name)
values (default, 'Miller');

insert into employees (id, employee_name)
values (default, 'Davis');

insert into employees (id, employee_name)
values (default, 'Rodriguez');

insert into employees (id, employee_name)
values (default, 'Martinez');

create table employees_roles (
id serial primary key,
id_role int not null,
id_employee int not null,
foreign key (id_role)
	references roles (id),
foreign key (id_employee)
	references employees (id)
);

insert into employees_roles (id, id_role, id_employee)
values (default, 1, 10);

insert into employees_roles (id, id_role, id_employee)
values (default, 2, 9);

insert into employees_roles (id, id_role, id_employee)
values (default, 3, 8);

insert into employees_roles (id, id_role, id_employee)
values (default, 4, 7);

insert into employees_roles (id, id_role, id_employee)
values (default, 5, 6);

insert into employees_roles (id, id_role, id_employee)
values (default, 6, 5);

insert into employees_roles (id, id_role, id_employee)
values (default, 7, 4);

insert into employees_roles (id, id_role, id_employee)
values (default, 8, 3);

insert into employees_roles (id, id_role, id_employee)
values (default, 9, 2);

insert into employees_roles (id, id_role, id_employee)
values (default, 1, 1);

create table salary (
id serial primary key,
monthly_salary int not null
);

insert into salary (id, monthly_salary)
values (default, 1000);

insert into salary (id, monthly_salary)
values (default, 1100);

insert into salary (id, monthly_salary)
values (default, 1200);

insert into salary (id, monthly_salary)
values (default, 1300);

insert into salary (id, monthly_salary)
values (default, 1400);

insert into salary (id, monthly_salary)
values (default, 1500);

insert into salary (id, monthly_salary)
values (default, 500);

insert into salary (id, monthly_salary)
values (default, 800);

insert into salary (id, monthly_salary)
values (default, 900);

insert into salary (id, monthly_salary)
values (default, 2000);

create table roles_salary (
id serial primary key,
id_role int not null,
id_salary int not null,
foreign key (id_role)
	references roles (id),
foreign key (id_salary)
	references salary (id)
);

insert into roles_salary (id, id_role, id_salary)
values (default, 1, 10);

insert into roles_salary (id, id_role, id_salary)
values (default, 2, 9);

insert into roles_salary (id, id_role, id_salary)
values (default, 3, 8);

insert into roles_salary (id, id_role, id_salary)
values (default, 4, 7);

insert into roles_salary (id, id_role, id_salary)
values (default, 5, 6);

insert into roles_salary (id, id_role, id_salary)
values (default, 6, 5);

insert into roles_salary (id, id_role, id_salary)
values (default, 7, 4);

insert into roles_salary (id, id_role, id_salary)
values (default, 8, 3);

insert into roles_salary (id, id_role, id_salary)
values (default, 9, 2);

insert into roles_salary (id, id_role, id_salary)
values (default, 10, 1);

create table Service (
id serial primary key,
service_title varchar(50) not null,
price int not null
);

insert into Service (id, service_title, price)
values (default, 'Complete exams', 100);

insert into Service (id, service_title, price)
values (default, 'Dental cleanings', 200);

insert into Service (id, service_title, price)
values (default, 'Cosmetic dentistry', 500);

insert into Service (id, service_title, price)
values (default, 'Implants - placement and restoration', 1000);

insert into Service (id, service_title, price)
values (default, 'Crowns, bridges', 800);

insert into Service (id, service_title, price)
values (default, 'Implants', 10000);

insert into Service (id, service_title, price)
values (default, 'Orthodontics', 400);

insert into Service (id, service_title, price)
values (default, 'Preventive care', 200);

insert into Service (id, service_title, price)
values (default, 'Periodontal therapy', 1500);

insert into Service (id, service_title, price)
values (default, 'X-rays', 150);

create table materials (
id serial primary key,
material_title varchar(50) not null,
amount int not null,
price int not null
);

insert into materials (id, material_title, amount, price)
values (default, 'Amalgam', 1000, 50);

insert into materials (id, material_title, amount, price)
values (default, 'Composite resin', 1500, 40);

insert into materials (id, material_title, amount, price)
values (default, 'Cermets', 300, 85);

insert into materials (id, material_title, amount, price)
values (default, 'Zinc oxide eugenol', 2000, 48);

insert into materials (id, material_title, amount, price)
values (default, 'Glass ionomer', 300, 100);

insert into materials (id, material_title, amount, price)
values (default, 'Polycarboxylate cement', 700, 30);

insert into materials (id, material_title, amount, price)
values (default, 'Calcium Hydroxide', 700, 40);

insert into materials (id, material_title, amount, price)
values (default, 'Plaster of Paris', 100, 200);

insert into materials (id, material_title, amount, price)
values (default, 'Agar', 600, 130);

insert into materials (id, material_title, amount, price)
values (default, 'Zinc Phosphate cement', 600, 25);

create table claim (
id serial primary key,
service_id int not null,
employee_id int not null,
material_id int not null,
claim_date date not null,
sales_manager int not null,
foreign key (service_id)
	references Service (id),
foreign key (employee_id)
	references employees (id),
foreign key (material_id)
	references materials (id),
foreign key (sales_manager)
	references employees (id)
);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 1, 2, 3, now(), 2);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 2, 3, 4, now(), 3);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 3, 4, 5, now(), 4);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 4, 5, 6, now(), 5);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 5, 6, 7, now(), 6);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 6, 7, 8, now(), 7);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 7, 8, 9, now(), 8);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 8, 9, 3, now(), 9);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 9, 10, 1, now(), 10);

insert into claim (id, service_id, employee_id, material_id, claim_date, sales_manager)
values(default, 10, 1, 2, now(), 1);

--3. Добавить таблицу Suppliers с полями id, name

create table Suppliers (
id serial primary key,
name varchar(50) not null
);

--4. Добавить 10 строк поставщиков в таблицу Suppliers
insert into Suppliers (id, name)
values (default, 'Ortho Technology Inc');

insert into Suppliers (id, name)
values (default, 'Braintree Scientific, Inc.');

insert into Suppliers (id, name)
values (default, 'SciCan Ltd');

insert into Suppliers (id, name)
values (default, 'Pfingst & Company');

insert into Suppliers (id, name)
values (default, 'PAKISTAN SCISSORS INDUSTRIES');

insert into Suppliers (id, name)
values (default, 'Lions Dental Supply & Equipment');

insert into Suppliers (id, name)
values (default, 'Dental Planet, LLC / DuraPro Health');

insert into Suppliers (id, name)
values (default, 'Blue Chip Medical Products, Inc.');

insert into Suppliers (id, name)
values (default, 'Ted Pella, Inc');

insert into Suppliers (id, name)
values (default, 'First Choice Dental Supplies');

 --5. Обновить таблицу Materials. Добавить поле suplier_id,
 --которое связано с полем id в таблице Suppliers

alter table materials
add column supplier_id int;

alter table materials 
add foreign key (supplier_id)
	references Suppliers (id);

--6. Обновить таблицу Employees. Добавить varchar поле surname на 50 символов.

alter table employees 
add surname varchar(50);

--7. Обновить таблицу Salary. Добавить varchar поле currency на 7 символов.

alter table salary
add currency varchar(7);