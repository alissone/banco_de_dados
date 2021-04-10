SELECT it.item_name AS "Item",
       strftime('%d/%m/%Y', sl.date) AS "Data da venda",
       printf("₽ %.2f", AVG(sl.item_price)) AS "Preço Médio",
       ct.item_category_name AS "Categoria"

FROM   items it
       INNER JOIN item_categories ct
       ON it.item_category_id = ct.item_category_id
       INNER JOIN sales sl
       ON it.item_id = sl.item_id

WHERE  ct.item_category_name = "Кино - DVD"
GROUP BY sl.item_id
ORDER BY AVG(sl.item_price) DESC
LIMIT 20;
