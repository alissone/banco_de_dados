SELECT Count(it.item_name) AS "Itens a venda",
       sp.shop_name        AS "Nome da Loja",
       it.item_name        AS "Item mais vendido"
FROM   shops sp
       INNER JOIN sales sl
               ON sl.shop_id = sp.shop_id
       INNER JOIN items it
               ON it.item_id = sl.item_id
GROUP  BY sp.shop_name
HAVING "itens a venda" > 5000
ORDER  BY "itens a venda" DESC,
          Sum(sl.item_cnt_day)