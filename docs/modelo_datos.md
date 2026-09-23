# 🗄️ Modelo de Datos - GOLDEN GYM

## 📌 Descripción

La base de datos de GOLDEN GYM fue diseñada para almacenar y analizar información relacionada con los clientes, planes de membresía, sede, entrenadores y membresías del gimnasio.

El modelo utiliza una estructura relacional donde las tablas se conectan mediante claves primarias y claves foráneas.

---

# 📊 Tablas del proyecto

## 👤 Clientes

**Tabla:** `clientes`

Almacena la información de los clientes registrados en el gimnasio.

| Campo | Descripción |
|---|---|
| id_cliente | Identificador único del cliente |
| nombre | Nombre del cliente |
| apellido | Apellido del cliente |
| edad | Edad del cliente |
| ciudad | Ciudad del cliente |
| fecha_registro | Fecha de registro |

**Clave primaria:** `id_cliente`

---

## 💳 Planes

**Tabla:** `planes`

Contiene los planes de membresía disponibles en GOLDEN GYM.

| Campo | Descripción |
|---|---|
| id_plan | Identificador único del plan |
| nombre_plan | Nombre del plan |
| duracion_meses | Duración de la membresía |
| precio | Precio del plan |

**Clave primaria:** `id_plan`

### Planes disponibles

- Plan 12 días — $50.000
- Plan 16 días — $60.000
- Plan mes completo — $70.000

---

## 🏢 Sedes

**Tabla:** `sedes`

Almacena la información de las sedes del gimnasio.

Actualmente, GOLDEN GYM cuenta con una única sede ubicada en **Socorro, Santander**.

| Campo | Descripción |
|---|---|
| id_sede | Identificador único de la sede |
| nombre_sede | Nombre de la sede |
| ciudad | Ciudad donde se encuentra |
| direccion | Dirección de la sede |

**Clave primaria:** `id_sede`

---

## 🏋️ Entrenadores

**Tabla:** `entrenadores`

Registra los entrenadores disponibles en el gimnasio.

| Campo | Descripción |
|---|---|
| id_entrenador | Identificador único del entrenador |
| nombre | Nombre del entrenador |
| apellido | Apellido del entrenador |
| especialidad | Área de entrenamiento |

**Clave primaria:** `id_entrenador`

Los entrenadores trabajan mediante rotación de horarios, por lo que los clientes no están asignados permanentemente a un entrenador específico.

---

## 📅 Membresías

**Tabla:** `membresias`

Es la tabla principal del modelo porque relaciona los clientes con los planes y registra la información de cada membresía.

| Campo | Descripción |
|---|---|
| id_membresia | Identificador único de la membresía |
| id_cliente | Cliente asociado |
| id_plan | Plan adquirido |
| id_sede | Sede asociada |
| fecha_inicio | Fecha de inicio |
| fecha_fin | Fecha de finalización |
| valor_pago | Valor pagado |
| estado | Estado de la membresía |

**Clave primaria:** `id_membresia`

### Claves foráneas

```text
id_cliente → clientes.id_cliente

id_plan → planes.id_plan

id_sede → sedes.id_sede