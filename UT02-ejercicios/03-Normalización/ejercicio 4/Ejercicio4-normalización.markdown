# Normalización de la Tabla Pedidos

## Paso 1: Primera Forma Normal (1FN)

La tabla **Pedidos** ya cumple con la 1FN, ya que todos los valores son atómicos (sin grupos repetitivos).

## Paso 2: Segunda Forma Normal (2FN)

### Tablas en 2FN

**Tabla Pedidos**

| PedidoID | FechaPedido | ClienteID |
|----------|-------------|-----------|
| 301      | 05/04/2023  | 501       |
| 302      | 06/04/2023  | 502       |
| 303      | 07/04/2023  | 503       |

**Tabla Clientes**

| ClienteID | ClienteNombre |
|-----------|---------------|
| 501       | Juan          |
| 502       | María         |
| 503       | Luis          |

**Tabla Productos**

| ProductoID | ProductoNombre | PrecioUnitario |
|------------|----------------|----------------|
| 1001       | Lápiz          | 0.5            |
| 1002       | Cuaderno       | 1.5            |
| 1003       | Bolígrafo      | 0.8            |
| 1004       | Borrador       | 0.3            |

**Tabla PedidoDetalles**

| PedidoID | ProductoID | Cantidad |
|----------|------------|----------|
| 301      | 1001       | 10       |
| 301      | 1002       | 5        |
| 302      | 1003       | 8        |
| 303      | 1001       | 12       |
| 303      | 1004       | 4        |

## Paso 3: Tercera Forma Normal (3FN)

### Modelo Final en 3FN

1. **Tabla Pedidos**: Información general del pedido.


   | PedidoID | FechaPedido | ClienteID |
   |----------|-------------|-----------|
   | 301      | 05/04/2023  | 501       |
   | 302      | 06/04/2023  | 502       |
   | 303      | 07/04/2023  | 503       |
   
   
 2. **Tabla Clientes**: Información del cliente.
   
| ClienteID | ClienteNombre |
|-----------|---------------|
| 501       | Juan          |
| 502       | María         |
| 503       | Luis          |


1. **Tabla Productos**: Información del producto.
   
| ProductoID | ProductoNombre | PrecioUnitario |
|------------|----------------|----------------|
| 1001       | Lápiz          | 0.5            |
| 1002       | Cuaderno       | 1.5            |
| 1003       | Bolígrafo      | 0.8            |
| 1004       | Borrador       | 0.3            |



1. **Tabla PedidoDetalles**: Relación entre pedidos y productos, con la cantidad de cada producto en cada pedido.
   

| PedidoID | ProductoID | Cantidad |
|----------|------------|----------|
| 301      | 1001       | 10       |
| 301      | 1002       | 5        |
| 302      | 1003       | 8        |
| 303      | 1001       | 12       |
| 303      | 1004       | 4        |
