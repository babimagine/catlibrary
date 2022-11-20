CREATE TABLE LUGAR
(
    IDLUGAR     int(20)        PRIMARY KEY,
    ENDERECO    varchar(50)    not null,
    NUMERO      int(10)        not null,
    BAIRRO      varchar(50)    not null,
    CEP         varchar(9)     not null,
    CIDADE      varchar(50)    not null,
    ESTADO      varchar(50)    not null,
    PAIS        varchar(50)    not null
);

CREATE TABLE CARTAO
(
    IDCARTAO    int(20)        PRIMARY KEY,
    NUMERO      varchar(16)    not null,
    NOME        varchar(50)    not null,
    VENCIMENTO  int(4)         not null,
    SEGURANCA   int(3)         not null
);

CREATE TABLE CLIENTE
(
    IDCLIENTE   int(20)         PRIMARY KEY,
    NOME        varchar(50)     not null,
    SOBRENOME   varchar(50)     not null,
    EMAIL       varchar(50)     not null,
    TELEFONE    int(11)         not null,
    SENHA       varchar(32)     not null,
    GENERO      int(1),
    CHECK(GENERO IN ('M','F','O','N')),

    IDLUGAR     int(20),
    IDCARTAO    int(20),
    FOREIGN KEY(IDLUGAR)   REFERENCES LUGAR(IDLUGAR),
    FOREIGN KEY(IDCARTAO)  REFERENCES CARTAO(IDCARTAO)
);

CREATE TABLE LIVRO
(
    IDLIVRO         int(5)              PRIMARY KEY,
    NOME            varchar(50)         not null,
    EDITOR          varchar(32)         not null,
    AUTOR           varchar(32)         not null,
    GENERO          varchar(32)         not null,
    LANCAMENTO      varchar(32)         not null,
    PRECO           float(7,2)          not null,
    DESCRICAO       varchar(500)        not null   UNIQUE
);

CREATE TABLE CLIENTE_LIVRO
(
    IDLIVRO         int(5)      FOREIGN KEY,
    IDCLIENTE       int(20)     FOREIGN KEY,
    FOREIGN KEY(IDCARTAO)    REFERENCES LIVRO(IDCARTAO),
    FOREIGN KEY(IDCLIENTE)   REFERENCES CLIENTE(IDCLIENTE),
    PRIMARY KEY(IDLIVRO, IDCLIENTE)
);

