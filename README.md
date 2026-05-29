# 🧠 Orquestador Global de Infraestructura como Código (IaC)
## 📑 Evaluación Parcial 2 - EVP-IaC-II

### 1. 🎯 Objetivos del Repositorio
* **🔗 Centralización:** Actuar como el núcleo maestro encargado de enlazar y coordinar el ciclo de vida de plataformas multi-módulo.
* **📐 Gobernanza Global:** Abstraer las variables críticas del sistema (región, nombres, tipos de hardware) para aprovisionar entornos replicables desde un único punto de control.
* **🧩 Inyección de Dependencias:** Conectar dinámicamente las salidas del ecosistema de redes con las entradas de cómputo, eliminando el acoplamiento duro.
* **🛡️ Gobernanza Multi-Capa Activa:** Consolidar e interceptar las políticas de seguridad perimetral y costos corporativos en un solo motor de evaluación centralizado antes del despliegue.

### 2. 🔌 Propósito General del Código
Este repositorio es el "cerebro" o código principal de la arquitectura. Su diseño está orientado a consumir e interconectar bloques constructores remotos mediante las siguientes acciones:
* **📡 Consumo Remoto de Módulos:** Descarga e instala los componentes de **Redes** y **Cómputo** directamente desde sus repositorios en GitHub utilizando versionamiento semántico formal e inquebrantable (`?ref=v0.2.0`).
* **🔄 Resolución Dinámica de Red:** Extrae el ID de subred pública directamente de la lista generada por el módulo base (`module.redes.subnet_ids[0]`) y lo inyecta en el servidor para garantizar el direccionamiento perimetral correcto.
* **🤖 Pipeline de Integración Continua (CI Global):** Automatización en GitHub Actions que ejecuta `terraform init -upgrade` para forzar la descarga de los módulos remotos, evalúa la sintaxis general y corre **Open Policy Agent (OPA)** de forma integral para validar que se cumplan las políticas de costo (EC2 `t2.micro`) y seguridad (Bloqueo de SSH universal `0.0.0.0/0`).

---

### 3. 🚀 Instrucciones Básicas de Uso

Para desplegar la infraestructura completa utilizando este orquestador, se debe clonar este repositorio maestro y contar con credenciales activas de AWS. La invocación interna de los submódulos remotos opera de la siguiente forma automatizada en el `main.tf`:

```hcl
# Bloque del Orquestador que unifica el ecosistema
module "redes" {
  source = "git::[https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git?ref=v0.1.0](https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-redes.git?ref=v0.1.0)"
}

module "computo" {
  source    = "git::[https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git?ref=v0.1.0](https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-computo.git?ref=v0.1.0)"
  subnet_id = module.redes.subnet_ids[0] # Enlace automatizado con extracción del índice de la lista
}
```

### 4. 🗺️ Despliegue Paso a Paso

- Si deseas probar o utilizar este módulo en un entorno de desarrollo local, sigue estas instrucciones detalladas:

1. 👥 Clonar el repositorio:
    Clona este módulo dentro de tu espacio de trabajo local o directorio de proyectos:

    ```bash
    git clone [https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-orquestador.git](https://github.com/jpinfracloud-DevSecOps/AUY1105-EA2-orquestador.git)
    
2. 🔑 Configurar Credenciales de AWS:
Asegúrate de tener configuradas tus credenciales de AWS en tu terminal de Git Bash (vía aws configure o exportando las variables de entorno de AWS Academy/Laboratorio).

    - Option A: Usando Variables de Entorno (Recomendado para laboratorios)
    ```hcl
    export AWS_ACCESS_KEY_ID="TU_ACCESS_KEY_AQUÍ"
    export AWS_SECRET_ACCESS_KEY="TU_SECRET_KEY_AQUÍ"
    export AWS_SESSION_TOKEN="TU_SESSION_TOKEN_AQUÍ"
    ```
    - Option B: Usando el cliente oficial de AWS CLI
     ```hcl
    aws configure
    # Te solicitará el Access Key, Secret Key y la región por defecto (us-east-1)  
    ```
1. 📂 **Navegar al directorio de pruebas:**
Accede a la carpeta de ejemplos configurada para validar el módulo:
    ```hcl
    cd AUY1105-EA2-orquestador
    ```
1. ⚙️ **Inicializar Terraform:**(Descarga Remota):
Ejecuta el comando de inicialización para descargar los proveedores necesarios (hashicorp/aws):
    ```hcl
    terraform init
    ```
1. 🔍 **Validar la Sintaxis Cruzada:**
Comprueba que la configuración no tenga errores de escritura o arquitectura local:
    ```hcl
    terraform validate
    ```
1. 📝 **Generar Plan de Ejecución Global:**
Visualiza el mapa de topología completo (Redes + EC2) que se creará de forma unificada en AWS:
    ```hcl
    terraform plan
    ```
1. 🚀 **Aplicar la Infraestructura Unificada:**
Despliega todo el ecosistema modular en la nube de AWS (requiere confirmación escribiendo yes):
    ```hcl
    terraform apply
    ```

🎯 Filosofía de Diseño y Principios de Arquitectura (Repositorio Maestro)

Este orquestador es la culminación de una estrategia de ingeniería orientada a la sostenibilidad, gobernanza y orden sistémico, regida por tres principios esenciales:

1. Persistencia (Enlace Seguro y Coordinado): Rechazamos el despliegue artesanal, fragmentado o inmediato. La persistencia de una plataforma radica en su predictibilidad. Este repositorio coordina de forma segura la salida estructurada del módulo de redes con la entrada del hardware de cómputo, garantizando que toda la infraestructura nazca de manera ordenada y reproducible en cualquier etapa del ciclo de vida del software.

2. Escalabilidad (Gobernanza Centralizada): Un sistema elástico debe ser capaz de replicarse enteramente sin fricción. Al centralizar la invocación de módulos y parametrizar las variables críticas globales (región, tipos de instancia, AMIs), este orquestador permite clonar o escalar entornos completos (Desarrollo, QA, Producción) en cuestión de minutos, mutando variables de entrada sin alterar el comportamiento interno de los bloques constructores remotos.

3. Reutilización (Ensamblaje Modular Eficiente): Compartimos la premisa de que si un componente de infraestructura es excelente, debe ser universal. Este repositorio es la prueba empírica del poder de la modularidad: en lugar de escribir cientos de líneas de código repetitivas, consumimos "cajas negras" preexistentes en la nube, automatizando el ensamble para construir soluciones robustas con un esfuerzo mínimo de código y optimizando drásticamente los tiempos de entrega.