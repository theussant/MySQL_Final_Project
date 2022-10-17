# Criação do banco de dados.
create database petshopds;

# Usando o banco de dados.
use petshopds;

# Criação da tabela funcionário.
create table tb_funcionario(
id_func int auto_increment primary key not null,
nome_func varchar(40) not null,
endereco_func varchar (50) not null,
salario real not null,
cargo varchar (20) not null,
dt_admissao date not null,
dt_nasc_func date not null,
genero_func enum ('Masculino', 'Feminino', 'Outro'), 
telefone_func varchar (20) not null,
plano_saude varchar (15) not null
);

# Criação da tabela cliente.
create table tb_cliente (
id_cliente int auto_increment primary key not null,
nome_cliente varchar(40) not null,
endereco_cliente varchar (50) not null,
dt_nasc_cliente date not null,
genero_cliente enum ('Masculino', 'Feminino', 'Outro'), 
telefone_cliente varchar (20) not null
);

# Criação da tabela fornecedor.
create table tb_fornecedor(
id_fornec int auto_increment primary key not null,
nome_fornec varchar(40) not null,
endereco_fornec varchar (50) not null,
dt_nasc_fornec date not null,
cnpj_fornec varchar (20) unique not null,
telefone_fornec varchar (20) not null
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

# Criação da tabela venda.
create table tb_venda(
id_venda int auto_increment primary key not null,
dt_venda date not null,
hr_venda datetime not null,
desconto real not null,
total real not null,

id_func int not null,
foreign key (id_func) references tb_funcionario (id_func)
);

# Criação da tabela itens da venda.
create table tb_itens_venda(
cod_barra int auto_increment primary key not null,
qtd_vendida int not null,
subtotal real not null,

id_venda int not null,
foreign key (id_venda) references tb_venda (id_venda)
);

# Criação da tabela produto.
create table tb_produto(
id_produto int auto_increment primary key not null,
nome_produto varchar (30) not null,
valor_produto real not null,
marca_produto varchar (30) not null,
funcionalidade varchar (30) not null,
dt_fabricacao date not null,
dt_validade date not null,

id_fornec int not null,
cod_barra int not null,
foreign key (id_fornec) references tb_fornecedor (id_fornec),
foreign key (cod_barra) references tb_itens_venda (cod_barra)
);

# Criação da tabela serviço.
create table tb_servico(
id_servico int auto_increment primary key not null,
nome_servico varchar (30) not null,
tipo_servico varchar (20) not null,
valor_servico real not null,

id_animal int not null,
id_cliente int not null,
id_func int not null,

foreign key (id_animal) references tb_animal (id_animal),
foreign key (id_cliente) references tb_cliente (id_cliente),
foreign key (id_func) references tb_funcionario (id_func)
);

# Selects para verificação das criações das tabelas.
select * from tb_funcionario;
select * from tb_cliente;
select * from tb_animal;
select * from tb_venda;
select * from tb_itens_venda;
select * from tb_servico;
select * from tb_produto;
select * from tb_fornecedor;

# Inserção de dados funcionário.
insert into tb_funcionario (nome_func, endereco_func, salario, cargo, dt_admissao, dt_nasc_func, genero_func, telefone_func, plano_saude) values
("João Ferreira", "Mussurunga", 3000.00, "Atendente", '2022-10-10', '1999-04-12', 'Masculino', "71988147925", "Hapvida"),
("Lucas Silva", "Brotas", 2500.00, "Atendente", '2018-04-02', '2000-01-01', 'Masculino', "71932485967", "Promédica"),
("Larissa Vieira", "Imbuí", 2500.00, "Atendente", '2019-08-08', '2000-06-14', 'Feminino', "71987415236", "Unimed"),
("George Santos", "Mussuranga", 3500.00, "Auxiliar de Gerente", '2021-02-20', '1995-03-09', 'Masculino', '71987452145', "Hapvida"),
("Patrícia Lima", "Brotas", 5000.00, "Gerente", '2020-05-15', '1992-08-14', 'Feminino', "71974165823", "Promédica");

# Inserção de dados cliente.
insert into tb_cliente (nome_cliente, endereco_cliente, dt_nasc_cliente, genero_cliente, telefone_cliente) values
("Heitor Santana", "Pituba", '2000-05-10', 'Masculino', "71996354821"),
("Letícia Maria", "Boca do Rio", '2002-12-04', "Feminino", "71984521637"),
("Melissa Nogueira", "Imbuí", '2001-06-15', "Feminino", "71954126875"),
("Gabriel Silva", "Pernambués", '1998-05-27', "Masculino", "71947851268"),
("Valéria Soares", "Pituba", '2001-08-03', "Feminino", "71975412685");

# Inserção de dados fornecedor.
insert into tb_fornecedor (nome_fornec, endereco_fornec, dt_nasc_fornec, cnpj_fornec, telefone_fornec) values
("Bruno Fagundes", "Mussurunga", '1988-08-11', "14587523694125", "71965874215"),
("Vitor Sacramento", "Lauro de Freitas", '1987-05-03', "58741245874596", "71987541245"),
("Simone Vieira", "Imbuí", '1980-08-10', "75845874215693", "71978954782"),
("Otto Andrade", "Valéria", '1990-11-18', "78541245874512", "71978541269"),
("Suzana Lima", "Barris", '2000-01-17', "32145412587496", "7175412896");

# Inserção de dados animal.
insert into tb_animal (nome_animal, raca, tipo_animal, porte, castrado, idade_animal, genero_animal, id_cliente) values
("Bidu", "Beagle", "Cachorro", 'Médio', 'Sim', 2, "Macho", 1),
("Scooby-Doo", "Dogue Alemão", "Cachorro", 'Grande', 'Sim', 3, "Macho", 2),
("Haru", "Persa", "Gato", 'Médio', 'Sim', 2, "Fêmea", 3),
("Fink", "Bombaim", "Gato", 'Pequeno', 'Não', 1, "Macho", 4),
("Luffy", "Papagaio", "Ave", 'Médio', 'Não', 2, "Macho", 5),
("Dora", "Labrador", "Cachorro", 'Médio', 'Sim', 1, "Fêmea", 2);

# Inserção de dados venda.
insert into tb_venda (dt_venda, hr_venda, desconto, total, id_func) values 
('2022-08-08', '2022-08-08 15:20:37', 0, 80.00, 1),
('2022-08-08', '2022-08-08 17:45:11', 0, 50.00, 2),
('2022-08-11', '2022-08-11 08:30:43', 10, 100.00, 4),
('2022-08-12', '2022-08-12 10:00:25', 20, 160.00, 4),
('2022-08-13', '2022-08-13 15:20:37', 28, 150.00, 5);

# Inserção de dados itens da venda.
insert into tb_itens_venda (qtd_vendida, subtotal, id_venda) values
(4, 80.00, 1),
(1, 50.00, 2),
(5, 90.00, 3),
(2, 128.00, 4),
(1, 108.00, 5);

# Inserção de dados produtos.
insert into tb_produto (nome_produto, valor_produto, marca_produto, funcionalidade, dt_fabricacao, dt_validade, id_fornec, cod_barra) values
("Ração", 20.00, "Golden", "Alimentação", "2022-05-10", "2024-04-04", 1, 1),
("Coleira", 50.00, "Chalesco", "Passeio", "2020-04-10", "2032-05-13", 2, 2),
("Ração", 20.00, "PremieR", "Alimentação", "2022-05-10", "2024-06-15", 3, 3),
("Areia Granulada", 40.00, "Pipicat", "Necessidade", "2022-05-10", "2024-07-17", 4, 4),
("Caixa de Areia", 150.00, "Furacão Pet", "Necessidade", "2020-08-20", "2035-04-04", 5, 5);

# Inserção de dados serviços.
insert into tb_servico (nome_servico, tipo_servico, valor_servico, id_animal , id_cliente , id_func) values
("Banho", "Higiene", 80.00, 1, 1, 1),
("Tosa", "Higiene", 70.00, 2, 2, 2),
("Tosa", "Higiene", 70.00, 3, 3, 3),
("Medicação", "Saúde", 85.00, 4, 4, 4),
("Exames", "Saúde", 150.00, 5, 5, 5);

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
select * from tb_funcionario order by nome_func asc;
select * from tb_funcionario order by nome_func desc;

select * from tb_animal order by nome_animal asc;
select * from tb_animal order by nome_animal desc;

select genero_animal, count(genero_animal) as total from tb_animal group by tb_animal.genero_animal order by total;

select endereco_cliente, count(endereco_cliente) as total from tb_cliente group by tb_cliente.endereco_cliente order by total asc;

select id_cliente, count(id_cliente) as total from tb_animal group by tb_animal.id_cliente order by total asc;

select idade_animal, count(*) as total from tb_animal group by idade_animal having count(*) > 1 order by total asc;

select * from tb_animal where id_cliente = 2;

select nome_produto, count(nome_produto) as total from tb_produto group by tb_produto.nome_produto order by total asc;

select nome_produto, count(nome_produto) as total from tb_produto group by tb_produto.nome_produto order by total desc;

select plano_saude, count(*) as total from tb_funcionario group by plano_saude having count(*) > 1 order by total desc;