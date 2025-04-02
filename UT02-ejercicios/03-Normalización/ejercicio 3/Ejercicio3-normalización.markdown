# Ejercicio Relacional

## Paso 1: Primera Forma Normal (1FN)

**Tabla Alquileres en 1FN**

| AlquilerID | FechaAlquiler | ClienteID | ClienteNombre | Vehiculo     | PrecioVehiculo |
|------------|---------------|-----------|---------------|--------------|----------------|
| 101        | 10/03/2023    | 201       | Carlos        | Sedán        | 50             |
| 101        | 10/03/2023    | 201       | Carlos        | SUV          | 70             |
| 102        | 12/03/2023    | 202       | Laura         | Convertible  | 80             |
| 102        | 12/03/2023    | 202       | Laura         | Pickup       | 65             |
| 103        | 15/03/2023    | 203       | Pedro         | SUV          | 70             |
| 103        | 15/03/2023    | 203       | Pedro         | Van          | 60             |
| 103        | 15/03/2023    | 203       | Pedro         | Sedán        | 50             |
| 104        | 18/03/2023    | 204       | Ana           | Sedán        | 50             |

## Paso 2: Segunda Forma Normal (2FN)


**Tabla Alquileres en 2FN**

| AlquilerID | FechaAlquiler | ClienteID |
|------------|---------------|-----------|
| 101        | 10/03/2023    | 201       |
| 102        | 12/03/2023    | 202       |
| 103        | 15/03/2023    | 203       |
| 104        | 18/03/2023    | 204       |

**Tabla Clientes**

| ClienteID | ClienteNombre |
|-----------|---------------|
| 201       | Carlos        |
| 202       | Laura         |
| 203       | Pedro         |
| 204       | Ana           |

**Tabla Vehiculos**

| Vehiculo     | PrecioVehiculo |
|--------------|----------------|
| Sedán        | 50             |
| SUV          | 70             |
| Convertible  | 80             |
| Pickup       | 65             |
| Van          | 60             |

**Tabla AlquilerDetalles**

| AlquilerID | Vehiculo     |
|------------|--------------|
| 101        | Sedán        |
| 101        | SUV          |
| 102        | Convertible  |
| 102        | Pickup       |
| 103        | SUV          |
| 103        | Van          |
| 103        | Sedán        |
| 104        | Sedán        |

## Paso 3: Tercera Forma Normal (3FN)


### Modelo Final en 3FN


   | AlquilerID | FechaAlquiler | ClienteID |
   |------------|---------------|-----------|
   | 101        | 10/03/2023    | 201       |
   | 102        | 12/03/2023    | 202       |
   | 103        | 15/03/2023    | 203       |
   | 104        | 18/03/2023    | 204       |

   1. ***Tabla Clientes***: Información del cliente.
   
   | ClienteID | ClienteNombre |
|-----------|---------------|
| 201       | Carlos        |
| 202       | Laura         |
| 203       | Pedro         |
| 204       | Ana           |

2. ***Tabla Vehiculos***: Información del vehículo y su precio.

Vehiculo (PK)
PrecioVehiculo
markdown
Copiar código
| Vehiculo     | PrecioVehiculo |
|--------------|----------------|
| Sedán        | 50             |
| SUV          | 70             |
| Convertible  | 80             |
| Pickup       | 65             |
| Van          | 60             |
3. ***Tabla AlquilerDetalles***: Relación entre alquileres y vehículos.

| AlquilerID | Vehiculo     |
|------------|--------------|
| 101        | Sedán        |
| 101        | SUV          |
| 102        | Convertible  |
| 102        | Pickup       |
| 103        | SUV          |
| 103        | Van          |
| 103        | Sedán        |
| 104        | Sedán        |