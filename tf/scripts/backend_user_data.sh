#!/bin/bash
yum update -y
sudo yum install -y docker

# Iniciar el servicio de Docker
sudo service docker start

# Descargar y descomprimir el archivo backend.zip desde S3
aws s3 cp s3://ai4devs-project-code-bucket/backend.zip /home/ec2-user/backend.zip
unzip /home/ec2-user/backend.zip -d /home/ec2-user/

# Construir la imagen Docker para el backend
cd /home/ec2-user/backend
# Asumiendo que tienes un Dockerfile en backend.zip
if [ -f Dockerfile ]; then
  sudo docker build -t lti-backend .
  # Ejecutar el contenedor Docker
  sudo docker run -d -p 8080:8080 lti-backend
else
  echo "Dockerfile no encontrado en backend.zip, no se puede construir ni ejecutar la aplicación backend."
fi
cd /home/ec2-user/ # Volver al home del ec2-user

# --- Inicio: Instalación del Agente Datadog ---
echo "Instalando el agente Datadog..."
export DD_API_KEY="${datadog_api_key}"
export DD_SITE="${datadog_site}"

# Instalar el agente Datadog
bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"

# Configurar tags básicos para el agente
# Estos tags se añadirán a todas las métricas, trazas y logs enviados por este agente.
# Es una buena práctica alinear estos tags con los tags de la instancia EC2 si es posible.
# Los tags de host de EC2 se recopilan automáticamente si la integración de AWS está configurada correctamente.
# Aquí añadimos tags adicionales directamente en la configuración del agente.
sudo sed -i 's/# tags:/tags:/' /etc/datadog-agent/datadog.yaml
sudo sed -i '/^tags:/a \  - "environment:development"' /etc/datadog-agent/datadog.yaml
sudo sed -i '/^tags:/a \  - "project:ai4devs-monitoring-dad"' /etc/datadog-agent/datadog.yaml
sudo sed -i '/^tags:/a \  - "service:lti-backend"' /etc/datadog-agent/datadog.yaml # Coincide con el tag dd_service

# Habilitar la recolección de logs (opcional, pero recomendado)
# Asegúrate de que tu aplicación Docker (lti-backend) escriba logs a stdout/stderr
# para que el agente los pueda recolectar si configuras la recolección de logs de Docker.
echo "Habilitando recolección de logs del agente..."
sudo tee /etc/datadog-agent/conf.d/docker.d/conf.yaml > /dev/null <<EOF
logs:
  - type: docker
    service: lti-backend # Asocia los logs a este servicio en Datadog
    source: docker
EOF

# Habilitar Live Processes (opcional)
# echo "Habilitando Live Processes..."
# sudo sed -i 's/# process_config.enabled: false/process_config.enabled: true/' /etc/datadog-agent/datadog.yaml
# O, si la línea anterior no funciona (depende de la versión de datadog.yaml):
# sudo tee -a /etc/datadog-agent/datadog.yaml > /dev/null <<EOF
# process_config:
#   enabled: true
# EOF

# Reiniciar el agente Datadog para aplicar los cambios
sudo systemctl restart datadog-agent
# Asegurar que el agente inicie en el arranque
sudo systemctl enable datadog-agent
echo "Agente Datadog instalado y configurado."
# --- Fin: Instalación del Agente Datadog ---

# Timestamp to force update
echo "Timestamp: ${timestamp}"
