drop database if exists procedure1;
create database procedure1;
use procedure1;

create table cliente(
codigo int auto_increment primary key,
nome varchar(60) not null unique,
endereco varchar(40) not null,
sexo varchar(1),
data_cadastro timestamp default current_timestamp
);

delimiter kkkkkkkkkkkkk
create procedure inserecliente(v_nome VARCHAR(60), v_endereco varchar(20), v_sexo varchar(1))
begin
	if((v_nome !='') && (v_endereco !='') && (v_sexo !='')) then
		INSERT INTO cliente (nome, endereco, sexo) values (v_nome, v_endereco, sexo);
	else
		select 'nome, endereco e sexo devem ser fornecidos para o cadastro!' as Msg;
	end if;
end kkkkkkkkkkkkk

delimiter ;

CALL inserecliente ('lucas brizola','rua bento', 'm');

CALL inserecliente ('','','m');

select * from cliente;

delimiter lucas
create procedure updatecliente(v_codigo int, v_nome varchar(60), v_endereco VARCHAR(20), v_sexo varchar(1))
begin
	if ((v_codigo > 0) && (v_codigo != '') && (v_nome != '') && (v_endereco != '') && (v_sexo != '')) then
		UPDATE cliente set nome = v_nome, endereco = v_endereco, sexo = v_sexo where codigo = v_codigo;
	else
		select 'nome e endereco devem ser fornecidos para o cadastro!' as msg;
	end if;
    end lucas
    
delimiter ;

call updatecliente(1,'lucas jacob', 'avenida bento', 'm');

call updatecliente(1,'lucas jacob', 'avenida bento', '');

select * from cliente;

delimiter bololohaha

create procedure deletecliente(v_codigo int)
BEGIN
	if((v_codigo > 0) && (v_codigo !='')) then
		DELETE FROM cliente WHERE codigo = v_codigo;
	else
		select 'id informado não consta no cadastro' as msg;
	end if;
end bololohaha

delimiter ;

call deletecliente(1);

call deletecliente('');

select * from cliente;