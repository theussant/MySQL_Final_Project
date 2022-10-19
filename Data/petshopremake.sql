# Criação do banco de dados.
create database petshopdsremake;

# Usando o banco de dados.
use petshopdsremake;

# Criação da tabela funcionário.
create table tb_funcionario(
id_func int auto_increment primary key not null,
nome_social_func varchar(40) not null,
nome_func varchar(40) not null,
endereco_func varchar (50) not null,
salario real not null,
cargo varchar (20) not null,
dt_admissao date not null,
dt_nasc_func date not null,
genero_func enum ('Masculino', 'Feminino', 'Outro'), 
contato_func varchar (20) not null,
email_func varchar(40) not null,
plano_saude varchar (15) not null
);

# Criação da tabela cliente.
create table tb_cliente (
id_cliente int auto_increment primary key not null,
nome_social_cliente varchar(40) not null,
nome_cliente varchar(40) not null,
email_cliente varchar(40) not null,
endereco_cliente varchar (50) not null,
dt_nasc_cliente date not null,
genero_cliente enum ('Masculino', 'Feminino', 'Outro'), 
contato_cliente varchar (20) not null
);

# Criação da tabela fornecedor.
create table tb_fornecedor(
cnpj_fornec varchar(20) primary key not null,
nome_fantasia varchar(40) not null,
email_fornec varchar (30) not null,
contato_fornec varchar (20) not null,
endereco_fornec varchar (50) not null
);

# Criação da tabela animal.
create table tb_animal(
id_animal int auto_increment primary key not null,
nome_animal varchar (20) not null,
raca varchar (20) not null,
tipo_animal varchar (20) not null,
porte enum ('Pequeno', 'Médio', 'Grande') not null,
castrado enum ('Sim', 'Não') not null,
idade_animal int not null,
genero_animal varchar(20) not null,

id_cliente int not null,
foreign key (id_cliente) references tb_cliente (id_cliente)
);

# Criação da tabela serviço.
create table tb_servico(
id_servico int auto_increment primary key not null,
nome_servico varchar (30) not null,
tipo_servico varchar (20) not null,
valor_servico real not null,
DtHrServico datetime,

id_animal int not null,
id_cliente int not null,
id_func int not null,

foreign key (id_animal) references tb_animal (id_animal),
foreign key (id_cliente) references tb_cliente (id_cliente),
foreign key (id_func) references tb_funcionario (id_func)
);

# Criação da tabela produto.
create table tb_produto(
cod_produto int primary key not null,
nome_produto varchar (30) not null,
valor_custo real not null,
valor_venda real not null,
marca_produto varchar (30) not null,
funcionalidade varchar (30) not null,
dt_fabricacao date not null,
dt_validade date not null,
qtd_minima int not null,
qtd_estocada int not null,

cnpj_fornec varchar(20) not null,
foreign key (cnpj_fornec) references tb_fornecedor (cnpj_fornec)
);

# Criação da tabela venda.
create table tb_venda(
cod_venda int auto_increment primary key not null,
dt_hr_venda datetime not null,
desconto real not null,
valor_total real not null,

id_itens_venda int not null,
id_func int not null,
foreign key (id_itens_venda) references tb_itens_venda (id_itens_venda),
foreign key (id_func) references tb_funcionario (id_func)
);

# Criação da tabela itens da venda.
create table tb_itens_venda(
id_itens_venda int auto_increment primary key not null,
qtd_vendida int not null,

cod_produto int not null,
foreign key (cod_produto) references tb_produto (cod_produto)
);

# Inserção de dados funcionário.
insert into tb_funcionario (nome_social_func, nome_func,  endereco_func, salario, cargo, dt_admissao, dt_nasc_func, genero_func, contato_func, email_func, plano_saude) values
("João", "João Ferreira", "Mussurunga", 3000.00, "Atendente", '2022-10-10', '1999-04-12', 'Masculino', "71988147925", "joaof2000@gmail.com", "Hapvida"),
("Lukinhas", "Lucas Silva", "Brotas", 2500.00, "Atendente", '2018-04-02', '2000-01-01', 'Masculino', "71932485967", "lukezeras@gmail.com", "Promédica"),
("Lari", "Larissa Vieira", "Imbuí", 2500.00, "Atendente", '2019-08-08', '2000-06-14', 'Feminino', "71987415236", "lariprincess2@gmail.com", "Unimed"),
("Grace", "George Santos", "Mussuranga", 3500.00, "Veterinario", '2021-02-20', '1995-03-09', 'Masculino', '71987452145', "gracinhapoderosa@outlook.com", "Hapvida"),
("Paty", "Patrícia Lima", "Brotas", 5000.00, "Veterinario", '2020-05-15', '1992-08-14', 'Feminino', "71974165823", "patinha2010@gmail.com", "Promédica");

