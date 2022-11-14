CREATE TABLE LUGAR
(
    IDLUGAR     int             PRIMARY KEY,
    ENDERECO    varchar2(50)    not null,
    NUMERO      int(10)         not null,
    BAIRRO      varchar(50)     not null,
    CEP         varchar(9)      not null,
    CIDADE      varchar(50)     not null,
    ESTADO      varchar2(50)    not null,
    PAIS        varchar2(50)
)

CREATE TABLE CARTAO
(
    IDCARTAO                    PRIMARY KEY,
    NUMERO      varchar(16)     not null,
    NOME        varchar(50)     not null,
    VENCIMENTO, int             not null,
    SEGURANCA   int             not null
)

CREATE TABLE CLIENTE
(
    IDCLIENTE  PRIMARY KEY,
    NOME        varchar(50)     not null,
    SOBRENOME   varchar(50)     not null,
    EMAIL       varchar(50)     not null,
    TELEFONE    int             not null,
    SENHA       varchar(32)     not null,
    GENERO      varchar(1)		CHECK(TIPO IN ('M','F','O', 'N')),
    IDLUGAR     FOREIGN KEY,
    IDCARTAO    FOREIGN KEY,
    FOREIGN KEY(IDLUGAR) REFERENCES LUGAR (IDLUGAR),
    FOREIGN KEY(IDCARTAO) REFERENCES CARTAO (IDCARTAO)
)

CREATE TABLE LIVRO
(
    IDLIVRO PRIMARY KEY,
    NOME        varchar(50)        not null,
    DESCRICAO   varchar(500)       not null,
    IMG         varchar(50)        not null,
    EDITOR      varchar(32)        not null,
    AUTOR       varchar(32)        not null,
    LANCAMENTO  date               not null,
    PRECO       float(7,2)         not null,
    GENERO      varchar(32)        not null
)

        CREATE TABLE CLIENTE_LIVRO
        (
            DATA COMPRA     date not null,
            IDLIVRO         FOREIGN KEY,
            IDCLIENTE       FOREIGN KEY,
            FOREIGN KEY(IDLIVRO) REFERENCES LIVRO (IDLIVRO),
            FOREIGN KEY(IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE)
        )

