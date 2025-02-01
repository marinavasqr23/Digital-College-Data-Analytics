CREATE TABLE aula07.funcionario
(
	id SERIAL PRIMARY KEY,
	id_supervisor INT NOT NULL,
	id_cargo INT NOT NULL,
	id_endereco INT NOT NULL,
	id_contato INT NOT NULL,
	id_contrato INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	data_nasc DATE NOT NULL,
	salario NUMERIC (18,2),
	CONSTRAINT fk_func_supervisor FOREIGN KEY (id_supervisor) REFERENCES aula07.supervisor (id),
	CONSTRAINT fk_func_cargo FOREIGN KEY (id_cargo) REFERENCES aula07.cargo (id),
	CONSTRAINT fk_func_endereco FOREIGN KEY (id_endereco) REFERENCES aula07.endereco (id),
	CONSTRAINT fk_func_contato FOREIGN KEY (id_contato) REFERENCES aula07.contato (id),
	CONSTRAINT fk_func_contrato FOREIGN KEY (id_contrato) REFERENCES aula07.contrato (id)
); -- ok

CREATE TABLE aula07.supervisor 
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
);  -- ok

CREATE TABLE aula07.cargo
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	id_depart INT NOT NULL,
	CONSTRAINT fk_depart_cargo FOREIGN KEY (id_depart) REFERENCES aula07.departamento (id)
); -- ok

CREATE TABLE aula07.departamento 
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
); -- ok
CREATE TABLE aula07.dependente
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	data_nasc DATE NOT NULL,
	id_func INT NOT NULL,
	id_parentesco INT NOT NULL,
	CONSTRAINT fk_func_dependente FOREIGN KEY (id_func) REFERENCES aula07.funcionario (id),
	CONSTRAINT fk_parentesco_dependente FOREIGN KEY (id_parentesco) REFERENCES aula07.parentesco (id)


); -- ok

CREATE TABLE aula07.parentesco
(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR (100) NOT NULL
); -- ok

CREATE TABLE aula07.projeto
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	id_depart INT NOT NULL,
	id_cliente INT NOT NULL,
	id_endereco INT NOT NULL,
	data_inicio DATE NOT NULL,
	data_prazo DATE NOT NULL,
	valor NUMERIC (18,2) NOT NULL,
	CONSTRAINT fk_projeto_depart FOREIGN KEY (id_depart) REFERENCES aula07.departamento (id),
	CONSTRAINT fk_projeto_cliente FOREIGN KEY (id_cliente) REFERENCES aula07.cliente (id),
	CONSTRAINT fk_projeto_endereco FOREIGN KEY (id_endereco) REFERENCES aula07.endereco (id)
); -- ok
CREATE TABLE func_projeto
(
	id SERIAL PRIMARY KEY,
	id_func INT NOT NULL,
	id_projeto INT NOT NULL,
	tipo_trabalho VARCHAR (100) NOT NULL,
	horas_semanais NUMERIC (18,2) NOT NULL,
	CONSTRAINT fk_funcprojeto_func FOREIGN KEY (id_func) REFERENCES aula07.funcionario (id),
	CONSTRAINT fk_funcprojeto_projeto FOREIGN KEY (id_projeto) REFERENCES aula07.projeto (id)
); -- ok

CREATE TABLE aula07.cliente
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	id_contato INT NOT NULL,
	id_endereco INT NOT NULL,
	CONSTRAINT fk_contato_cliente FOREIGN KEY (id_contato) REFERENCES aula07.contato (id),
	CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_endereco) REFERENCES aula07.endereco (id)
); -- ok


CREATE TABLE aula07.beneficio 
(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(100) NOT NULL
); -- ok
CREATE TABLE aula07.beneficio_fun
(
	id SERIAL PRIMARY KEY,
	id_beneficio INT NOT NULL,
	id_func INT NOT NULL,
	CONSTRAINT fk_funcbeneficio_beneficio FOREIGN KEY (id_beneficio) REFERENCES aula07.beneficio (id),
	CONSTRAINT fk_funcbeneficio_func FOREIGN KEY (id_func) REFERENCES aula07.funcionario (id)
); -- ok


CREATE TABLE aula07.endereco
(
	id SERIAL PRIMARY KEY,
	id_bairro INT NOT NULL,
	logradouro VARCHAR(100) NOT NULL,
	complemento VARCHAR (100),
	numero INT NOT NULL,
	cep INT NOT NULL,
	CONSTRAINT fk_bairro_endereco FOREIGN KEY (id_bairro) REFERENCES aula07.bairro (id)
); -- ok

CREATE TABLE aula07.bairro
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	id_cidade INT NOT NULL,
	CONSTRAINT fk_bairro_cidade FOREIGN KEY (id_cidade) REFERENCES aula07.cidade (id)
); -- ok

CREATE TABLE aula07.cidade
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	id_estado INT NOT NULL,
	CONSTRAINT fk_cidade_estado FOREIGN KEY (id_estado) REFERENCES aula07.estado (id)
); -- ok

CREATE TABLE aula07.estado
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR (50) NOT NULL
);  -- ok



CREATE TABLE aula07.avaliacao
(
	id SERIAL PRIMARY KEY,
	ano INT NOT NULL
); -- ok

CREATE TABLE aula07.avalia_func
(
	id SERIAL PRIMARY KEY,
	id_func INT NOT NULL,
	id_supervisor INT NOT NULL,
	id_avaliacao INT NOT NULL,
	resultado VARCHAR (200) NOT NULL,
	CONSTRAINT fk_func_avaliafunc FOREIGN KEY (id_func) REFERENCES aula07.funcionario (id),
	CONSTRAINT fk_super_avaliafun FOREIGN KEY (id_supervisor) REFERENCES aula07.supervisor (id),
	CONSTRAINT fk_avaliafunc_avalia FOREIGN KEY (id_avaliacao) REFERENCES aula07.avaliacao (id)

);  -- ok



CREATE TABLE aula07.contato 
(
	id SERIAL PRIMARY KEY,
	tipo VARCHAR (100) NOT NULL CHECK (tipo IN ('email','telefone')),
	valor VARCHAR (100) NOT NULL
); -- ok


CREATE TABLE aula07.contrato
(
	id SERIAL PRIMARY KEY,
	id_tipo INT NOT NULL,
	nomeacao VARCHAR (100) NOT NULL CHECK (nomeacao IN ('fisico','juridico')),
	valor INT NOT NULL,
	CONSTRAINT fk_contrato_tipo FOREIGN KEY (id_tipo) REFERENCES aula07.tipocontrato (id)
); -- ok

CREATE TABLE aula07.tipocontrato
(
	id SERIAL PRIMARY KEY,
	tipo VARCHAR (100) NOT NULL
); -- ok

