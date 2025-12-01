USE tapetes_geek;

-- 1. Inserindo Clientes
INSERT INTO Cliente (nome_completo, cpf, email, telefone) VALUES 
('João da Silva', '123.456.789-00', 'joao@email.com', '(11) 99999-0001'),
('Maria Oliveira', '987.654.321-11', 'maria@email.com', '(21) 98888-0002'),
('Carlos Geek', '456.123.789-22', 'carlos@geek.com', '(31) 97777-0003');

-- 2. Inserindo Formas de Pagamento
INSERT INTO FormaPagamento (descricao) VALUES ('Pix'), ('Cartão de Crédito'), ('Dinheiro');

-- 3. Inserindo Títulos (Vendas realizadas)
-- João comprou 1000 reais dia 01/03/2025
-- Maria comprou 500 reais dia 05/03/2025
INSERT INTO TituloReceber (id_cliente, data_emissao, valor_total_original) VALUES 
(1, '2025-03-01', 1000.00),
(2, '2025-03-05', 500.00);

-- 4. Inserindo Parcelas
-- Compra do João (id_titulo 1) em 2x
INSERT INTO Parcela (id_titulo, numero_parcela, data_vencimento, valor_parcela, situacao) VALUES 
(1, '1/2', '2025-04-01', 500.00, 'Pago'),
(1, '2/2', '2025-05-01', 500.00, 'Aberto');

-- Compra da Maria (id_titulo 2) em 1x (já venceu e ela não pagou)
INSERT INTO Parcela (id_titulo, numero_parcela, data_vencimento, valor_parcela, situacao) VALUES 
(2, '1/1', '2025-03-10', 500.00, 'Atrasado');

-- 5. Inserindo Pagamento
-- João pagou a primeira parcela com Pix
INSERT INTO Pagamento (id_parcela, id_forma_pagamento, data_pagamento, valor_pago, juros_multa_calculado) VALUES 
(1, 1, '2025-03-30', 500.00, 0.00);