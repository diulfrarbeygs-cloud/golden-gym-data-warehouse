-- =============================================
-- PROYECTO: GOLDEN GYM - DATA WAREHOUSE
-- ARCHIVO: 03_crear_tabla_membresias.sql
-- DESCRIPCIÓN: Creación de la tabla que registra
-- las membresías y pagos de los clientes.
-- =============================================

-- Seleccionamos la base de datos donde trabajaremos.
USE golden_gym;

-- Creamos la tabla llamada membresias.
CREATE TABLE membresias (

    -- Identificador único de cada membresía.
    id_membresia INT PRIMARY KEY,

    -- Identificador del cliente que compra la membresía.
    id_cliente INT NOT NULL,

    -- Identificador del plan seleccionado.
    id_plan INT NOT NULL,

    -- Identificador de la sede donde utilizará el servicio.
    id_sede INT NOT NULL,

    -- Identificador del entrenador asignado al cliente.
    id_entrenador INT,

    -- Fecha en la que inicia la membresía.
    fecha_inicio DATE NOT NULL,

    -- Fecha en la que finaliza la membresía.
    fecha_fin DATE NOT NULL,

    -- Valor total pagado por la membresía.
    valor_pago DECIMAL(10,2) NOT NULL,

    -- Relación con la tabla clientes.
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    -- Relación con la tabla planes.
    FOREIGN KEY (id_plan)
        REFERENCES planes(id_plan),

    -- Relación con la tabla sedes.
    FOREIGN KEY (id_sede)
        REFERENCES sedes(id_sede),

    -- Relación con la tabla entrenadores.
    FOREIGN KEY (id_entrenador)
        REFERENCES entrenadores(id_entrenador)
);