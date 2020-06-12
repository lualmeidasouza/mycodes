--DECLARA��ES B�SICAS DO SQL SERVER
sp_help		fornece  um relat�rio dos objetos de um database

sp_helpdb	fornece um relat�rio dos databases existentes (name, db_size, owner,
db_id, created, status)

sp_helptext 	lista o texto correspondente a uma stored procedure e de outros
objetos
		sp_helptext sp_help

sp_helpsql	exibe informa��es a respeito de declara��es (comandos) SQL, stored
procedures e outros t�picos
		sp_helpsql 'select'


--UMA SEQU�NCIA B�SICA DE TRABALHO


--Cria uma tabela com chave prim�ria
CREATE TABLE tabTipoProduto
(
codproduto smallint not null PRIMARY KEY,
descproduto varchar(40)
)

--Referencia esta chave como estrangeira em outra tabela
ALTER TABLE Categories ADD codproduto smallint null
   CONSTRAINT fk_codproduto foreign key references tabTipoProduto(codproduto)

CREATE DATABASE	cria um banco de dados
Ex1.:		create database testeluciana1 -- o tamanho default ao ser criado � 2
Ex2.:		create database newpubs on default = 256

Ex3.:		create database newdb on default = 50, newdata = 25	
????? 

Ex4.:		create database library on library_dev0 = 10 log on librlog_dev2 = 4


DROP DATABASE	remove um banco de dados completamente
Ex.:		drop database testelucina

CREATE TABLE 	cria uma tabela
Ex.:		create table cliente(
			cliente 	int		not null primary key,
			nome 		varchar(60)	null,
			telefone	varchar(60)	null
		)
		
