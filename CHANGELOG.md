# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo de acuerdo con los estándares de la evaluación y buenas prácticas de desarrollo.

## [0.1.0] - 2026-05-28

### Added
- **Arquitectura de Orquestación Central:** Creación del repositorio maestro encargado de enlazar ciclos de vida de infraestructura multi-módulo.
- **Invocación Remota de Módulos:** Configuración en `main.tf` para descargar e instalar los componentes de Redes y Cómputo directamente desde GitHub utilizando tags semánticos (`?ref=v0.1.0`).
- **Inyección Dinámica de Dependencias:** Conexión del output `public_subnet_id` (Redes) hacia el parámetro de entrada `subnet_id` (Cómputo), garantizando el desacoplamiento y enlace correcto de recursos.
- **Outputs Consolidados:** Definición de salidas para exponer la IP e ID de la instancia EC2 de forma centralizada al finalizar el despliegue.