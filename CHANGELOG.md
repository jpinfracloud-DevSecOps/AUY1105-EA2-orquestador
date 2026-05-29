# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo de acuerdo con los estándares de la evaluación y buenas prácticas de desarrollo.

### Cambiado
- 🔗 **Acoplamiento de Módulos Seguros:** Actualización de las fuentes en `main.tf` para apuntar explícitamente a los tags remotos estables de producción `?ref=v0.2.0` de los módulos de Redes y Cómputo.

## [0.1.0] - 2026-05-28

### Añadido
- **Arquitectura de Orquestación Central:** Creación del repositorio maestro encargado de enlazar ciclos de vida de infraestructura multi-módulo.
- **Invocación Remota de Módulos:** Configuración en `main.tf` para descargar e instalar los componentes de Redes y Cómputo directamente desde GitHub utilizando tags semánticos (`?ref=v0.1.0`).
- **Inyección Dinámica de Dependencias:** Conexión del output `public_subnet_id` (Redes) hacia el parámetro de entrada `subnet_id` (Cómputo), garantizando el desacoplamiento y enlace correcto de recursos.
- **Outputs Consolidados:** Definición de salidas para exponer la IP e ID de la instancia EC2 de forma centralizada al finalizar el despliegue.

## [0.2.0] - 2026-05-28

### Añadido
- 🛡️ **Orquestación de Gobernanza (OPA Global):** Integración de las reglas `policies/terraform_ssh_check.rego` y `policies/terraform_ec2_check.rego` para auditar de manera unificada el plan JSON consolidation de la infraestructura.
- 🚀 **Pipeline Multi-Capa (CI):** Automatización en `.github/workflows/ci.yml` que valida el formateo, consistencia estática y el cumplimiento estricto de las dos políticas de la EVA2 en un solo flujo de control.
- 
### Cambiado
- 🔗 **Acoplamiento de Módulos Seguros:** Actualización de las fuentes en `main.tf` para apuntar explícitamente a los tags remotos estables de producción `?ref=v0.2.0` de los módulos de Redes y Cómputo.
- ⚙️ **Optimización de Inicialización:** Ajuste en el comando del pipeline a `terraform init -upgrade` para forzar la sincronización limpia de submódulos remotos sin conflictos de caché.
- ### Solucionado
- 🛠️ **Homologación Sintáctica OPA v1.0:** Corrección de las políticas Rego adoptando los tokens explícitos `contains` e `if`, eliminando los conflictos de tipos de datos (`default violation`) provocados por la actualización del binario en GitHub Actions.
- 🔒 **Excepciones de Seguridad Auditadas (#8):** Implementación de comentarios de supresión quirúrgica (`# checkov:skip=CKV_TF_1`) en el `main.tf`. Esto permitió mitigar las alertas de hashes inmutables de Checkov, justificando técnicamente el uso de versionamiento semántico exigido por la rúbrica y logrando el aprobado ("Passed") real del pipeline.