# Inserção de dados cliente.
insert into tb_cliente (nome_social_cliente, nome_cliente, email_cliente, endereco_cliente, dt_nasc_cliente, genero_cliente, contato_cliente) values
("Heitor", "Heitor Santana", "heitorzinho@gmail.com", "Pituba", '2000-05-10', 'Masculino', "71996354821"),
("Leticia", "Letícia Maria", "let2020@gmail.com", "Boca do Rio", '2002-12-04', "Feminino", "71984521637"),
("Melissa", "Melissa Nogueira", "melzinha21@outlook.com", "Imbuí", '2001-06-15', "Feminino", "71954126875"),
("AyannoKoji", "Gabriel Silva", "ayannokojii@gmail.com", "Pernambués", '1998-05-27', "Masculino", "71947851268"),
("Maria", "Valéria Soares", "mary123@gmail.com", "Pituba", '2001-08-03', "Feminino", "71975412685");

# Inserção de dados fornecedor.
insert into tb_fornecedor (cnpj_fornec, nome_fantasia, email_fornec, contato_fornec, endereco_fornec) values
("94382830713978", "Fagundes Rações", "fagracoes@gmail.com", "71965874215", "Mussurunga"),
("98839923405422", "Sacramento Utilidades", "sacramentouti@gmail.com", "71987541245", "Lauro de Freitas"),
("52345476216363", "Petigree", "petigreeba@gmail.com", "71978954782", "Imbuí"),
("22355115543323", "OttoPets", "ottopetsbr@gmail.com", "71978541269", "Valéria"),
("53443421154511", "GoldenPets", "goldenpetsltda@gmail.com", "7175412896", "Barris");

# Inserção de dados animal.
insert into tb_animal (nome_animal, raca, tipo_animal, porte, castrado, idade_animal, genero_animal, id_cliente) values
("Scooby", "Dogue Alemão", "Cachorro", "Grande", "Sim", 5, "Macho", 1),
("Bidu", "Schnauzer", "Cachorro", "Pequeno", "Sim", 2, "Macho", 2),
("Pluto", "Bloodhound", "Cachorro", "Grande", "Não", 4, "Macho", 3),
("Mingau", "Angoá", "Gato", "Pequeno", "Sim", 3, "Macho", 4),
("Lore", "Persa", "Gato", "Pequeno", "Não", 1, "Femea", 4),
("Luffy", "Papagaio", "Ave", "Médio", "Não", 7, "Macho", 5);

#Inserção de dados serviço.
insert into tb_servico (tipo_servico, nome_servico, valor_servico, DtHrServico, id_animal, id_cliente, id_func) values
("Higiene", "Banho", 80.00, '2022-10-10 15:00:30', 1, 1, 3),
("Higiene", "Tosa", 70.00, '2022-10-15 16:35:27', 2, 2, 1),
("Higiene", "Banho", 80.00, '2022-10-16 17:22:10', 3, 3, 2),
("Clínico", "Check-up", 100.00, '2022-10-17 14:30:47', 4, 4, 5),
("Clínico", "Medicação", 120.00, '2022-10-18 09:25:10', 5, 5, 4);


# Inserção de dados produto.
insert into tb_produto (cod_produto, nome_produto, valor_custo, valor_venda, marca_produto, funcionalidade, dt_fabricacao, dt_validade, qtd_minima, qtd_estocada, cnpj_fornec) values
(1, "Ração", 50.00, 50, "Golden", "Alimentação", '2021-06-12', '2022-07-13', 50, 60, "52345476216363"),
(2, "Ração", 40.00, 30, "Friskies", "Alimentação", '2021-07-08', '2022-09-09', 50, 80, "94382830713978"),
(3, "Shampoo", 80.00, 20, "Furacão Pet", "Higiene", '2019-05-10', '2040-06-15', 20, 40, "22355115543323"),
(4, "Perfume", 120.00, 20, "DuraPets", "Higiente", '2019-06-12', '2030-05-20', 20, 30, "53443421154511"),
(5, "Coleira", 60.00, 20, "Clube Pet D&G", "Passeio", '2020-08-10', '2025-05-17', 10, 20, "98839923405422");

# Inserção de dados itens venda.
insert into tb_itens_venda (qtd_vendida, cod_produto) values
(5, 1),
(10, 2),
(3, 3);

# Inserção de dados da venda.
insert into tb_venda (dt_hr_venda, desconto, valor_total, id_itens_venda, id_func) values
('2022-09-11 15:10:35', 0, 250.00, 1, 1),
('2021-02-01 12:20:45', 0, 400.00, 2, 1),
('2022-01-10 11:00:05', 0, 240.00, 3, 2);

