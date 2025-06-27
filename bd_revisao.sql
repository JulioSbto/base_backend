create database base_revisão_saep;

use base_revisão_saep;

create table tb_clientes(
id_cliente  int primary  key auto_increment,
nome varchar(200) not null,
email varchar(255) unique not null
);

create table tb_chamados(
 id_chamado int primary  key auto_increment,
 assunto varchar(100) not null,
 descricao text (500) not null,
 fk_id_cliente int not null,
 prioridade enum('alta','média','baixa') default 'média' not null
);

alter table tb_chamados add constraint rel_chamado_cliente
foreign key (fk_id_cliente) references tb_clientes(id_cliente);

insert into tb_clientes (nome, email) values
('José Vinícius', 'josevinicius@email.com'),
('Kamila Vitória', 'kamilavitoria@email.com'),
('Davison Cauê', 'davissonsantacruz@email.com');

insert into tb_chamados(assunto, descricao, fk_id_cliente, prioridade)
values
('Emissão de comprovante', 'Preciso de comprovante', 2, 'alta'),
('Informações', 'Rastreio do pedido camisa Sta. Cruz', 3,'Média'),
('Informações','Atraso na entrega da camisa do Sta.Cruz', 3, 'Alta'),
('Confirmação do pedido', 'Gostaria de pedir mais 2 camisas do Sport', 1, 'baixa');

create view vw_tudo AS
select * from tb_chamados inner join tb_clientes
on tb_chamados.fk_id_cliente = tb_clientes.id_cliente;