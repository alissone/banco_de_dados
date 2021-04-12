SELECT  SUM(sl.item_cnt_day)                                          AS "Itens vendidos",
       (strftime("%Y",sl.date) * 12 + strftime("%m",sl.date)) - 24156 AS "Meses"
FROM sales sl
WHERE shop_id = 59
AND "Meses" > 28
GROUP BY "Meses"
ORDER BY "Meses" DESC