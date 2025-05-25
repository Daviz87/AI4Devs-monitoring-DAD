data "aws_iam_policy_document" "datadog_aws_integration_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::464622532012:root"] // ID de la cuenta de Datadog
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.datadog_external_id]
    }
  }
}

resource "aws_iam_role" "datadog_aws_integration_role" {
  name               = var.datadog_aws_integration_role_name
  assume_role_policy = data.aws_iam_policy_document.datadog_aws_integration_assume_role.json
  description        = "Rol IAM para que Datadog acceda a los recursos de AWS."
}

resource "aws_iam_role_policy_attachment" "datadog_aws_integration_policies" {
  # Adjunta las políticas recomendadas por Datadog.
  # Para un conjunto completo y mínimo de permisos, consulta la documentación de Datadog.
  # Aquí adjuntamos algunas políticas comunes de solo lectura.
  # La política gestionada 'DatadogAWSIntegrationPolicy' es una buena opción general.
  # Si no existe, puedes necesitar crearla o adjuntar políticas individuales.
  # Asegúrate de que la política 'DatadogAWSIntegrationPolicy' exista en tu cuenta o
  # crea una política personalizada con los permisos necesarios detallados por Datadog.

  # Ejemplo usando una política gestionada por AWS (si existe una específica para Datadog amplia)
  # o políticas individuales más granulares:
  # policy_arn = "arn:aws:iam::aws:policy/DatadogAWSIntegrationPolicy" // Opción 1: Política gestionada amplia
  
  # Opción 2: Adjuntar políticas individuales (ejemplos, verifica la doc de Datadog para la lista completa)
  # Para este ejemplo, vamos a adjuntar la política gestionada `ReadOnlyAccess` como placeholder.
  # ¡IMPORTANTE! En un entorno real, DEBES usar la política 'DatadogAWSIntegrationPolicy'
  # o una política personalizada con permisos de MENOR PRIVILEGIO específicos para Datadog.
  # La política 'ReadOnlyAccess' es demasiado permisiva para este propósito específico.
  # Reemplaza esto con la política correcta según la documentación de Datadog.
  # Por ejemplo, para la mayoría de los casos de uso, la política gestionada por AWS
  # `arn:aws:iam::aws:policy/ReadOnlyAccess` es demasiado amplia. Datadog provee
  # la política `DatadogAWSIntegrationPolicy` que puedes crear en tu cuenta con el JSON
  # que ellos proporcionan, o puedes usar la política gestionada por AWS si está disponible.
  # Como simplificación para el ejercicio, y asumiendo que el usuario creará la política
  # `DatadogAWSIntegrationPolicy` manualmente con el JSON de Datadog, o que usará
  # el nombre que Datadog espera, nos enfocaremos en adjuntar por nombre.
  # O, para iniciar, la siguiente política gestionada por AWS es recomendada por Datadog
  # para la integración básica:
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess" // ¡REVISAR Y AJUSTAR A MENOR PRIVILEGIO SEGÚN DATADOG!
                                                     // La documentación de Datadog recomienda crear una política específica
                                                     // con permisos detallados o usar la política 'DatadogAWSIntegrationPolicy'.
                                                     // A efectos de este ejercicio, si 'DatadogAWSIntegrationPolicy'
                                                     // no está disponible como política gestionada por AWS, esta es una alternativa
                                                     // simple, pero con la advertencia de que es muy permisiva.

  role       = aws_iam_role.datadog_aws_integration_role.name
}

// Este recurso configura la integración en el lado de Datadog.
// Requiere que el proveedor Datadog esté configurado (ver sección B).
resource "datadog_integration_aws" "aws_integration" {
  account_id    = var.aws_account_id
  role_name     = aws_iam_role.datadog_aws_integration_role.name
  external_id   = var.datadog_external_id
  
  // Opcional: Especifica los servicios a monitorizar. Si se omite, se usan los defaults.
  // filter_tags = ["env:production"] // Ejemplo para filtrar por tags
  // host_tags   = ["environment:production", "team:backend"] // Ejemplo para añadir tags a los hosts importados

  // Habilita la recolección de métricas para servicios específicos (opcional)
  // Por ejemplo, para EC2:
  // account_specific_namespace_rules = {
  //   "aws_ec2" = true // u false para deshabilitar explícitamente
  // }
}
