-- Faturamento total
SELECT SUM(valor_total) AS faturamento_total
FROM vendas;

-- Vendas por produto
SELECT 
    p.produto,
    SUM(v.quantidade) AS quantidade_vendida,
    SUM(v.valor_total) AS faturamento
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.produto
ORDER BY faturamento DESC;

-- Faturamento por estado
SELECT 
    c.estado,
    SUM(v.valor_total) AS faturamento
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.estado
ORDER BY faturamento DESC;

-- Evolução mensal das vendas
SELECT 
    strftime('%Y-%m', data_venda) AS mes,
    SUM(valor_total) AS faturamento
FROM vendas
GROUP BY mes
ORDER BY mes;

-- Ticket médio
SELECT AVG(valor_total) AS ticket_medio
FROM vendas;
