# 🏋️ GOLDEN GYM - Data Warehouse

## 📌 Descripción

Proyecto de Data Warehouse desarrollado para **GOLDEN GYM**, un gimnasio ubicado en Socorro, Santander.

El proyecto permite almacenar y analizar información relacionada con clientes, planes de membresía, sede, entrenadores e ingresos. La base de datos fue diseñada y probada utilizando **MySQL**, mientras que el código y la estructura del proyecto fueron desarrollados en **SQL y Visual Studio Code**.

---

## 🎯 Objetivo

Diseñar una base de datos que permita transformar la información operativa de GOLDEN GYM en datos útiles para realizar análisis sobre:

- Clientes registrados.
- Estado de las membresías.
- Planes más vendidos.
- Ingresos generados.
- Distribución de clientes por plan.
- Promedio de edad de los clientes.
- Membresías activas y vencidas.

---

## 🏢 Información del negocio

**Nombre:** GOLDEN GYM  
**Ubicación:** Socorro, Santander  
**Número de sedes:** 1  
**Número de clientes:** 100  
**Entrenadores:** 4  

### Planes de membresía

| Plan | Acceso | Precio |
|---|---|---:|
| Plan 12 días | 12 días al mes | $50.000 |
| Plan 16 días | 16 días al mes | $60.000 |
| Plan mes completo | Mes completo | $70.000 |

### Entrenadores

- Maykol
- Yury
- Arbey
- Jeison

---

## 📊 Datos del proyecto

| Indicador | Cantidad |
|---|---:|
| Clientes | 100 |
| Membresías | 100 |
| Membresías activas | 70 |
| Membresías vencidas | 30 |
| Sedes | 1 |
| Planes | 3 |
| Entrenadores | 4 |
| Consultas de análisis | 16 |

---

## 🗂️ Estructura del proyecto

```text
golden-gym-data-warehouse/
│
├── data/                         # Archivos de datos del proyecto
├── docs/                         # Documentación del proyecto
│
├── sql/
│   ├── 01_crear_base_datos.sql   # Creación de la base de datos
│   ├── 02_crear_tablas.sql       # Creación de tablas principales
│   ├── 03_crear_tabla_membresias.sql # Tabla de membresías
│   ├── 04_insertar_datos.sql     # Inserción de datos
│   └── 05_consultas_analisis.sql # Consultas de análisis
│
└── README.md