-- Criação do Banco de Dados
CREATE DATABASE tapetes_geek;
USE tapetes_geek;

-- Tabela 1: Cliente [cite: 251]
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela 2: TituloReceber [cite: 257]
CREATE TABLE TituloReceber (
    id_titulo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_emissao DATE NOT NULL,
    valor_total_original DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela 3: Parcela [cite: 262]
CREATE TABLE Parcela (
    id_parcela INT AUTO_INCREMENT PRIMARY KEY,
    id_titulo INT NOT NULL,
    numero_parcela VARCHAR(10) NOT NULL, -- Ex: "1/3"
    data_vencimento DATE NOT NULL,
    valor_parcela DECIMAL(10, 2) NOT NULL,
    situacao VARCHAR(20) DEFAULT 'Aberto', -- Aberto, Pago, Atrasado
    FOREIGN KEY (id_titulo) REFERENCES TituloReceber(id_titulo)
);

-- Tabela 5: FormaPagamento (Criar antes de Pagamento pois é dependência) [cite: 276]
CREATE TABLE FormaPagamento (
    id_forma_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL -- Pix, Crédito, Débito
);

-- Tabela 4: Pagamento [cite: 269]
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_parcela INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    juros_multa_calculado DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (id_parcela) REFERENCES Parcela(id_parcela),
    FOREIGN KEY (id_forma_pagamento) REFERENCES FormaPagamento(id_forma_pagamento)
);