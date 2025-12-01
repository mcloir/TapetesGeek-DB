USE tapetes_geek;

-- --- COMANDOS UPDATE ---

-- 1. Atualizar o telefone de um cliente
UPDATE Cliente 
SET telefone = '(11) 90000-9999' 
WHERE id_cliente = 1;

-- 2. Atualizar a situação de uma parcela para 'Atrasado' se já passou da data
UPDATE Parcela 
SET situacao = 'Atrasado' 
WHERE data_vencimento < CURDATE() AND situacao = 'Aberto';

-- 3. Corrigir o valor de uma parcela específica
UPDATE Parcela 
SET valor_parcela = 550.00 
WHERE id_parcela = 2;


-- --- COMANDOS DELETE ---

-- 1. Remover um pagamento lançado errado
DELETE FROM Pagamento 
WHERE id_pagamento = 999; 

-- 2. Remover clientes que não possuem títulos (limpeza de cadastro)
DELETE FROM Cliente 
WHERE id_cliente NOT IN (SELECT DISTINCT id_cliente FROM TituloReceber);

-- 3. Remover uma forma de pagamento obsoleta (desde que não usada)
DELETE FROM FormaPagamento 
WHERE descricao = 'Cheque';