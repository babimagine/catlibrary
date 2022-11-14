CREATE TABLE LUGAR
(
    IDLUGAR     var(20)                 ,
    ENDERECO    varchar2(50)    not null,
    NUMERO      int(10)         not null,
    BAIRRO      varchar(50)     not null,
    CEP         varchar(9)      not null,
    CIDADE      varchar(50)     not null,
    ESTADO      varchar2(50)    not null,
    PAIS        varchar2(50)    not null,
    Constraint LUGAR_Id_PK   PRIMARY KEY(IDLUGAR)
)

CREATE TABLE CARTAO
(
    IDCARTAO    var(20)                 ,
    NUMERO      varchar(16)     not null,
    NOME        varchar(50)     not null,
    VENCIMENTO, int             not null,
    SEGURANCA   int             not null,
    Constraint cartao_Id_PK  PRIMARY KEY(IDCARTAO)
)

CREATE TABLE CLIENTE
(
    IDCLIENTE   var(20)                 ,
    NOME        varchar(50)     not null,
    SOBRENOME   varchar(50)     not null,
    EMAIL       varchar(50)     not null,
    TELEFONE    int             not null,
    SENHA       varchar(32)     not null,
    GENERO      varchar(1)		Constraint CLIENTE_GENERO_CK CHECK(Sexo IN ('M','F','O', 'N')),
    Constraint cliente_Id_PK  PRIMARY KEY(IDCLIENTE),
    
    IDLUGAR     FOREIGN KEY,
    IDCARTAO    FOREIGN KEY,
    FOREIGN KEY(IDLUGAR) REFERENCES LUGAR (IDLUGAR),
    FOREIGN KEY(IDCARTAO) REFERENCES CARTAO (IDCARTAO)
)

CREATE TABLE LIVRO
(
    IDLIVRO         var(20)                      ,
    NOME            varchar2(50)         not null,
    DESCRICAO       varchar2(500)        not null,
    IMG             varchar2(50)         not null,
    EDITOR          varchar2(32)         not null,
    AUTOR           varchar2(32)         not null,
    LANCAMENTO      varchar2(32)         not null,
    PRECO           number(7,2)          not null,
    GENERO          varchar2(32)         not null,
    Constraint livro_Id_PK  PRIMARY KEY(ID LIVRO)
)

        CREATE TABLE CLIENTE_LIVRO
        (
            DATA COMPRA     date not null,
            IDLIVRO         FOREIGN KEY,
            IDCLIENTE       FOREIGN KEY,
            FOREIGN KEY(IDLIVRO) REFERENCES LIVRO (IDLIVRO),
            FOREIGN KEY(IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE)
        )

