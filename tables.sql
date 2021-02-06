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

insert into Pets (name, pet_owner_id) values ("mochi", "1")
insert into Pets (name, pet_owner_id) values ("pixie", "1")
