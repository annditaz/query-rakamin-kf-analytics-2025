SELECT a.transaction_id, a.date, c.branch_id, c.branch_name, c.kota, c.provinsi, c.rating as rating_cabang, a.customer_name, b.product_id,b.product_name, b.price, a.discount_percentage,CASE 
        WHEN b.price <= 50000 THEN 10
        WHEN  b.price > 50000 AND  b.price <= 100000 THEN 15
        WHEN  b.price > 100000 AND  b.price <= 300000 THEN 20
        WHEN  b.price > 300000 AND  b.price <= 500000 THEN 25
        WHEN  b.price > 500000 THEN 30
    END AS persentase_gross_laba, b.price * (1 - a.discount_percentage) as nett_sales, ((b.price * (CASE 
        WHEN b.price <= 50000 THEN 10
        WHEN  b.price > 50000 AND  b.price <= 100000 THEN 15
        WHEN  b.price > 100000 AND  b.price <= 300000 THEN 20
        WHEN  b.price > 300000 AND  b.price <= 500000 THEN 25
        WHEN  b.price > 500000 THEN 30
      END)/100) ) - (b.price * a.discount_percentage) as nett_profit ,a.rating as rating_transaksi FROM `rakamin-kf-analytics-449406.kimia_farma_transaction.kf_final_transaction` as a
JOIN `rakamin-kf-analytics-449406.kimia_farma_transaction.kf_product` as b ON a.product_id = b.product_id
JOIN `rakamin-kf-analytics-449406.kimia_farma_transaction.kf_kantor_cabang` as c ON a.branch_id = c.branch_id
ORDER BY a.date