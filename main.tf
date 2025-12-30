# main.tf - Tarea 4: Uso de módulos

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

# Uso del módulo: Bucket para desarrollo
module "bucket_dev" {
  source = "./modules/mi-recurso"

  bucket_name        = "modulo-bucket-desarrollo"
  environment        = "dev"
  enable_versioning  = false

  tags = {
    Project = "Practica Terraform"
    Owner   = "Alicia"
    Team    = "DevOps"
  }
}

# Uso del módulo: Bucket para producción
module "bucket_prod" {
  source = "./modules/mi-recurso"

  bucket_name        = "modulo-bucket-produccion"
  environment        = "prod"
  enable_versioning  = true

  tags = {
    Project      = "Practica Terraform"
    Owner        = "Alicia"
    Team         = "DevOps"
    CriticalData = "true"
  }
}

# Uso del módulo: Bucket para testing
module "bucket_test" {
  source = "./modules/mi-recurso"

  bucket_name        = "modulo-bucket-testing"
  environment        = "test"
  enable_versioning  = false

  tags = {
    Project   = "Practica Terraform"
    Owner     = "Alicia"
    Team      = "QA"
    Temporary = "true"
  }
}

# Outputs para ver los resultados
output "bucket_dev_id" {
  description = "ID del bucket de desarrollo"
  value       = module.bucket_dev.bucket_id
}

output "bucket_prod_id" {
  description = "ID del bucket de producción"
  value       = module.bucket_prod.bucket_id
}

output "bucket_test_id" {
  description = "ID del bucket de testing"
  value       = module.bucket_test.bucket_id
}

output "all_bucket_arns" {
  description = "ARNs de todos los buckets creados"
  value = {
    dev  = module.bucket_dev.bucket_arn
    prod = module.bucket_prod.bucket_arn
    test = module.bucket_test.bucket_arn
  }
}
