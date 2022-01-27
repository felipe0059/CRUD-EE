create database db_datainfo;
use db_datainfo;
create table db_usuarios(
	id int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(50) not null,
    senha varchar(30) not null
);

create table db_telefones(
	id int primary key auto_increment,
    ddd int(2) not null,
    numero varchar(9) not null,
    tipo varchar(20) not null,
    idusuario int,
    foreign key (idusuario) references db_usuarios(id)
);