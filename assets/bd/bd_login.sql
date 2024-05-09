

drop schema if exists bd_login;
create schema bd_login;
use bd_login;

create table usuarios (
	id int auto_increment primary key not null,
	nombre varchar(50),
    usuario varchar(50),
    password varchar(50)
);

drop procedure if exists registro ;
delimiter $$ 
create procedure registro(in _nombre varchar(50), in _usuario varchar(50), in _password varchar(50))
begin

insert into usuarios values (null,_nombre,_usuario, md5(_password));

end $$
delimiter ;

drop procedure if exists login ;
delimiter $$ 
create procedure login(in _usuario varchar(50), in _password varchar(50))
begin

select  * from usuarios where usuario = _usuario AND password = md5(_password) ; 

end $$
delimiter ;

call registro("Gonzalo Sanchez Alvarez", "gontu", "gontu");



