variable "aws_account_id" {
  description = "Tu ID de cuenta de AWS donde reside la infraestructura."
  type        = string
  // Deberías reemplazar "TU_AWS_ACCOUNT_ID" con tu ID de cuenta real
  // o proporcionar este valor a través de un archivo .tfvars o variable de entorno.
  // default     = "TU_AWS_ACCOUNT_ID" // Ejemplo, mejor no poner default para datos sensibles o específicos de cuenta
}

variable "datadog_external_id" {
  description = "ID externo para la integración de Datadog AWS. Genera uno único y guárdalo en Datadog."
  type        = string
  sensitive   = true
  // Puedes generar un UUID o una cadena aleatoria segura.
  // Este valor debe coincidir con el que configures en la UI de Datadog para esta integración.
}

variable "datadog_aws_integration_role_name" {
  description = "Nombre del rol IAM que Datadog asumirá."
  type        = string
  default     = "DatadogIntegrationRole"
}

variable "datadog_api_key" {
  description = "Clave API de Datadog."
  type        = string
  sensitive   = true // Marca la variable como sensible para que no se muestre en logs
}

variable "datadog_app_key" {
  description = "Clave de Aplicación de Datadog."
  type        = string
  sensitive   = true // Marca la variable como sensible
}

variable "datadog_site" {
  description = "Sitio de Datadog (ej. datadoghq.com, datadoghq.eu). Usado por el agente."
  type        = string
  default     = "datadoghq.com" // Ajusta si tu sitio Datadog es diferente (ej. datadoghq.eu)
}
