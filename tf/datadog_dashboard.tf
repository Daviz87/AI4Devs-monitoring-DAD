resource "datadog_dashboard" "ec2_overview_dashboard" {
  title        = "Visión General EC2 - LTI Project (Terraform)"
  description  = "Dashboard básico para monitorizar instancias EC2 del proyecto LTI, gestionado por Terraform."
  layout_type  = "ordered"
  is_read_only = false // Cambiar a true si el dashboard solo se gestionará vía Terraform en producción

  template_variable {
    name    = "host"
    prefix  = "host"
    default = "*" // Muestra todos los hosts por defecto
  }
  
  template_variable {
    name    = "environment"
    prefix  = "dd_env" // Usando el tag que definimos en las instancias
    default = "*"
  }

  widget {
    definition {
      timeseries_definition {
        title = "Uso de CPU (%) por Host"
        show_legend = true
        legend_layout = "auto"
        legend_columns = ["avg", "max", "value"]
        
        request {
          q            = "avg:aws.ec2.cpuutilization{dd_env:$environment,host:$host} by {host}"
          display_type = "line"
          style {
            palette    = "dog_classic"
            line_type  = "solid"
            line_width = "normal"
          }
        }
      }
    }
    layout { x = 0, y = 0, width = 6, height = 2 }
  }

  widget {
    definition {
      timeseries_definition {
        title = "Tráfico de Red (Bytes/s) por Host"
        show_legend = true
        
        request {
          q            = "avg:aws.ec2.network_in{dd_env:$environment,host:$host} by {host}.as_rate(), avg:aws.ec2.network_out{dd_env:$environment,host:$host} by {host}.as_rate()"
          display_type = "line"
          style {
            palette    = "ocean"
            line_type  = "solid"
            line_width = "normal"
          }
        }
      }
    }
    layout { x = 6, y = 0, width = 6, height = 2 }
  }

  widget {
    note_definition {
      content = "Este dashboard muestra métricas clave de las instancias EC2. Filtrar por `host` o `dd_env` usando las variables en la parte superior."
      background_color = "yellow"
      font_size = "14"
      text_align = "left"
      show_tick = true
      tick_edge = "left"
      tick_pos = "50%"
    }
    layout {x = 0, y = 2, width = 12, height = 1}
  }
}
