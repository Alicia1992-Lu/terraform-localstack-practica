# modules/mi-recurso/variables.tf
# Variables de entrada para el módulo

variable "bucket_name" {
  description = "Nombre del bucket S3 a crear"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "enable_versioning" {
  description = "Habilitar versionado en el bucket"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags adicionales para el bucket"
  type        = map(string)
  default     = {}
}
