terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # O la versión que estés utilizando
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0" # Verifica la última versión compatible
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  # api_url = var.datadog_site // Opcional, DD_SITE también funciona como var de entorno. Ej: "datadoghq.eu"
                              // Si tu DD_SITE es datadoghq.com, generalmente no necesitas api_url aquí.
}
