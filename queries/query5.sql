SELECT strftime("%Y/%m", sl.date) AS "Ano/Mês",
       SUM(sl.item_cnt_day) AS "Itens vendidos"
FROM   sales sl
WHERE  shop_id = 59

GROUP BY "Ano/Mês"
ORDER BY "Ano/Mês"