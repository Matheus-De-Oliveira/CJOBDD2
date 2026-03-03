/* L�gico_1: */

CREATE TABLE CLIENTES (
    Cod_cliente         INT PRIMARY KEY,
    Sobrenome           VARCHAR(80),
    Nome                VARCHAR(50),
    Inicial             CHAR(1),
    DDD                 VARCHAR(2),
    Telefone            VARCHAR(15),
    Saldo               FLOAT
);

CREATE TABLE FATURAS (
    Num_Fatura                  INT PRIMARY KEY,
    Data_fatura                 DATE,
    FK_CLIENTES_Cod_cliente     INT
);

CREATE TABLE LINHAS (
    Num_Linha               INT PRIMARY KEY,
    Unidades                INT,
    Valor                   FLOAT,
    FK_FATURAS_Num_Fatura   INT,
    FK_PRODUTOS_Cod_Produto INT
);

CREATE TABLE PRODUTOS (
    Cod_Produto                     INT PRIMARY KEY,
    Descricao                       VARCHAR(200),
    Data_Compra                     DATE,
    Quantidade                      INT,
    Valor                           FLOAT,
    Desconto                        FLOAT,
    FK_FORNECEDORES_Cod_Fornecedor  INT
);

CREATE TABLE FORNECEDORES (
    Cod_Fornecedor          INT PRIMARY KEY,
    Nome                    VARCHAR(8),
    Contato                 VARCHAR(50),
    DDD                     VARCHAR(2),
    Telefone                VARCHAR(15),
    Estado                  CHAR(2),
    Cidade                  VARCHAR(100)
);
 
ALTER TABLE FATURAS ADD CONSTRAINT FK_FATURAS_2
    FOREIGN KEY (FK_CLIENTES_Cod_cliente)
    REFERENCES CLIENTES (Cod_cliente)
    ON DELETE CASCADE;
 
ALTER TABLE LINHAS ADD CONSTRAINT FK_LINHAS_2
    FOREIGN KEY (FK_FATURAS_Num_Fatura)
    REFERENCES FATURAS (Num_Fatura)
    ON DELETE RESTRICT;
 
ALTER TABLE LINHAS ADD CONSTRAINT FK_LINHAS_3
    FOREIGN KEY (FK_PRODUTOS_Cod_Produto)
    REFERENCES PRODUTOS (Cod_Produto)
    ON DELETE CASCADE;
 
ALTER TABLE PRODUTOS ADD CONSTRAINT FK_PRODUTOS_2
    FOREIGN KEY (FK_FORNECEDORES_Cod_Fornecedor)
    REFERENCES FORNECEDORES (Cod_Fornecedor)
    ON DELETE CASCADE;