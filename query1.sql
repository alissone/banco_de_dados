SELECT Sum(sl.item_cnt_day)                 AS "Vendas",
       it.item_name                         AS "Nome",
       Printf("₽ %.2f", Avg(sl.item_price)) AS "Preço Médio",
       ct.item_category_name                AS "Categoria"
FROM   items it
       INNER JOIN item_categories ct
               ON it.item_category_id = ct.item_category_id
       INNER JOIN sales sl
               ON sl.item_id = it.item_id
WHERE  ct.item_category_name LIKE "Игры PC%"
GROUP  BY "nome"
ORDER  BY "vendas" DESC
LIMIT  20;