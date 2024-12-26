# Proyecto Final por Edgar Steinberg 🚀
# Comisión: 59430
# Tutor: Nicolás Maugeri
# Docente: Anderson Michel TORRES

## Tabla de Contenidos  
1. [Descripción General](#descripción-general)  
2. [Problemática que Resuelve](#problemática-que-resuelve)  
3. [Vistas](#vistas)  
4. [Funciones](#funciones)  
5. [Procedimientos](#procedimientos)  
6. [Triggers](#triggers)  
7. [Usuarios](#usuarios)  
8. [Transacciones](#transacciones)  
9. [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)  
10. [Pasos para Arrancar el Proyecto](#pasos-para-arrancar-el-proyecto)  

## Primer DER Local de Deportes
![alt text](img/image.png)

## DER WORKBENCH
![alt text](img/image-1.png)

---

## Descripción General

Esta base de datos está diseñada para gestionar un negocio de deportes, proporcionando una estructura para almacenar y relacionar información sobre clientes, compras, productos, métodos de pago, empleados y locales. El objetivo es optimizar las consultas de compras, control de inventario, gestión de personal y administración de locales.

---

## Problemática que Resuelve

El diseño de esta base de datos permite gestionar de manera eficiente:
- **Compras y Métodos de Pago**: Cada compra tiene un estado y se asocia a uno o varios métodos de pago, facilitando el registro de transacciones completas.
- **Inventario y Stock de Productos**: La relación entre `productos` y `categoria_productos` permite un control detallado y categorización del inventario.
- **Gestión de Empleados y Roles**: Las relaciones entre empleados y categorías organizan los roles y la asignación de personal en los locales.
- **Locales y Empleados**: La asignación de empleados a locales específicos ayuda en la organización de las operaciones.
- **Consultas y Reportes**: Este modelo facilita consultas y reportes sobre ventas, stock, empleados por local y métodos de pago utilizados.

Este sistema es robusto y permite llevar un control detallado sobre transacciones, personal, inventario y métodos de pago, brindando una base sólida para la administración de un local de deportes.

---

## Vistas

### `vw_ventas_empleado_local`
Muestra el total de ventas realizadas por cada empleado y por cada local. Se calcula la venta total por empleado y por local, agrupando por el ID del empleado y ordenando por las ventas del empleado.

### `vw_compras_completadas`
Muestra el total de compras completadas y las ventas totales por cada local, agrupando por local y mostrando la cantidad de compras completadas y su total de ventas.

### `vw_stock_productos`
Proporciona una lista de productos con su stock actual, el nombre de la categoría a la que pertenecen y el proveedor. Esta vista es útil para monitorear la disponibilidad de los productos y facilitar la gestión de inventario.

### `vw_historial_compras_clientes`
Muestra el historial de compras de cada cliente, incluyendo detalles como el nombre, apellido, la fecha de compra, el estado de la compra y el total gastado. Esta vista es útil para analizar el comportamiento de compra de los clientes y su valor para el negocio.

### `vw_ventas_por_categoria`
Resume las ventas totales por categoría de producto, mostrando el nombre de la categoría, la cantidad total vendida y el ingreso total generado. Esta vista ayuda a identificar las categorías de productos más populares y a ajustar las estrategias de marketing y ventas.

---

## Funciones

### `fx_total_ventas_por_metodo`
Retorna el número total de ventas realizadas mediante un método de pago específico, como 'Efectivo', al contar las compras asociadas a ese método.

### `fx_total_stock_producto`
Retorna el stock total disponible para un producto específico. Si el producto no existe o no tiene stock, devuelve un mensaje indicando que no hay stock disponible.

---

## Procedimientos

### `AgregarCliente`
Inserta un nuevo cliente en la tabla `cliente` utilizando los parámetros proporcionados (nombre, apellido y email), y luego retorna los datos del cliente insertado.

### `GenerarInformeComprasYEmpleados`
Genera un informe de compras y empleados, limitando la cantidad de resultados y filtrando por estado de compra. Incluye información de la compra, el cliente, el empleado y el local.

---

## Triggers

### `trigger_bi_stock`
Valida que el stock de un producto sea mayor a 0 antes de insertarlo en la tabla `productos`. Si el stock es 0 o negativo, genera un error personalizado y evita la inserción.

### `trg_cliente_insert`
Registra una auditoría de inserciones en la tabla `cliente_auditoria` cada vez que se inserta un nuevo cliente en la tabla `cliente`, guardando la acción de inserción.

### `trg_cliente_update`
Registra una auditoría de actualizaciones en la tabla `cliente_auditoria` cada vez que se actualiza un cliente en la tabla `cliente`, guardando la acción de actualización.

### `trg_cliente_delete`
Registra una auditoría de eliminaciones en la tabla `cliente_auditoria` cada vez que se elimina un cliente de la tabla `cliente`, guardando la acción de eliminación.

---

## Usuarios

### `usuario_1`
Usuario con acceso limitado únicamente a las vistas `vw_ventas_empleado_local` y `vw_compras_completadas`. Este usuario tiene privilegios de solo lectura en dichas vistas, permitiendo consultar datos relacionados con ventas y compras completadas.

### `usuario_2`
Usuario con acceso de solo lectura a todas las tablas de la base de datos `es_deportes`. Ideal para tareas de análisis y generación de reportes sin posibilidad de modificar los datos.

### `usuario_3`
Usuario con acceso completo a todas las tablas y objetos de la base de datos `es_deportes`. Este usuario posee todos los privilegios, incluyendo la capacidad de lectura, escritura, modificación y eliminación de datos, así como la administración de la base de datos.

---

## Transacciones

### `sp_registrar_compra`
Gestiona el registro de una compra en la tabla `compra`, asegurando que el estado de la compra se mantenga como 'Pendiente' hasta su confirmación. Si la fecha de la compra es válida, se registra correctamente y se realiza un commit; de lo contrario, se realiza un rollback y se retorna un mensaje de error. Esta transacción asegura la integridad de la compra y mantiene el control de los datos relacionados.

--

## Estructura de la Base de Datos

### Tablas Principales

#### `cliente`
- **Descripción**: Almacena información básica del cliente.
- **Campos**:
  - `id_cliente`: INT (Clave primaria, autoincremental)
  - `nombre`: VARCHAR(100)
  - `apellido`: VARCHAR(100)
  - `email`: VARCHAR(254) (Único)
- **Relaciones**: Relacionada con la tabla `compra` mediante `id_cliente`.

#### `compra`
- **Descripción**: Registra cada transacción realizada.
- **Campos**:
  - `id_compra`: INT (Clave primaria, autoincremental)
  - `precio`: INT
  - `cantidad`: DECIMAL(10, 2)
  - `fecha_de_compra`: DATETIME (Fecha de la compra, valor predeterminado: `NOW()`).
  - `estado_de_compra`: ENUM('Pendiente', 'Completada', 'Cancelada')
  - `id_cliente`: INT (Clave foránea a `cliente`)
  - `id_local`: INT (Clave foránea a `local`)
  - `id_productos`: INT (Clave foránea a `productos`)
- **Relaciones**: Relacionada con `cliente`, `local`, `productos` y `compra_metodo_de_pago`.

#### `productos`
- **Descripción**: Contiene la información de cada producto en venta.
- **Campos**:
  - `id_productos`: INT (Clave primaria, autoincremental)
  - `nombre`: VARCHAR(254)
  - `descripcion`: VARCHAR(254)
  - `stock`: INT
  - `id_categoria_productos`: INT (Clave foránea a `categoria_productos`)
  - `id_proveedores`: INT (Clave foránea a `proveedores`)
- **Relaciones**: Relacionada con `categoria_productos` y `proveedores`.

#### `metodo_de_pago`
- **Descripción**: Define los métodos de pago permitidos.
- **Campos**:
  - `id_metodo_de_pago`: INT (Clave primaria, autoincremental)
  - `tipo`: ENUM('Efectivo', 'Tarjeta', 'Aplicación')

#### `local`
- **Descripción**: Almacena información de los locales donde se realizan las ventas.
- **Campos**:
  - `id_local`: INT (Clave primaria, autoincremental)
  - `direccion`: VARCHAR(255) (Único y obligatorio)
  - `encargado`: VARCHAR(255)
  - `horarios`: ENUM ('9', '21')
  - `id_empleados`: INT (Clave foránea a `empleados`)
- **Relaciones**: Relacionada con `empleados`.

#### `empleados`
- **Descripción**: Almacena la información básica de los empleados.
- **Campos**:
  - `id_empleados`: INT (Clave primaria, autoincremental)
  - `nombre`: VARCHAR(255)
  - `apellido`: VARCHAR(255)
  - `fecha_de_nacimiento`: DATE
  - `dni`: VARCHAR(20)
- **Relaciones**: Relacionada con `local` y `empleados_categoria`.

#### `categoria_empleado`
- **Descripción**: Define los roles o categorías de empleados.
- **Campos**:
  - `id_categoria_empleado`: INT (Clave primaria, autoincremental)
  - `rol`: ENUM('Vendedor', 'Encargado')
- **Relaciones**: Relacionada con `empleados` a través de `empleados_categoria`.

---

## Pasos para Arrancar el Proyecto

1. Abre una terminal de Linux.
2. Ejecuta los siguientes comandos:
    - `make` _En caso de error de conexión al socket, vuelve a ejecutar el comando_.
    - `make clean-db` Limpia la base de datos.
    - `make test-db` Muestra los datos de cada tabla.
    - `make backup-db` Realiza un respaldo de la base de datos.
    - `make access-db` Accede a la base de datos.
