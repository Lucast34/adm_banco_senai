create database dbloja;
use dbloja;


create table categoria(
	id_categoria int auto_increment not null,
    nome varchar(100),
    constraint Pk_categoria primary key(id_categoria)
);

create table produto(
	id_produto int auto_increment not null,
    nome varchar(100),
    preco float(5.2),
    id_categoria int not null,
    constraint Pk_produto primary key (id_produto),
    constraint Fk_categoria foreign key (id_categoria) references categoria(id_categoria)	
);

create table rl_pedido_produto(
	id_produto int not null,
    id_pedido int not null,
    quantidade int not null,
    constraint Pk_PedidoProduto primary key (id_produto,id_pedido),
	constraint Fk_produto foreign key (id_produto) references produto(id_produto),
    constraint Fk_pedido foreign key (id_pedido) references pedido(id_pedido)
);

create table pedido (
	id_pedido int auto_increment  not null,
    data_p date,
    total_pedido float(5.2),
    id_cliente int not null ,
	constraint Pk_pedido primary key (id_pedido),
    constraint Pk_cliente foreign key (id_cliente) references cliente(id_cliente)
);

create table cliente (
	id_cliente int auto_increment not null,
    nome varchar(200),
    limite_credito float(5.2),
    status_clie varchar(10),
    cep varchar(10),
    logadouro varchar(200),
    numero int,
    constraint Pk_cliente primary key(id_cliente)
);
	