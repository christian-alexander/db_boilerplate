DELIMITER $$

CREATE PROCEDURE get_kategori_terlaris_with_zero_sales(IN p_bulan VARCHAR(7))
BEGIN
    DECLARE v_start DATE;
    DECLARE v_end DATE;

    SET v_start = STR_TO_DATE(CONCAT(p_bulan, '-01'), '%Y-%m-%d');
    SET v_end   = LAST_DAY(v_start);

    START TRANSACTION;

    SELECT
        bc.id AS barang_category_id,
        COALESCE(SUM(pd.jumlah), 0) AS total_this_month,
        COALESCE(AVG(pd.harga), 0) AS average_price
    FROM barang_categories bc
    LEFT JOIN barangs b
        ON b.barang_category_id = bc.id
        AND b.deleted_at IS NULL
    LEFT JOIN penjualan_details pd
        ON pd.barang_id = b.id
        AND pd.deleted_at IS NULL
    LEFT JOIN penjualan_headers ph
        ON ph.id = pd.penjualan_header_id
        AND ph.deleted_at IS NULL
        AND ph.tanggal_invoice BETWEEN v_start AND v_end
    GROUP BY bc.id
    ORDER BY total_this_month DESC;

    COMMIT;
END$$

DELIMITER ;