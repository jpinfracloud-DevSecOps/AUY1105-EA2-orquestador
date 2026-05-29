# Orquestador Global de Infraestructura como Código (IaC) 🧠

Este repositorio actúa como el "cerebro" o código principal de la evaluación. Su propósito es consumir de forma remota los módulos independientes de **Redes** y **Cómputo** almacenados en GitHub, resolver sus dependencias cruzadas y ejecutar el despliegue unificado y real de la infraestructura en AWS.

## Requisitos Previos

1. Tener configuradas las credenciales temporales de AWS Academy en el entorno local (`~/.aws/credentials` o variables de entorno).
2. Conectividad a internet para permitir a Terraform clonar los módulos remotos.

## Flujo de Despliegue

1. **Inicialización:** Descarga los proveedores y clona los módulos de GitHub:
   ```bash
   terraform init

   🎯 Filosofía de Diseño y Principios de Arquitectura (Repositorio Maestro)

Este orquestador es la culminación de una estrategia de diseño basada en la sostenibilidad, gobernanza y orden sistémico, regida por tres principios esenciales:

    Persistencia (Enlace Seguro y Coordinado): Rechazamos el despliegue artesanal y fragmentado. La persistencia de una plataforma radica en su predictibilidad. Este repositorio coordina de forma segura la salida del módulo de redes con la entrada del módulo de cómputo, garantizando que toda la infraestructura nazca de manera ordenada, estructurada y reproducible en cualquier momento del ciclo de vida del software.

    Escalabilidad (Gobernanza Centralizada): Un sistema elástico debe poder replicarse enteramente. Al centralizar la invocación de módulos y parametrizar las variables críticas globales (región, tipo de instancia, nombres), este orquestador permite clonar o escalar entornos completos (Desarrollo, QA, Producción) en cuestión de minutos, mutando las variables sin alterar el comportamiento de los bloques constructores.

    Reutilización (Ensamblaje Modular Eficiente): Compartimos la premisa de que si un componente es excelente, debe ser reutilizado. Este repositorio es la prueba empírica del poder de la modularidad: en lugar de escribir cientos de líneas repetitivas, consumimos "cajas negras" preexistentes en la nube. Automatizamos el ensamble para construir soluciones complejas con un esfuerzo mínimo de código, optimizando los tiempos de entrega en ingeniería de plataformas.