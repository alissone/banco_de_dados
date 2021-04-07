SELECT Sum(sl.item_cnt_day)                 AS "Vendas",
       substr ("--JanFevMarAbrMaiJunJulAgoSetOutNovDez", strftime ("%m", sl.date) * 3, 3) AS "Mês",
       printf("$ %.2f", Avg(sl.item_price)) AS "Preço Médio",
       it.item_name                         AS "Nome do item",
       ct.item_category_name                AS "Categoria"
FROM   item_categories ct
       INNER JOIN items it
               ON it.item_category_id = ct.item_category_id
       INNER JOIN sales sl
               ON sl.item_id = it.item_id
       INNER JOIN shops sp
               ON sp.shop_id = sl.shop_id
WHERE ct.item_category_name like "%XBOX 360%"
       AND it.item_name LIKE "%Dishonored Game of the Year Edition%"
       AND strftime('%Y', sl.date) = '2014'
GROUP  BY "Mês"
ORDER  BY sl.date