use insurance;
create table user_details(emp_id int primary key, emp_name varchar(15),blood_group varchar(15),mobile_no bigint);
insert into user_details values(1,"varsha","B+",9381753197);
insert into user_details values(2,"jaya","A+",9648321157);
insert into user_details values(3,"kavya","B+",9876432164);
insert into user_details values(4,"kalyani","A-",9381742111);
insert into user_details values(5,"anusha","B+",8965321632); 
create table gpap(emp_id int primary key,nominee_name varchar(15),nominee_relation varchar(15),nominee_dob date, foreign key(emp_id) references user_details(emp_id) on update cascade on delete cascade);
insert into gpap values (1,"ashok","father","1970-08-12");
insert into gpap values (2,"anupama","sister","2000-08-11");
insert into gpap values (3,"karthik","father","1970-03-9");
insert into gpap values (4,"haritha","mother","1980-09-10");
insert into gpap values (5,"vinay","brother","1990-01-2");
create table dependent_details(d_id int primary key,emp_id int,category varchar(15),d_name varchar(10),d_relation varchar(10),d_dob date,foreign key(emp_id) references user_details(emp_id) on update cascade on delete cascade);
insert into dependent_details values(1,1,"parent","lavanya","mother","1975-05-03");
insert into dependent_details values(2,1,"parent","ashok","father","1985-04-28");
insert into dependent_details values(3,2,"spouse","shashank","husband","1995-04-01");
insert into dependent_details values(4,2,"children","aadya","daugther","2016-05-03");
insert into dependent_details values(5,2,"children","abhi","son","2018-02-08");
insert into dependent_details values(6,4,"parent","kavitha","mother","1975-01-01");
create table new_cycle(cycle_year year,id int primary key,provider_name varchar(15));
insert into new_cycle values(2018,1,"x");
insert into new_cycle values(2019,2,"y");
insert into new_cycle values(2020,3,"z");
insert into new_cycle values(2021,4,"x");
insert into new_cycle values(2022,5,"x");
insert into add_topup values(1,15000);
create table add_topup(cycle_id int ,amt_select bigint,topup_id int primary key,foreign key(cycle_id) references new_cycle(id));
insert into add_topup values(1,15000,1);
insert into add_topup values(1,30000,2);
insert into add_topup values(2,15000,3);
insert into add_topup values(2,30000,4);
insert into add_topup values(2,45000,5);
create table select_topup(emp_id int primary key,topup_id int,foreign key(topup_id) references add_topup(topup_id),foreign key(emp_id) references user_details(emp_id));
insert into select_topup values(1,1);
insert into select_topup values(2,1);
insert into select_topup values(3,2); 
insert into select_topup values(4,2); 
insert into select_topup values(5,2); 
create table hr(hr_id int ,hr_name varchar(10),cycle_id int,emp_id int,dep_id int,foreign key(cycle_id) references new_cycle(id),primary key(hr_id,cycle_id,emp_id,dep_id),foreign key(emp_id) references user_details(emp_id),foreign key(dep_id) references dependent_details(d_id));
insert into hr values(1,"shah",1,1,1);
insert into hr values(1,"shah",2,1,1);
insert into hr values(2,"varshini",1,2,3);
insert into hr values(2,"varshini",2,2,3);
insert into hr values(2,"varshini",2,2,1);
select * from add_topup;
select * from dependent_details;
select * from gpap;
select * from new_cycle;
select * from user_details;
select * from select_topup; 
select * from hr; 
alter table new_cycle rename to cycle;
alter table user_details rename to employee_details;








