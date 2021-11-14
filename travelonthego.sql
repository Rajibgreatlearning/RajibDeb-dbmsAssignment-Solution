create database TravelOnTheGo;
use TravelOnTheGo;
create table PASSENGER (
Passenger_name varchar(50), 
Category varchar(50),
Gender varchar(50),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance int,
Bus_Type varchar(50)
 );

create table Price(
Bus_Type varchar(50),
 Distance int,
 Price int
);

insert into passenger values("Sejal", "AC", "F", "Bengaluru", "Chennai", 350 ,"Sleeper");
insert into passenger values("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 700 ,"Sitting");
insert into passenger values("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600 ,"Sleeper");
insert into passenger values("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500 ,"Sleeper");
insert into passenger values("Udit", "Non-AC", "M", "Trivandrum", "panaji", 1000, "Sleeper");
insert into passenger values("Ankur", "AC", "M", "Nagpur", "Hyderabad", 500 ,"Sitting");
insert into passenger values("Hemant", "Non-AC", "M", "panaji", "Mumbai", 700, "Sleeper");
insert into passenger values("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
insert into passenger values("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

insert into price values("Sleeper", 350, 770);
insert into price values("Sleeper", 500 ,1100);
insert into price values("Sleeper", 600, 1320);
insert into price values("Sleeper" ,700 ,1540);
insert into price values("Sleeper" ,1000, 2200);
insert into price values("Sleeper" ,1200 ,2640);
insert into price values("Sleeper" ,350, 434);
insert into price values("Sitting", 500, 620);
insert into price values("Sitting" ,500, 620);
insert into price values("Sitting", 600, 744);
insert into price values("Sitting", 700, 868);
insert into price values("Sitting", 1000 ,1240);
insert into price values("Sitting", 1200 ,1488);
insert into price values("Sitting", 1500, 1860);

select distinct count(*) as totalcount,gender from passenger where distance>=600 group by gender; #question3

select min(price) as minimumprice from price where bus_type="sleeper"; #question4

select passenger_name from passenger where passenger_name like "s%"; #question5

select distinct(passenger_name),boarding_city,destination_city,price.bus_type,price.price from passenger inner join price on passenger.distance=price.distance and passenger.bus_type=price.bus_type ; #question6
#khusboo's name is missing as the combination is not present, beacuse of multiple value for same name Sejal's value is repeated with two values

select distinct(passenger_name),price.bus_type,price.price from passenger inner join price on passenger.distance=price.distance and passenger.bus_type=price.bus_type where price.distance=1000 and passenger.bus_type="sitting"; #question7

select bus_type, price from price where distance in (select distance from passenger where passenger_name="pallavi"); #Question8

select distinct(distance) from passenger order by distance desc; #Question9

select passenger_name, distance*100/sum(count(*)) as percentage from passenger group by passenger_name;#Question10

select distance, price, 
case 
    when price>1000 then 'Expensive'
    when price>500 then 'Average'
    else 'Cheap' end as category from price; #question11