INSERT INTO	insere registros numa tabela
Ex.:		insert into cliente(cliente, nome, telefone) values (1001, 'Luciana
Almeida da Silveira', '31506834')

SELECT		recupera dados de uma ou mais tabelas
Ex.:		select * from cliente

		cl�usulas:
		where		crit�rio/condi��o de sele��o de linhas 
		group by	agrupa as linhas da tabela por um determinado campo
		having		especifica uma condi��o de busca dentro de um grupo (group by)
		order by	ordena as linhas da tabela, dependendo do tamanho da tabela, 
				� prefer�vel criar um �ndice, pois � poss�vel defin�-lo como ascendente ou descendente
		compute		gera totais que aparecem com colunas de resumo adicionadas ao final do conj de resultados
 		for browse	

		select au_fname, au_name, 'Identification numer:' = au_id from authors
--usando letras ou ali�s
		ou 
		select au_fname, au_name, au_id as 'Identification numer:' from authors

update		atualiza dados j� cadastrados.
Ex.:		update cliente set telefone = '36092121' where cliente = '1001'

delete		apaga linhas de uma tabela
Ex.:		delete from cliente where cliente = '1001'

drop table	remove uma tabela completamente
Ex.:		drop table cliente


--OPERADORES ARITM�TICOS
Opera��o	Tipos de dados que podem usar esta opera��o
+ - / *		int, smallint, tinyint, numeric, decimal, float, real, money e
smallmoney
%		int, smallint e tinyint		


--MANIPULA��O N�MEROS
Fun��o			Par�metros		Exemplo
abs			numeric_expr		select abs(10.2)
acos, asin, atan, atn2	float_expr		select acos(50.564545) 
						select asin(50.564545)
						select atan(50.564545)
						select atn2(50.564545,5.5)
cos, sin, cot, tan	float_expr		select cos(10.56)
						select sin(50.564545)
						select cot(50.564545)
						select tan(50.564545)
ceiling			numeric_expr		select ceiling(12)
degrees			numeric_expr		select degrees(12)
exp			float_expr		select exp(3.5)
floor			numeric_expr		select floor(2)
log			float_expr		select log(1.5)
log10			float_expr		select log10(2.5)
pi			()			select pi() -- � fixo
power			(numeric_expr, y)	select power(10,2)
radians			(numeric_expr)		select radians(3)
rand			([seed])		select rand(10)
round			(numeric_expr, length)	select round(10.868784,2)
sign			(numeric_expr)		select sign(20.5)
sqrt			(float_expr)		select sqrt(10.4487864)


--MANIPULANDO STRINGS
FUN��O		DESCRI��O		
+		Concatena caracteres
Ex.: 		select 'luciana' + ' ' + 'almeida'

ascii		Converte um caractere para ASCII
Ex.:		select ascii('a')

char		Converte num�rico para caractere
Ex.:		select char(25)

charindex	Retorna a posi��o inicial de um conjunto de caracteres
Ex.:		select charindex('teste',1) -- neste caso retorna 0 porque
		select charindex('geral', nome) from tb_usuario  
		-- neste caso retornaria 5 porque a palavra 'geral' est� na quinta posi��o
dentro do campo nome

difference	Retorna a diferen�a entre caracteres entre duas express�es
Ex.:		select difference('17/05/2006', '29/08/2006')
		SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'),
DIFFERENCE('Blotchet-Halls', 'Greene')

left		Pega n caracteres � esquerda
Ex.: 		select left('Luciana', 3)

lower		Converte para min�sculas
Ex.:		select lower('LUCIANA')

ltrim		Limpa os espa�os � esquerda
Ex.:		select ltrim('           luciana almeida da Silveira          ')

patindex	Retorna a posi��o inicial da primeira ocorr�ncia de uma express�o
modelo espec�fica
		ou 0 se o modelo n�o foi encontrado.
Ex.:		SELECT PATINDEX('%wonderful%', notes)
		SELECT PATINDEX('geral', nome) from tb_usuario

rtrim		Limpa os espa�os � direita
Ex.:		select rtrim('           luciana almeida da Silveira          ')

right		Pega n caracteres � direita
Ex.:		select right('Luciana', 3)

reverse		Inverte a ordem de um conjunto de caracteres
Ex.:		select reverse('1234') / select reverse('hoje o dia est� sol.')

replace		Substitui um conjunto de caracteres
Ex.:		SELECT REPLACE('abcdefghicde','cde','xxx')

replicate	Replica n vezes um conjunto de caracteres
Ex.:		select replicate('Luciana', 3)

soundex		Retorna um conjunto de quatro caracteres para avaliar a similaridade
		sonora entre duas express�es
Ex.:		select soundex('luciana'), soundex('max')
		select soundex('luciana'), soundex('licin')

space		Repete n vezes espa�os em branco
Ex.:		select space(10)

str		Converte caractere num�rico para caractere texto
Ex.:		select str(10.565)

substring	Captura um trecho da string, semelhante ao Mid do VbScript	
Ex.:		select substring('Luciana Almeida da Silveira', 5, 2)

stuff		Substitui um conjunto de caracteres numa posi��o espec�fica
Ex.:		SELECT STUFF('abcdef', 2, 3, 'ijklmn')

upper		Converte para mai�sculas
Ex.:		select upper('luciana')


--MANIPULANDO DATA E TEMPO
FUN��O		DESCRI��O		
dateadd		Adiciona dia, m�s e ano a uma data
Ex.:		SELECT DATEADD(month, 1, getdate())

datediff	Calcula a diferen�a em horas
Ex.:		SELECT DATEDIFF(day,'01/01/2006 07:00',getdate())  

datename	Retorna uma string caractere que representa uma parte espec�fica da
data
Ex.:		Select datename(month, getdate()) as M�s

datepart	Retorna uma parte espec�fica da data
Ex.:		Select datepart(day, getdate())

getdate		Retorna a data atual
Ex.:		Select getdate()


--TIPOS DE DATA	ABREVIA��ES	VALORES ACEITOS
year		yy		1752-9999
quarter		qq		1-4
mont		mm		1-12
day of year	dy		1-366
day		dd		1-31
week		wk		0-51
weekday		dw		1-7 (1 � domingo)
hour		hh		0-23
minute		mi		0-59
second		ss		0-59
millisecond	ms		0-999


--FUN��ES DE SISTEMA
coalesce(express�o 1, express�o 2,...)			
Retorna o valor da primeira express�o que n�o � nula.
Ex.:

CREATE TABLE wages
(
   emp_id      tinyint    identity,
   hourly_wage   decimal   NULL,
   salary      decimal    NULL,
   commission   decimal   NULL,
   num_sales   tinyint   NULL
)
GO

--INSERT wages VALUES(10.00, NULL, NULL, NULL)
--INSERT wages VALUES(20.00, NULL, NULL, NULL)
--INSERT wages VALUES(30.00, NULL, NULL, NULL)
--INSERT wages VALUES(40.00, NULL, NULL, NULL)
--INSERT wages VALUES(NULL, 10000.00, NULL, NULL)
--INSERT wages VALUES(NULL, 20000.00, NULL, NULL)
--INSERT wages VALUES(NULL, 30000.00, NULL, NULL)
--INSERT wages VALUES(NULL, 40000.00, NULL, NULL)
--INSERT wages VALUES(NULL, NULL, 15000, 3)
--INSERT wages VALUES(NULL, NULL, 25000, 2)
--INSERT wages VALUES(NULL, NULL, 20000, 6)
--INSERT wages VALUES(NULL, NULL, 14000, 4)
--GO

SELECT cast(coalesce(hourly_wage * 40 * 52, 
   salary, 
   commission * num_sales) AS money) AS 'Total Salary' 
FROM wages


col_name(tabela_id, coluna_id)	
Retorna o nome da coluna.
Ex.:
select col_name(OBJECT_ID('pe_tb_colaborador'), 1)


col_length(tabela, coluna)	
Retorna o tamanho do tipo de dado da coluna.
Ex.:
select col_length('PE_TB_COLABORADOR', 'ID_COLABOR')


datalength(express�o)	
Retorna o tamanho da express�o.
Ex.:
print datalength('LUCIANA')


db_id(banco)	
Retorna o id do banco. O argumento � opcional.
Ex.: 
print db_id('PREMIO_ESTAG')


db_name(banco_id)	
Retorna o nome do banco. O argumento � opcional.
Ex.:
print db_name(5)


getansinull(banco)	
Retorna o default de nulabilidade para o banco. O argumento � opcional.
Ex.:
print getansinull()


host_id()		
Retorna o ID do equipamento cliente.
Ex.:
print host_id()


host_name()		
Retorna o nome do equipamento cliente.
Ex.:
print host_name()


ident_incr(tabela)	
Retorna o incremento especificado para colunas do tipo identidade.
Ex.:
--


ident_seed(tabela)	
Retorna o valor inicial especificado para colunas do tipo identidade.
Ex.:
--

index_col(tabela, �ndice_id, chave_id)	
Retorna o nome da coluna que participa do �ndice.
Ex.:
print index_col()


isdate(vari�vel ou coluna)	
Retorna 1 se o argumento cadeia de caracteres possui uma data v�lida. Retorna 0
caso contr�rio.
Ex.:
print isdate('2006-11-14 00:00:00.000')


isnull(express�o, valor)	
Retorna a express�o, ou se ela for nulo, o valor.
Ex.:
print isnull('Luciana', 1)


isnumeric(vari�vel ou coluna)	
Retorna 1 se o argumento cadeia de caracteres possui um valor num�rico v�lido.
Retorna 0 caso contr�rio.
Ex.:
select re from empregados where re in (select re from empregados where
isnumeric(re) = 1)
--neste exemplo retorna somente os registros cujo campo re est� preenchido com
n�meros


nullif(express�o 1, express�o 2)	
Retorna nulo se as express�es forem equivalentes, sen�o retorna a primeira
express�o.
select nullif('Luciana', 'Almeida')



object_id(objeto)	
Retorna a identifica��o do objeto.
Ex.:
select object_id()
--


object_name(objeto_id)	
Retorna o nome do objeto.
Ex.:
select object_name()
--


stats_date(tabela_id, indice_id)	
Retorna a data em que as estat�sticas do �ndice foram atualizadas.
Ex.:
--



suser_id(servidor)	
Retorna o id do usu�rio no servidor. O argumento � opcional.
Ex.:
--




suser_name(usu�irio_id)	
Retorna o nome do usu�rio no servidor. O argumento � opcional.
Ex.:
--




user_id(usu�rio)	
Retorna o id do usu�rio. O argumento � opcional.
Ex.:
--





user_name(usu�irio_id)	
Retorna o nome do usu�rio. O argumento � opcional.
Ex.:
--



--CONVERS�O DE DADOS
convert(datatype[(length)], expression[,style])

com sec.	sec.	standard	formato de sa�da dos dados
1		101	USA		mm/dd/yy
2		102	ANSI		yy.mm.dd
3		103	brit�nico	dd/mm/yy
10		110	USA		mm-dd-yy
12		112	ISO		yymmdd

--RECUPERA��O DE DADOS
Operadores de compara��o	=, >, <, <=, >=, <>, !=, !< e !>
Ex.:				Select au_lname, city from authors where state = 'CA'

Amplitude			between and not between
Ex.:				Select pubdate, title form titles where pubdate between '1/1/91' and
'12/31/91'

Lista				in and not in
Ex.:				Select title, type from titles where type in ('mod_cook', 'trad_cook')


				Wildcard	Descri��o
				%		qualquer string de zero ou mais caracteres
				_		Qualquer caractere �nico
				[]		Qualquer caractere �nico com amplitude ou set especificado
				[^]		Qualquer caractere �nico com amplitude ou set n�o especificado

Combina��o de strings		like and not like
Ex.:				Select * from cliente where nome like '%Luciana%'
				Select * from cliente where nome not like '%Luciana%'
				
Valores desconhecidos		is nulll e is not null
Ex.:				Select title from titles where price is null
				Select title from titles where price is not null

Combina��o de Argumentos	and, or
Ex.:				Select title_id, title, pub_id, price, pubdate from titles
				where (title like 't%' or pub_id = '0877') and (price > $16.00)
				
Nega��es			not
Ex.:				Select codigo from cliente where data not between '20/03/2001' and
'21/03/2001'

Eliminando duplicatas		all | distinct
Ex.:				Select [all|distinct] codigo from cliente where codigo is not null


Classifi��o de resultados	order by
Ex.:				Select pub_id, type, price, title from titles order by type, price desc


Join				Join operators: (=, >, <, <=, >=, <>, !=, !<, !>, =*, *=)
			
Natural Join			
Ex.:				Select publishers.pub_name, publishers.state, authors.* from publishers,
authors 
				where publishers.city = authors.city

Equijoin			
Ex.:				Select * from authors, publishers where authors.city = publishers.city


Joins com mais de duas tabelas
Ex.:				Select stor_name, qty, title from titles, stores, sales
				where titles.title_id = sales.title_id and stores.stor_id = sales.stor_id

Auto Joins
Ex.:				Select au1.au_fname, au.au_lname, au2.au_fname, au2.au_lname from 
				authors au1, authors au2 where au1.city = 'Oakland' and au1.state = 'CA'
				and au1.zip = au2.zip and au1.au_id < au2.au_id

Outer Joins
Ex.:				Select titles.title_id, title, qty from titles, sales where
				titles.title_id *= sales.title_id

--TRIGGERS
Create trigger [owner.]trigger_name
on [owner.]table_name
for {insert|update} -- trigger para inserir ou atualizar
as
if update (column_name)...]
	[{and|or} update}
	sql_statements}
	
--Insert Trigger
Create trigger loan_insert
on loan
for insert	-- trigger para inserir 
as
update copy set on_loan = 'y' from copy, inserted 
where copy.isbn = inserted.isbn and copy.copy_no = inserted.copy_no

--Delete Trigger
Create trigger member_delete
on member 
for delete	-- trigger para deletar
as
if (select count(*) from loan, deleted
where loan.member_no = deleted.member_no) > 0
begin
print 'Transaction cannot be processed.'
print 'This member still has books on loan.'
rollback transaction
end
else
delete reservation
from reservation, deleted 
where reservation.member_no = deleted.member_no

--Update Trigger
Create Trigger member_update
on member
for update	-- trigger para atualizar
as
if update (member_no)
begin
raiseerror ('Transaction cannot be processed.\
*****Member number cannot be modified.', 10, 1)
roolback transaction
end

--BULK COPY PROGRAM
bcp tabela in a:dados.txt -u 'usuario' -p 'senha' -s servidor

