# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [1.1.0] - 2026-01-02

### Añadido
- Comentarios explicativos detallados en `main.tf`
- Información de versión en el código fuente
- Documentación inline para facilitar mantenimiento

### Mejorado
- Estructura de comentarios más clara y organizada
- Documentación del propósito de cada módulo
- Referencias a los cambios de versión en el código

### Documentación
- CHANGELOG.md añadido para tracking de versiones
- Comentarios de versión en archivos principales
- Mejoras en la legibilidad del código

## [1.0.0] - 2026-01-02

### Añadido
- Configuración inicial de Terraform con LocalStack
- Módulo reutilizable `modules/mi-recurso/` para buckets S3
  - `main.tf` - Definición de recursos
  - `variables.tf` - Variables parametrizables
  - `outputs.tf` - Valores de salida
- Tres instancias del módulo:
  - `bucket_dev` - Entorno de desarrollo
  - `bucket_prod` - Entorno de producción (con versionado)
  - `bucket_test` - Entorno de testing
- GitHub Actions workflows:
  - `validate.yml` - Validación automática de Terraform
  - `deploy.yml` - Deploy automatizado a LocalStack
- Documentación completa:
  - `README.md` - Guía de uso del proyecto
  - `REBASE.md` - Documentación de Git rebase
- Archivo `.gitignore` configurado para Terraform

### Configuración
- Provider AWS apuntando a LocalStack (http://localhost:4566)
- Credenciales dummy para desarrollo local
- Región configurada: us-east-1
- S3 path style habilitado para compatibilidad con LocalStack

### Infraestructura
- 3 buckets S3 creados mediante módulo
- Versionado condicional (solo en producción)
- Tags estandarizados:
  - `Name` - Identificador del recurso
  - `Environment` - Entorno (dev/prod/test)
  - `ManagedBy` - "Terraform-Module"
  - Tags personalizados por entorno

### CI/CD
- Validación automática en push y pull requests
- Deploy automático a LocalStack en push a main
- Health checks de LocalStack en workflows
- Verificación de recursos creados con AWS CLI
- Resúmenes personalizados en GitHub Actions

### Características Técnicas
- **Terraform**: ~> 5.0
- **LocalStack**: Última versión
- **Servicios habilitados**: S3
- **Backends**: Local (sin remote state)

## Tipos de Cambios

- **Añadido** - Nueva funcionalidad
- **Cambiado** - Cambios en funcionalidad existente
- **Deprecated** - Funcionalidad que será removida
- **Removido** - Funcionalidad eliminada
- **Arreglado** - Corrección de bugs
- **Seguridad** - Vulnerabilidades o mejoras de seguridad

## Links de Comparación

[1.1.0]: https://github.com/Alicia1992-Lu/terraform-localstack-practica/compare/v1.0...v1.1
[1.0.0]: https://github.com/Alicia1992-Lu/terraform-localstack-practica/releases/tag/v1.0
