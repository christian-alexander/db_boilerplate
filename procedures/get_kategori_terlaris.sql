DELIMITER $$

CREATE PROCEDURE get_kategori_terlaris(IN p_bulan VARCHAR(7))
BEGIN
    START TRANSACTION;

    -- Ambil data agregasi per kategori
    SELECT 
        b.barang_category_id,
        SUM(pd.jumlah) AS total_this_month,
        AVG(pd.harga) AS average_price
    FROM penjualan_details pd
    JOIN penjualan_headers ph 
        ON ph.id = pd.penjualan_header_id
    JOIN barangs b 
        ON b.id = pd.barang_id
    WHERE DATE_FORMAT(ph.tanggal_invoice, '%Y-%m') = p_bulan
          AND ph.deleted_at IS NULL
          AND pd.deleted_at IS NULL
    GROUP BY b.barang_category_id
    ORDER BY total_this_month DESC;

    COMMIT;
END$$

DELIMITER ;