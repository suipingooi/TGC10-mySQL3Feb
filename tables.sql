create table Departments (
    department_id int unsigned auto_increment primary key,
    department_name varchar(200) not null,
    department_email varchar(200) not null
 ) engine=innodb;

#pet_hospital mysql
create table PetOwners (
    pet_id int unsigned auto_increment primary key,
    fname varchar(30) not null,
    lname varchar(30) not null,
    email varchar(50) not null
) engine=innodb;

create table Medicines (
    medicine_id int unsigned auto_increment primary key,
    med_sku int not null,
    med_name varchar(50) not null,
    med_description text not null
) engine=innodb;

create table Vets (
    vet_id int unsigned auto_increment primary key,
    vet_lname varchar(30) not null,
    vet_fname varchar(30) not null,
    vet_email varchar(100) not null
) engine=innodb;

describe Vets;

select * from PetOwners;

alter table Vets add vet_office_number varchar(20) not null;

alter table Vets
    add column vet_license varchar(20) not null,
    add column vet_address varchar(100) not null,
    add column vet_operating_hours varchar(20) not null;

insert into Vets (vet_lname, vet_fname, vet_email, vet_office_number) values ("tan", "xavier", "xavier@tan.com", "12345678");

insert into PetOwners (fname, lname, email) values 
    ("kk", "kam", "kk@kam.com"),
    ("sp", "kam", "sp@kam.com"),
    ("rr", "kam", "rr@kam.com");

update PetOwners set fname="Jamie" where pet_id = 1;

update PetOwners set fname="Jamie", lname="Kam" where pet_id = 1;

alter table PetOwners rename column pet_id to pet_owner_id;

delete from PetOwners where pet_owner_id = 5;

create table Pets (
    pet_id int unsigned auto_increment primary key, 
    name varchar(50) not null, 
    pet_owner_id int unsigned not null,
    foreign key (pet_owner_id) references PetOwners(pet_owner_id)
) engine=innodb;

insert into Pets (name, pet_owner_id) values ("mochi", "1");
insert into Pets (name, pet_owner_id) values ("pixie", "1");

# 8Feb2021

create table boardgames (
    boardgame_id int unsigned auto_increment primary key,
    title varchar(200) not null,
    play_time int not null, 
    year_published int not null,
    description text not null,
    retail_price float not null
) engine=innodb;

insert into boardgames (title, play_time, year_published, description, retail_price) values
    ("Saints Petersburg", 90, 2004, "Help Czar Peter builds the grandest city ever", 30.00),
    ("Stone Age", 90, 2008, "Score the most civilization points as the headsman of your tribe", 50),
    ("Quadropolis", 60, 2015, "Build the best city by strategically placing your architect", 90);

create table salespersons (
    salesperson_id int unsigned auto_increment primary key, 
    name varchar(50) not null, 
    commission_rate float not null
) engine=innodb;

create table closed_deals (
    deal_id int unsigned auto_increment primary key,
    deal_size float not null, 
    customer_name varchar(100) not null,
    product_name varchar(100) not null,
    salesperson_id int unsigned not null,
    foreign key (salesperson_id) references salespersons(salesperson_id)
) engine=innodb;

insert into salespersons (name, commission_rate) values 
    ("Alan Tay", 0.05),
    ("Mandy Wilkes", 0.09);

insert into closed_deals (deal_size, customer_name, product_name, salesperson_id) values
    (300000, "Phua Chu Kang", "Supercomputer", 1);

insert into closed_deals (deal_size, customer_name, product_name, salesperson_id) values
    (250000, "Moses Lim", "Cashless Vending Machine", 1);

select * from salespersons join closed_deals
 ON salespersons.id=salesperson_id;

# Q5 movie database
create table movies (
    movie_id int unsigned auto_increment primary key, 
    title varchar(100) not null
) engine=innodb;

create table actors (
    actor_id int unsigned auto_increment primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    gender tinyint not null
) engine=innodb;

create table castings (
    casting_id int unsigned auto_increment primary key, 
    movie_id int unsigned not null,
    foreign key (movie_id) references movies(movie_id),
    actor_id int unsigned not null,
    foreign key (actor_id) references actors(actor_id)
) engine=innodb;

insert into movies (title) values 
    ("Lord of the Rings"),
    ("Ironman"),
    ("Avengers"),
    ("Avengers: Endgame"),
    ("Avengers: Infinity Wars");

insert into actors (first_name, last_name, gender) values 
    ("Liv", "Tyler", 1),
    ("Viggo", "Mortensen", 2),
    ("Robert J", "Downey", 2),
    ("Jeff", "Bridges", 2);

insert into castings (actor_id, movie_id) values
    (1, 7),
    (2, 7),
    (3, 8),
    (3, 9),
    (3, 10),
    (3, 11),
    (4, 8);

select * from movies join 
    castings on movies.movie_id = castings.movie_id join actors on castings.actor_id = actors.actor_id
    where movie_id = 1;

#eg
select country, payments.customerNumber, sum(amount) from 
payments join customers
	on payments.customerNumber = customers.customerNumber
where country = "USA"
group by customerNumber
having sum(amount) > 50000
order by sum(amount) desc
limit 5