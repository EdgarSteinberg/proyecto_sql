USE es_deportes;  -- Asegúrate de estar usando la base de datos correcta

DELIMITER //

DROP PROCEDURE IF EXISTS es_deportes.sp_registrar_compra //

CREATE PROCEDURE es_deportes.sp_registrar_compra(
    IN _precio INT,
    IN _cantidad DECIMAL(10, 2),
    IN _id_cliente INT,
    IN _id_local INT,
    IN _id_producto INT
)
BEGIN
    DECLARE _estado ENUM('Pendiente', 'Completada', 'Cancelada');
    DECLARE _total_compra DECIMAL(10, 2);
    
    -- Calculamos el total de la compra (precio * cantidad)
    SET _total_compra = _precio * _cantidad;

    -- Verificamos si la cantidad y el precio son válidos (por ejemplo, no negativos)
    IF _precio <= 0 OR _cantidad <= 0 THEN
        SELECT 'Error: El precio o la cantidad no son válidos. La compra no puede ser procesada.' AS mensaje;
        ROLLBACK;
    ELSE
        -- Inicia la transacción
        START TRANSACTION;

        -- Insertamos el registro en la tabla 'compra'
        INSERT INTO compra (precio, cantidad, estado_de_compra, id_cliente, id_local, id_productos)
        VALUES (_precio, _cantidad, 'Pendiente', _id_cliente, _id_local, _id_producto);

        -- Si la compra se realizó correctamente, confirmamos la transacción
        SELECT 'Compra registrada correctamente, estado de compra: Pendiente' AS mensaje;

        COMMIT;
    END IF;
END //

DELIMITER ;

CALL es_deportes.sp_registrar_compra(500, 3, 1, 2, 5);
