create database ung_dung_quan_ly_khu_nghi_duong_fusama;
use ung_dung_quan_ly_khu_nghi_duong_fusama;
create table `position`(
id int auto_increment primary key,
`name` varchar(45) not null,
statuses bit default 0
);
create table education_degree(
id int auto_increment primary key,
`name` varchar(45) not null,
statuses bit default 0
);
create table division(
id int auto_increment primary key,
`name` varchar(45) not null,
statuses bit default 0
);
create table `user`(
username varchar(255) primary key,
`password` varchar(255),
statuses bit default 0
);
create table `role`(
role_id int auto_increment primary key,
role_name varchar(255),
statuses bit default 0
);
create table user_role(
role_id int not null,
username varchar(255),
primary key (role_id, username),
foreign key (role_id) references `role` (role_id),
foreign key (username) references `user` (username),
statuses bit default 0
);
create table employee(
id int auto_increment primary key,
`name` varchar(45) not null,
date_of_birthday date not null,
id_card varchar(45) not null,
salary double,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int not null,
education_degree_id int not null,
division_id int not null,
username varchar(255),
foreign key (position_id) references `position` (id),
foreign key (education_degree_id) references education_degree (id),
foreign key (division_id) references division (id),
foreign key ( username ) references `user` (username),
statuses bit default 0
);
create table customer_type(
id int auto_increment primary key,
`name` varchar(45) not null,
statuses bit default 0
);
create table customer(
id int auto_increment primary key,
`name` varchar(45) not null,
date_of_birthday date,
gender bit(1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
customer_type_id int not null,
foreign key (customer_type_id) references customer_type (id),
statuses bit default 0
);
create table rent_type(
id int auto_increment primary key,
`name` varchar(45) not null,
statuses bit default 0
);
create table facility_type(
id int auto_increment primary key,
`name` varchar(45) not null,
statuses bit default 0
);
create table facility(
id int auto_increment primary key,
`name` varchar(45) not null,
`area` int not null,
cost double not null,
max_people int not null,
standard_room varchar(45) not null,
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text,
rent_type_id int not null,
facility_type_id int not null,
foreign key (rent_type_id) references rent_type (id),
foreign key (facility_type_id) references facility_type (id),
statuses bit default 0
);
create table contract(
id int auto_increment primary key,
start_date datetime not null,
end_date datetime not null,
deposit double not null,
employee_id int not null,
customer_id int not null,
facility_id int not null,
foreign key (employee_id) references employee (id),
foreign key (customer_id) references customer (id),
foreign key (facility_id) references facility (id),
statuses bit default 0
);
create table attach_facility (
id int auto_increment primary key,
`name` varchar(45),
cost double not null,
unit varchar(10),
`status` varchar(45),
statuses bit default 0
);
create table contract_detail(
id int auto_increment primary key,
quantity int,
contract_id int not null,
attach_facility_id int not null,
foreign key (contract_id) references contract (id),
foreign key (attach_facility_id) references attach_facility (id),
statuses bit default 0
);

insert into `position` (`name`) values ('Qu???n L??'), ('Nh??n Vi??n');

insert into education_degree (`name`) values ('Trung C???p'), ('Cao ?????ng'), ('?????i H???c'), ('Sau ?????i H???c');

insert into division (`name`) values ('Sale-Marketing'), ('H??nh ch??nh'), ('Ph???c v???'), ('Qu???n l??');

insert into `user` (username, `password`) value ('nguyenvanam', '123456'), ('levanbinh', '123456'), ('hothiyen', '123456'), ('vocongtoan', '123456'), ('nguyenbinhphat', '123456');

insert into employee (id, `name`, date_of_birthday, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id, username)
values (1, 'Nguy???n V??n An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguy???n T???t Th??nh, ???? N???ng', 1, 3, 1, 'nguyenvanam'),
(2, 'L?? V??n B??nh',	'1997-04-09', '654231234',	7000000, '0934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng', 1, 2,	2, "levanbinh"),
(3, 'H??? Th??? Y???n', '1995-12-12', '999231723', 14000000,	'0412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai',	1, 3, 2, 'hothiyen'),
(4, 'V?? C??ng To???n', '1980-04-04', '123231365',	17000000, '0374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???', 1, 4, 4, 'vocongtoan'),
(5, 'Nguy???n B???nh Ph??t', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng',	2, 1, 1, 'nguyenbinhphat');

insert into customer_type (`name`) values ('Diamond'), ('Platinium'), ('Gold'), ('Silver'), ('Member');

insert into customer (`name`, date_of_birthday, gender, id_card, phone_number, email, address, customer_type_id) value
('Nguy???n Th??? H??o', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguy???n Ho??ng, ???? N???ng', 5),
('Ph???m Xu??n Di???u', '1992-08-08', 0, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Th??i Phi??n, Qu???ng Tr???', 3),
('Tr????ng ????nh Ngh???', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ??ng ??ch Khi??m, Vinh', 1),
('D????ng V??n Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 L?? L???i, ???? N???ng', 1),
('Ho??ng Tr???n Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 L?? Th??i T???, Gia Lai', 4);

insert into rent_type (`name`) values ('year'), ('month'), ('day'), ('hour');

insert into facility_type (`name`) values ('Villa'), ('House'), ('Room');

insert into facility (`name`, `area`, cost, max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id ) 
values ('Beach Front', 25000, 10000000, 10, 'vip', 'C?? h??? b??i',	500, 4, null, 4, 1),
('House Princess 01', 14000, 5000000, 7, 'vip', 'C?? th??m b???p n?????ng', null, 3, null, 2, 2),
('Room Twin 01', 5000, 1000000, 2, 'normal', 'C?? tivi', null, null,	'??n s??ng', 3, 3),
('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'C?? h??? b??i', 300, 3, null, 1, 1),
('House Princess 02', 10000, 4000000, 5, 'normal', 'C?? th??m b???p n?????ng', null, 2, null, 3, 2),
('Room Twin 02', 3000, 900000, 2, 'normal', 'C?? tivi', null, null, '??n t???i', 2, 3);

insert into attach_facility (`name`, cost, unit, `status`) 
values ('Karaoke', 10000, 'gi???' , 'ti???n nghi hi???n t???i'),
('Thu?? xe m??y', 10000, 'chi???c', 'h???ng 1 xe'),
('Thu?? xe ?????p', 20000, 'chi???c', 't???t'),
('Buffet bu???i s??ng', 15000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
('Buffet bu???i tr??a', 90000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
('Buffet bu???i t???i', 16000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');

insert into contract (start_date, end_date, deposit, employee_id, customer_id, facility_id) 
values ('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 200000, 5,	3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 100000, 2,	5, 5),
('2021-07-14', '2021-07-15', 0,	1, 2, 6),
('2021-06-01', '2021-06-03', 0, 2, 4, 6);

insert into contract_detail (quantity, contract_id, attach_facility_id) 
values (5, 2, 4), (8, 2, 5), (15, 2, 6), (1, 3, 1), (11, 3, 2), (1, 1, 3), (2, 1, 2), (2, 5, 2);

