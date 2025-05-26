# Inmobiliaria_MYSQL_Mateo_hoyos

🏡 Sistema de Gestión Inmobiliaria 
consiste en el diseño y desarrollo de una base de datos relacional para un sistema de gestión inmobiliaria. Su objetivo principal es centralizar y automatizar el manejo de la información relacionada con clientes (naturales y jurídicos), inmuebles, contratos de arrendamiento, pagos y agentes inmobiliarios.

## 📦 Entidades principales

| Tabla                    | Descripción                                             |
|--------------------------|---------------------------------------------------------|
| `cliente`                | Registra clientes naturales y jurídicos.               |
| `persona_juridica`       | Datos adicionales para clientes jurídicos.            |
| `representante_legal`    | Representantes de personas jurídicas.                 |
| `arrendadores`           | Relaciona clientes como propietarios.                 |
| `arrendatarios`          | Relaciona clientes como inquilinos.                   |
| `inmueble`               | Información básica del inmueble.                      |
| `caracteristicas`        | Detalles como habitaciones, baños, jardín, etc.       |
| `ubicacion`              | Dirección y ciudad del inmueble.                      |
| `contrato_arrendamiento` | Relación entre inmueble, arrendador y arrendatario.   |
| `pagos`                  | Pagos mensuales de cada contrato.                     |
| `agente_inmobilaraio`    | Agentes que gestionan inmuebles o contratos.          |
| `comisiones_agentes`     | Registro de comisiones ganadas por agentes.           |
| `tipo_documento`         | Tipos de documento (cédula, NIT, pasaporte).          |

## 🛠️ Herramientas utilizadas

- MySQL Workbench
- SQL
- Modelo EER
- Diagrama ER (Entidades y Relaciones)

---
Modelo EER
![image](https://github.com/user-attachments/assets/945a2554-db49-46c6-abbb-34b8035e35cd)

Diagrama 
![Diagrama ](https://github.com/user-attachments/assets/cb025c15-4105-4902-81dd-9b39ca9dbb19)




