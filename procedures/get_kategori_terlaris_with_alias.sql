DELIMITER $$

CREATE PROCEDURE get_kategori_terlaris_with_alias(
    IN p_bulan VARCHAR(7),
    IN p_alias_kategori VARCHAR(255)
)
BEGIN
    DECLARE v_start DATE;
    DECLARE v_end DATE;

    SET v_start = STR_TO_DATE(CONCAT(p_bulan, '-01'), '%Y-%m-%d');
    SET v_end   = LAST_DAY(v_start);

    START TRANSACTION;

    SELECT
        bc.id AS barang_category_id,
        COALESCE(SUM(
            CASE 
                WHEN ph.id IS NOT NULL THEN pd.jumlah 
                ELSE 0 
            END
        ), 0) AS total_this_month,
        COALESCE(AVG(
            CASE 
                WHEN ph.id IS NOT NULL THEN pd.harga 
                ELSE NULL 
            END
        ), 0) AS average_price
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
    WHERE (
        p_alias_kategori IS NULL
        OR bc.alias COLLATE utf8mb4_unicode_ci =
           p_alias_kategori COLLATE utf8mb4_unicode_ci
    )
    GROUP BY bc.id
    ORDER BY total_this_month DESC;

    COMMIT;
END$$

DELIMITER ;