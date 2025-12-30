# Terraform con LocalStack - Proyecto de Prácticas

![Terraform Validate](https://github.com/Alicia1992-Lu/terraform-localstack-practica/actions/workflows/validate.yml/badge.svg)

Proyecto de infraestructura como código usando Terraform y LocalStack para simulación de AWS.

## Descripción

Este proyecto implementa infraestructura AWS simulada usando LocalStack, gestionada mediante Terraform con módulos reutilizables.

## Estructura del Proyecto
```
.
├── main.tf                    # Configuración principal con módulos
├── modules/
│   └── mi-recurso/           # Módulo reutilizable para buckets S3
│       ├── main.tf           # Recursos del módulo
│       ├── variables.tf      # Variables de entrada
│       └── outputs.tf        # Valores de salida
├── .github/
│   └── workflows/            # GitHub Actions workflows
│       ├── validate.yml      # Validación de Terraform
│       └── deploy.yml        # Deploy automatizado
├── README.md
├── CHANGELOG.md              # Historial de cambios
└── REBASE.md                 # Documentación de rebase
```

## Requisitos Previos

- Terraform >= 1.6.0
- LocalStack (última versión)
- AWS CLI configurado
- Git para versionado

## Instalación

### 1. Clonar el repositorio
```bash
git clone https://github.com/TU-USUARIO/terraform-localstack-practica.git
cd terraform-localstack-practica
```

### 2. Iniciar LocalStack
```bash
localstack start
```

### 3. Verificar LocalStack
```bash
curl http://localhost:4566/_localstack/health
```

## Uso

### Inicializar Terraform
```bash
terraform init
```

### Planificar cambios
```bash
terraform plan
```

### Aplicar infraestructura
```bash
terraform apply
```

### Verificar recursos creados
```bash
aws --endpoint-url=http://localhost:4566 s3 ls
```

### Destruir infraestructura
```bash
terraform destroy
```

## Recursos Creados

El proyecto despliega los siguientes recursos en LocalStack:

- 3 Buckets S3:
  - modulo-bucket-desarrollo - Entorno de desarrollo
  - modulo-bucket-produccion - Entorno de producción (con versionado)
  - modulo-bucket-testing - Entorno de testing

## Módulos

### modules/mi-recurso

Módulo reutilizable para crear buckets S3 con configuración personalizable.

**Variables:**
- bucket_name - Nombre del bucket
- environment - Entorno (dev, prod, test)
- enable_versioning - Habilitar versionado (bool)
- tags - Tags adicionales (map)

**Outputs:**
- bucket_id - ID del bucket
- bucket_arn - ARN del bucket
- bucket_domain_name - Nombre de dominio
- bucket_region - Región

**Ejemplo de uso:**
```hcl
module "my_bucket" {
  source = "./modules/mi-recurso"
  
  bucket_name       = "mi-bucket-ejemplo"
  environment       = "dev"
  enable_versioning = false
  
  tags = {
    Project = "Mi Proyecto"
    Owner   = "Equipo DevOps"
  }
}
```

## CI/CD

El proyecto incluye workflows de GitHub Actions:

- validate.yml - Valida la sintaxis de Terraform en cada push
- deploy.yml - Despliega automáticamente a LocalStack

## Versionado

Este proyecto sigue Semantic Versioning (https://semver.org/):

- MAJOR - Cambios incompatibles en la API
- MINOR - Nueva funcionalidad compatible
- PATCH - Correcciones de bugs

Ver CHANGELOG.md para el historial completo de cambios.

## Autor

- Alicia - Proyecto de prácticas ASIR DevOps

## Licencia

Este proyecto es parte de prácticas educativas.

## Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea tu rama de feature (git checkout -b feature/AmazingFeature)
3. Commit tus cambios (git commit -m 'Add: Amazing Feature')
4. Push a la rama (git push origin feature/AmazingFeature)
5. Abre un Pull Request

## Referencias

- Terraform Documentation: https://www.terraform.io/docs
- LocalStack Documentation: https://docs.localstack.cloud
- AWS CLI Documentation: https://aws.amazon.com/cli/
