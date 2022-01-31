create database if not exists delivery
default char set utf8
default collate utf8_general_ci;
#------------Tabelas-------------#
create table delivery.cliente(
cod_cliente int,
cpf bigint(12) unique,
nome varchar(45) not null,
sobrenome varchar(45),
telefone_celular bigint(12) not null,
endereco_bairro varchar(45),
endereco_logradouro varchar(45),
endereco_numero int(5),
primary key (cod_cliente)
)default charset = utf8;

create table delivery.cardapio_sanduiche (
cod_sanduiche smallint(6),
nome_sanduiche varchar(50),
valor_sanduiche decimal(5,2),
primary key (cod_sanduiche)
)default charset = utf8;


create table delivery.entregador(
cod_entregador int,
nome_entregador varchar(45) not null,
sobrenome varchar(45) not null, 
numero_celular bigint(12) not null,
primary key (cod_entregador)
)default charset = utf8;

create table delivery.pedido (
numero_pedido bigint(15),
quantidade_sanduiche tinyint(3) not null,
status_pedido tinyint(1) not null,
data_emissao date,
primary key (numero_pedido),
cod_entregador int,
cod_cliente int,
cod_sanduiche smallint(6),
foreign key(cod_entregador)references delivery.entregador(cod_entregador),
foreign key(cod_cliente) references delivery.cliente(cod_cliente),
foreign key(cod_sanduiche) references delivery.cardapio_sanduiche(cod_sanduiche)
)default charset = utf8;

create table delivery.cardapio_pedido(
cardapio_sanduiche smallint(6),
pedido_numero_pedido bigint(15),
foreign key(cardapio_sanduiche) references delivery.cardapio_sanduiche(cod_sanduiche),
foreign key(pedido_numero_pedido) references delivery.pedido(cod_pedido)
)default charset = utf8;

select * from delivery.pedido where status_pedido = 0;


#------------------------colocando dados----------------------------#
describe delivery.cliente;
insert into delivery.cliente value (1,11122233325,"Joselda","Marques",041988774455,"Fazendinha","Alameda da Paz", 121),
(2,22233344452,"Henrique","Azevedo",041987785445,"Alto da Gloria","Rua nossa senhora de Fatima", 1232);
select * from delivery.cliente;

describe delivery.cardapio_sanduiche;
insert into delivery.cardapio_sanduiche value (1,"Super Egg",17.50), (2,"Big Tudo", 14.90), (3,"Supermo",21.50),(4,"Big Frango",17.90);
select * from delivery.cardapio_sanduiche;

desc delivery.entregador;
insert into delivery.entregador value (1,"Pedro","Gonzaga",041986541225),(2,"Joao","Carlos",041988665544), (3,"Caio","Souza",041987451236);
select * from delivery.entregador;

desc delivery.pedido;
insert into delivery.pedido value (1,2,1,20210203,1,1,1),(2,2,1,20210204,1,2,3),(3,11,3,20210205,2,1,4),(4,1,3,20210205,2,1,4);
insert into delivery.pedido value (4,3,3,20210205,2,1,2);
select * from delivery.pedido;
select * from delivery.pedido where status_pedido = 1;