# Selects para verificação das criações das tabelas.
select * from tb_funcionario;
select * from tb_cliente;
select * from tb_fornecedor;
select * from tb_animal;
select * from tb_servico;
select * from tb_produto;
select * from tb_venda;
select * from tb_itens_venda;

# Drops para as tabelas.
SET foreign_key_checks = 0;
drop table tb_fornecedor;
drop table tb_animal;
drop table tb_servico;
drop table tb_produto;
drop table tb_cliente;
drop table tb_funcionario;
drop table tb_venda;
drop table tb_itens_venda;

# Consultas.

# Consulta para mostrar nome dos funcionários em ordem.
select * from tb_funcionario order by nome_func asc;

# Consulta para mostrar os salários dos funcionários em ordem.
select * from tb_funcionario order by salario desc;

# Consulta para mostrar nome dos animais em ordem.
select * from tb_animal order by nome_animal asc;

# Consulta para contar os gêneros dos animais.
select genero_animal, count(genero_animal) as total from tb_animal
group by tb_animal.genero_animal order by total;

# Consulta para contar quantos clientes tem por bairro.
select endereco_cliente, count(endereco_cliente) as total from tb_cliente 
group by tb_cliente.endereco_cliente order by total asc;

# Consulta para contar quantos animais tem cada cliente.
select id_cliente, count(id_cliente) as total from tb_animal 
group by tb_animal.id_cliente order by total asc;

# Consulta para contar as idades dos animais.
select idade_animal, count(*) as total from tb_animal 
group by idade_animal having count(*) > 0 order by total desc;

# Consulta para mostrar os animais de um determinado cliente.
select * from tb_animal where id_cliente = 4;

# Consulta para contar quantos produtos tem de cada tipo/nome.
select nome_produto, count(nome_produto) as total from tb_produto 
group by tb_produto.nome_produto order by total asc;

# Consulta para contar os planos de saúde dos funcionários.
select plano_saude, count(*) as total from tb_funcionario 
group by plano_saude having count(*) > 0 order by total desc;

# Inner Joins

# Inner Join para relacionar os Clientes com seus animais.
select tb_cliente.nome_cliente, tb_animal.nome_animal
from tb_cliente
inner join tb_animal on tb_cliente.id_cliente = tb_animal.id_cliente;

# Inner Join para relacionar os Fornecedores com os produtos fornecidos.
select tb_fornecedor.nome_fantasia, tb_fornecedor.contato_fornec, tb_produto.nome_produto, tb_produto.valor_custo
from tb_fornecedor
inner join tb_produto on tb_fornecedor.cnpj_fornec = tb_produto.cnpj_fornec;

# Left Inner Join para relacionar os serviços com os funcionários que o fizeram.
select nome_servico, tipo_servico, valor_servico, DtHrServico, nome_func
from tb_servico left join tb_funcionario
on tb_servico.id_func = tb_funcionario.id_func;

# Trigger para controle de estoque.
DELIMITER $
create trigger Tgr_ItensVenda_Insert after insert
on tb_itens_venda
for each row
begin
	update tb_produto set qtd_estocada = qtd_estocada - new.qtd_vendida
where cod_produto = new.cod_produto;
end$

create trigger Tgr_ItensVenda_Delete after delete
on tb_itens_venda
for each row
begin
	update tb_produto set qtd_estocada = qtd_estocada + old.qtd_vendida
where cod_produto = old.cod_produto;
end$

DELIMITER ;

# Procedures.
DELIMITER $$
create procedure pesquisar_animal(in idbusca int)
begin
select nome_animal, tipo_animal, raca, id_cliente
from tb_animal
where id_animal = idbusca;
end $$
DELIMITER ;

DELIMITER $$
create procedure pesquisar_funcionario(in idbusca int)
begin
select nome_func, cargo, salario, id_func
from tb_funcionario
where id_func = idbusca;
end $$
DELIMITER ;

DELIMITER $$
create procedure pesquisar_cliente(in idbusca int)
begin
select nome_cliente, endereco_cliente, contato_cliente, id_cliente
from tb_cliente
where id_cliente = idbusca;
end $$
DELIMITER ;

DELIMITER $$
create procedure selecionar_produto(in quantidade int)
begin
select *from tb_produto
limit quantidade;
end $$
DELIMITER ;

DELIMITER $$
create procedure verificar_qtd_produto(out quantidade int)
begin
select count(*) into quantidade from tb_produto;
end $$
DELIMITER ;

# Calls.
call pesquisar_animal(2);
call pesquisar_cliente(2);
call pesquisar_funcionario(3);
call selecionar_produto(3);
call verificar_qtd_produto(@total);
select @total;

# Views.
create view v as select qtd_vendida, valor_venda, qtd_vendida*valor_venda as Total from tb_itens_venda, tb_produto;
select * from v;