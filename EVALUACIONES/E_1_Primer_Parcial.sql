use sakila;

create table LOG_FILM(
	tipo varchar(5),
    film_id int,
    last_value varchar(30),
    new_value varchar(30),
    trans_start TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Delimiter $$
create procedure update_log_film(in new_film_id int, new_val varchar(30))
begin
	insert into LOG_FILM(film_id, new_val)
    value(new_film_id, new_val);
end $$
Delimiter ;


delimiter $$
create trigger film_update after update on film
	for each row 
    begin
		if new.original_language_id then
			call update_log_film(new.film_id, new.original_language_id);
        end if;
    end $$
delimiter ;

alter table film add original_language varchar(15);
delimiter $$
create procedure add_language()
begin
	declare done1 int default false;
    declare id int;
    declare category_name varchar(15);
    declare actor_name varchar(15);
    declare cursor1 cursor for select film_id from film;
    declare continue handler for not found set done1 = true;
    
    open cursor1;
    read_loop: loop
		fetch cursor1 into id;
		if done1 then
			leave read_loop;
		end if;
    
		set actor_name = (select actor.last_name from actor
			join film_actor on film_actor.actor_id = actor.actor_id
			where film_id = id);
			
		set category_name = (select category.name from category
			join film_category on film_category.category_id = category.category_id
			where film_id = id);
			
		if category_name = "Documentary" then
			update film
			set original_language = "italiano"
			where film.film_id = id;
		elseif category_name = "Foreign" then
			update film
			set original_language = "japonés"
			where film.film_id = id;
			
		elseif actor_name = "SOBIESKI" then
			update film
			set original_language = "alemán"
			where film.film_id = id;
		elseif actor_name = "CHASE" then
			update film
			set original_language = "mandarín"
			where film.film_id = id;
		elseif actor_name = "OLIVIER" then
			update film
			set original_language = "francés"
			where film.film_id = id;
		
		else
			update film
			set original_language = "inglés"
			where film.film_id = id;
		end if;
	end loop;
    close cursor1;
end $$
delimiter ; 

drop procedure `sakila` . `add_language`;
call add_language();

create table gomitas(
	id integer not null generated always identity (START WITH 1 INCREMENT BY 1),
    nombre varchar(15) not null,
    precio int not null,
    inicio date not null,
    fin date not null,
    periodo business_time(inicio, fin),
    primary key (id, business_time without overlaps));
);

insert into gomitas(nombre, precio, inicio, fin) 
values ("g1", 1, '2018-1-1', '2019-1-1'),
	("g2", 1, '2018-1-1', '2019-1-1'),
    ("g3", 1, '2018-1-1', '2019-1-1'),
    ("g4", 1, '2018-1-1', '2019-1-1'),
    ("g5", 1, '2018-1-1', '2019-1-1'),
    ("g6", 1, '2018-1-1', '2019-1-1'),
    ("g7", 1, '2018-1-1', '2019-1-1'),
    ("g8", 1, '2018-1-1', '2019-1-1'),
    ("g9", 1, '2018-1-1', '2019-1-1'),
    ("g10", 1, '2018-1-1', '2019-1-1'),
    ("g11", 1, '2018-1-1', '2019-1-1'),
    ("g12", 1, '2018-1-1', '2019-1-1');

update gomitas for portion of business_time from '2018-2-1' to '2018-2-15' set precio = precio * 1.45;
update gomitas for portion of business_time from '2018-2-15' to '2018-4-25' set precio = precio * 1.45 * 1.1;
update gomitas for portion of business_time from '2018-4-25' to '2018-5-5' set precio = precio * 1.45;
update gomitas for portion of business_time from '2018-5-5' to '2018-10-25' set precio = precio * 1.45 * 1.1;
update gomitas for portion of business_time from '2018-10-25' to '2018-11-5' set precio = precio * 1.45;
update gomitas for portion of business_time from '2018-11-5' to '2019-1-1' set precio = precio * 1.45 * 1.1;

select * from gomitas;

select sum(precio)/count(*) as promedio from gomitas where nombre = "g1";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g2";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g3";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g4";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g5";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g6";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g7";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g8";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g9";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g10";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g11";
select sum(precio)/count(*) as promedio from gomitas where nombre = "g12";

select max(precio) as max_precio from gomitas where nombre = "g1";
select max(precio) as max_precio from gomitas where nombre = "g2";
select max(precio) as max_precio from gomitas where nombre = "g3";
select max(precio) as max_precio from gomitas where nombre = "g4";
select max(precio) as max_precio from gomitas where nombre = "g5";
select max(precio) as max_precio from gomitas where nombre = "g6";
select max(precio) as max_precio from gomitas where nombre = "g7";
select max(precio) as max_precio from gomitas where nombre = "g8";
select max(precio) as max_precio from gomitas where nombre = "g9";
select max(precio) as max_precio from gomitas where nombre = "g10";
select max(precio) as max_precio from gomitas where nombre = "g11";
select max(precio) as max_precio from gomitas where nombre = "g12";

select min(precio) as min_precio from gomitas where nombre = "g1";
select min(precio) as min_precio from gomitas where nombre = "g2";
select min(precio) as min_precio from gomitas where nombre = "g3";
select min(precio) as min_precio from gomitas where nombre = "g4";
select min(precio) as min_precio from gomitas where nombre = "g5";
select min(precio) as min_precio from gomitas where nombre = "g6";
select min(precio) as min_precio from gomitas where nombre = "g7";
select min(precio) as min_precio from gomitas where nombre = "g8";
select min(precio) as min_precio from gomitas where nombre = "g9";
select min(precio) as min_precio from gomitas where nombre = "g10";
select min(precio) as min_precio from gomitas where nombre = "g11";
select min(precio) as min_precio from gomitas where nombre = "g12";






