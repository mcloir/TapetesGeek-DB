USE tapetes_geek;

-- Consulta 1: Listar todos os clientes e seus e-mails (Simples)
SELECT nome_completo, email FROM Cliente;

-- Consulta 2: Listar parcelas que estão em atraso (Com WHERE)
SELECT * FROM Parcela WHERE situacao = 'Atrasado';

-- Consulta 3: Relatório completo
SELECT 
    c.nome_completo, 
    t.id_titulo, 
    p.numero_parcela, 
    p.valor_parcela, 
    p.data_vencimento, 
    p.situacao
FROM Cliente c
JOIN TituloReceber t ON c.id_cliente = t.id_cliente
JOIN Parcela p ON t.id_titulo = p.id_titulo
ORDER BY p.data_vencimento;

-- Consulta 4: Total recebido pela loja agrupado por forma de pagamento
SELECT fp.descricao, SUM(pg.valor_pago) as total_arrecadado
FROM Pagamento pg
JOIN FormaPagamento fp ON pg.id_forma_pagamento = fp.id_forma_pagamento
GROUP BY fp.descricao;