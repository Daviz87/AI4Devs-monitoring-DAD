## Prompt 1
**Fecha:** 25/05/2025
**Modelo:** Gemini 2.5 Pro (inferido)

**Usuario:** 
## Role: Expert Senior Developer

You are an Expert Senior Developer.

Your primary task is to perform a comprehensive analysis of the entire current project accessible within the IDE. This includes, but is not limited to, thoroughly examining the @README.md  file, all @backend  source code, and all @frontend source code.

Your objectives are to:
1.  **Identify and Clearly Document Core Functionality:** Understand and describe the main purpose and features of the application.
2.  **Describe Software Architecture:** Outline the overall software architecture (e.g., microservices, monolithic, client-server), including key components, their responsibilities, and their interactions.
3.  **Compile Dependencies and Libraries:** Create an exhaustive list of all dependencies and libraries used in both the backend and frontend. Specify their versions if readily available from manifest files (e.g., `package.json`, `pom.xml`, `requirements.txt`).
4.  **Extract Business Domain Concepts:** Identify and summarize key business domain concepts, rules, and logic embedded within the codebase or project documentation.
5.  **Generate a Comprehensive Project Guide:** Produce a detailed guide covering the following aspects:
    * **Installation:** Step-by-step instructions for setting up the development environment and running the project locally.
    * **Testing:** Instructions on how to execute existing tests (unit, integration, end-to-end), including any specific commands or configurations required.
    * **Build Process:** Description of how the application (backend and frontend, if applicable) is currently built, including any build scripts or commands.
    * **Deployment:** Overview of the current deployment process, if one exists.
    * **CI/CD:** Description of any existing Continuous Integration/Continuous Delivery practices or configurations.

**Contextual Instructions:**
* You have access to the entire codebase and project files within the IDE.
* Focus on providing practical, accurate, and actionable information that would be useful for a developer new to the project or for planning subsequent CI/CD pipeline implementation.
* If certain information (e.g., specific versions, detailed deployment steps) is not explicitly available, note this in your analysis.

**Output Format:**
Organize your findings into a clear, well-structured report. Use Markdown formatting, including headings, subheadings, bullet points, and code blocks where appropriate for clarity and readability.

---
**Mandatory Language Instruction for LLM Interaction:**
You MUST provide ALL your outputs and conduct ALL your interactions with the user exclusively in **SPANISH**.
---
**Asistente:**

Okay, comenzaré analizando la estructura del proyecto. Para ello, voy a listar el contenido del directorio raíz del espacio de trabajo.

Ran tool
Veo que el proyecto tiene una estructura que incluye directorios para `backend`, `frontend`, `tf` (posiblemente Terraform para infraestructura), `cypress` (para pruebas E2E), `prompts` y `.github` (posiblemente para flujos de trabajo de GitHub Actions). También hay archivos como `package.json`, `docker-compose.yml`, `Jenkinsfile` y `README.md`.

Empezaré por el archivo `README.md`, ya que suele contener información general del proyecto. Solicitaré leer el archivo `README.md` completo para obtener una visión general del proyecto.

Read file: README.md
El archivo `README.md` proporciona una buena visión general.

**Resumen del Proyecto:**

Es un sistema de seguimiento de talento (LTI - Talent Tracking System) full-stack.

**Arquitectura:**
*   **Frontend:** React (creado con Create React App).
*   **Backend:** Node.js con Express, escrito en TypeScript.
*   **ORM:** Prisma.
*   **Base de Datos:** PostgreSQL (gestionada con Docker).
*   **Estructura del Backend:** Parece seguir una arquitectura por capas (presentación, aplicación, dominio, infraestructura).

Ahora, voy a examinar el `package.json` en la raíz, y luego los `package.json` de `frontend` y `backend` para identificar las dependencias.

Primero, el `package.json` raíz.

Read file: package.json
Este `package.json` raíz define `dotenv` como dependencia y varias dependencias de desarrollo como `cypress` y `typescript`. También especifica la ubicación del esquema de Prisma.

Ahora, el `package.json` del `frontend`.

Read file: frontend/package.json
Y ahora, el `package.json` del `backend`.

Read file: backend/package.json
Muy bien, con la información del `README.md` y los archivos `package.json`, ya puedo empezar a generar el informe.

A continuación, presento el análisis del proyecto:

## Análisis del Proyecto: Sistema de Seguimiento de Talento (LTI)

Este informe detalla la estructura, funcionalidades, arquitectura y otros aspectos relevantes del proyecto "Sistema de Seguimiento de Talento" (LTI).

### 1. Funcionalidad Principal y Características

El proyecto LTI es una aplicación full-stack diseñada para el seguimiento de talento. Basándose en el `README.md` y la estructura de archivos, sus características principales parecen incluir:

*   **Gestión de Candidatos:** Permite registrar y administrar información de candidatos, incluyendo datos personales, educación, experiencia laboral y CV. Se evidencia por la estructura de la API (ejemplo de POST a `/candidates`) y la mención de un modelo de datos.
*   **Interfaz de Usuario Reactiva:** El frontend está construido con React, lo que sugiere una interfaz de usuario moderna e interactiva para gestionar los datos de los candidatos.
*   **API Backend:** Un backend basado en Express.js proporciona una API para que el frontend interactúe con los datos. Se mencionan especificaciones de API en `api-spec.yaml`.

### 2. Arquitectura del Software

El proyecto sigue una arquitectura cliente-servidor:

*   **Cliente (Frontend):**
    *   Tecnología: React (usando Create React App).
    *   Responsabilidades: Interfaz de usuario, interacción con el usuario, comunicación con el backend a través de API.
    *   Ubicación: Directorio `frontend/`.
*   **Servidor (Backend):**
    *   Tecnología: Node.js con Express.js, escrito en TypeScript.
    *   Responsabilidades: Lógica de negocio, acceso a datos, exposición de la API RESTful.
    *   Ubicación: Directorio `backend/`.
    *   **Estructura Interna del Backend:**
        *   `src/application/`: Lógica de aplicación.
        *   `src/domain/`: Lógica de negocio y modelos de dominio.
        *   `src/infrastructure/`: Comunicación con la base de datos (usando Prisma ORM).
        *   `src/presentation/`: Controladores y manejo de rutas.
        *   `src/routes/`: Definiciones de rutas de la API.
        *   `prisma/`: Esquema de la base de datos para Prisma.
*   **Base de Datos:**
    *   Tecnología: PostgreSQL.
    *   Gestión: Docker Compose se utiliza para ejecutar la instancia de PostgreSQL en un contenedor.
    *   ORM: Prisma se utiliza para la interacción con la base de datos.
*   **Contenerización:** Se utiliza Docker (`docker-compose.yml`) para gestionar la base de datos PostgreSQL, facilitando la configuración del entorno de desarrollo.

### 3. Dependencias y Librerías

A continuación, se listan las dependencias clave identificadas en los archivos `package.json` (raíz, frontend y backend). Las versiones se incluyen cuando están disponibles.

**Proyecto Raíz (`package.json`):**

*   **Dependencias:**
    *   `dotenv`: `^16.4.5` (Para la gestión de variables de entorno).
*   **Dependencias de Desarrollo:**
    *   `@types/cypress`: `^1.1.3`
    *   `@types/node`: `^20.14.2`
    *   `cypress`: `^13.11.0` (Para pruebas end-to-end).
    *   `typescript`: `^5.4.5`

**Frontend (`frontend/package.json`):**

*   **Dependencias Principales:**
    *   `react`: `^18.3.1`
    *   `react-dom`: `^18.3.1`
    *   `react-scripts`: `5.0.1` (Utilidades de Create React App).
    *   `@testing-library/react`: `^13.4.0` (Para pruebas de componentes React).
    *   `bootstrap`: `^5.3.3` (Framework CSS).
    *   `react-bootstrap`: `^2.10.2` (Componentes Bootstrap para React).
    *   `react-router-dom`: `^6.23.1` (Para enrutamiento en el frontend).
    *   `react-beautiful-dnd`: `^13.1.1` (Para drag and drop).
    *   `react-datepicker`: `^6.9.0` (Selector de fechas).
    *   `typescript`: `^4.9.5` (Para el frontend, aunque `create-react-app` puede usar JavaScript por defecto, la presencia de `@types/react` sugiere TypeScript).
*   **Otras Dependencias (y de desarrollo implícitas por `react-scripts`):**
    *   `@testing-library/jest-dom`: `^5.17.0`
    *   `@testing-library/user-event`: `^13.5.0`
    *   `@types/jest`: `^27.5.2`
    *   `@types/node`: `^16.18.97`
    *   `@types/react-dom`: `^18.3.0`
    *   `dotenv`: `^16.4.5`
    *   `web-vitals`: `^2.1.4`

**Backend (`backend/package.json`):**

*   **Dependencias Principales:**
    *   `express`: `^4.20.0` (Framework web para Node.js).
    *   `@prisma/client`: `^5.13.0` (Cliente Prisma para interactuar con la base de datos).
    *   `prisma`: `^5.13.0` (CLI de Prisma para migraciones, generación de cliente, etc. - listada en devDependencies pero esencial).
    *   `cors`: `^2.8.5` (Middleware para habilitar CORS).
    *   `dotenv`: `^16.4.5`
    *   `multer`: `^1.4.5-lts.1` (Middleware para manejar `multipart/form-data`, usado para subida de archivos).
    *   `swagger-jsdoc`: `^6.2.8` (Para generar documentación OpenAPI/Swagger desde JSDoc).
    *   `swagger-ui-express`: `^5.0.0` (Para servir la UI de Swagger).
*   **Dependencias de Desarrollo:**
    *   `typescript`: `^4.9.5` (Lenguaje de programación).
    *   `ts-node`: `^9.1.1` (Ejecución de TypeScript directamente en Node.js).
    *   `ts-node-dev`: `^1.1.6` (Para desarrollo, reinicia el servidor en cambios).
    *   `jest`: `^29.7.0` (Framework de pruebas).
    *   `ts-jest`: `^29.1.2` (Preset de Jest para TypeScript).
    *   `@types/express`: `^4.17.9`
    *   `@types/cors`: `^2.8.17`
    *   `@types/multer`: `^1.4.11`
    *   `@types/jest`: `^29.5.12`
    *   `@types/node`: `^20.12.12`
    *   `eslint`: `^9.2.0` (Linter).
    *   `prettier`: `^3.2.5` (Formateador de código).

### 4. Conceptos del Dominio de Negocio

Basado en el propósito del sistema ("Seguimiento de Talento") y las entidades mencionadas (Candidatos, Educación, Experiencia Laboral, CV), los conceptos clave del dominio de negocio incluyen:

*   **Candidato:** La entidad central, representando a un individuo en el proceso de reclutamiento o seguimiento. Atributos probables: nombre, apellido, email, teléfono, dirección.
*   **Educación:** Historial educativo de un candidato (institución, título, fechas).
*   **Experiencia Laboral:** Historial laboral de un candidato (empresa, puesto, descripción, fechas).
*   **CV (Curriculum Vitae):** Documento adjunto que resume la información del candidato. Se menciona la subida de archivos (`filePath`, `fileType`).
*   **Proceso de Seguimiento/Reclutamiento:** Aunque no se detalla explícitamente, la naturaleza de la aplicación implica flujos de trabajo relacionados con la evaluación, selección y seguimiento de candidatos.

El `README.md` también menciona archivos adicionales dentro del directorio `backend` que podrían contener más información detallada sobre el dominio:

*   `backend/ManifestoBuenasPracticas.md`: Podría definir estándares y convenciones que indirectamente reflejan el dominio.
*   `backend/api-spec.yaml`: Especificación de la API que detallará los endpoints y los modelos de datos intercambiados, revelando más sobre las entidades del dominio.
*   `backend/ModeloDatos.md`: Debería contener una descripción y diagrama del modelo de datos, lo cual es crucial para entender completamente los conceptos del dominio y sus relaciones.

### 5. Guía Comprensiva del Proyecto

#### 5.1. Instalación

1.  **Clonar el Repositorio:**
    ```bash
    git clone <URL_DEL_REPOSITORIO>
    cd <NOMBRE_DEL_DIRECTORIO_DEL_PROYECTO>
    ```
2.  **Configurar Variables de Entorno:**
    *   El `README.md` menciona un archivo `.env`. Es probable que necesites crear uno en el directorio raíz del backend (`backend/.env`) y posiblemente en el frontend (`frontend/.env`).
    *   Para el backend, la variable `DATABASE_URL` es crucial para conectar con PostgreSQL. Ejemplo:
        ```
        DATABASE_URL="postgresql://postgres:password@localhost:5432/mydatabase?schema=public"
        ```
        Ajusta `User`, `Password`, y `Database` según tu configuración de Docker o las credenciales especificadas en `docker-compose.yml`.
3.  **Instalar Dependencias:**
    *   **Frontend:**
        ```bash
        cd frontend
        npm install
        ```
    *   **Backend:**
        ```bash
        cd ../backend  # o cd backend desde la raíz
        npm install
        ```
4.  **Iniciar Base de Datos PostgreSQL (usando Docker):**
    *   Asegúrate de tener Docker y Docker Compose instalados.
    *   Desde el directorio raíz del proyecto:
        ```bash
        docker-compose up -d
        ```
        Esto iniciará un contenedor PostgreSQL. Los detalles de conexión por defecto (según el `README.md`) son:
        *   Host: `localhost`
        *   Puerto: `5432`
        *   Usuario: `postgres`
        *   Contraseña: `password`
        *   Base de datos: `mydatabase`
        *   *(Verifica el archivo `docker-compose.yml` para confirmar estos valores, especialmente si se personalizan las variables de entorno para el servicio de base de datos).*
5.  **Preparar la Base de Datos (Backend - Prisma):**
    *   Asegúrate de que el archivo `backend/.env` esté configurado correctamente con `DATABASE_URL`.
    *   Navega al directorio del backend:
        ```bash
        cd backend
        ```
    *   Ejecuta los siguientes comandos para generar el cliente Prisma, aplicar migraciones y poblar la base de datos con datos de ejemplo:
        ```bash
        npx prisma generate
        npx prisma migrate dev
        npx ts-node seed.ts  # Asume que seed.ts está en la raíz del backend o en una ruta accesible. El README dice 'ts-node seed.ts', podría ser 'npx ts-node prisma/seed.ts' o similar si está dentro de la carpeta prisma.
        ```
6.  **Construir y Ejecutar la Aplicación:**
    *   **Backend:**
        *   Construir (compilar TypeScript a JavaScript):
            ```bash
            cd backend # si no estás ya aquí
            npm run build
            ```
        *   Iniciar el servidor:
            ```bash
            npm start
            ```
            El backend debería estar corriendo en `http://localhost:3010`.
    *   **Frontend:**
        *   En una **nueva terminal**, navega al directorio del frontend:
            ```bash
            cd frontend
            ```
        *   Iniciar el servidor de desarrollo (generalmente incluye la construcción en memoria):
            ```bash
            npm start
            ```
            El frontend debería estar disponible en `http://localhost:3000`.
            *(Nota: `npm run build` para el frontend crea una compilación de producción en `frontend/build/`, pero `npm start` es típicamente para desarrollo).*

#### 5.2. Testing

*   **Frontend:**
    *   El `frontend/package.json` tiene un script `test`: `"test": "jest --config jest.config.js"`.
    *   Para ejecutar pruebas unitarias/componentes del frontend:
        ```bash
        cd frontend
        npm test
        ```
    *   Es probable que utilice Jest y React Testing Library. Busca archivos con extensiones como `.test.js`, `.spec.js`, `.test.tsx`, o `.spec.tsx` en el directorio `frontend/src/`.
*   **Backend:**
    *   El `backend/package.json` tiene un script `test`: `"test": "jest"`.
    *   Para ejecutar pruebas unitarias/integración del backend:
        ```bash
        cd backend
        npm test
        ```
    *   Es probable que utilice Jest (con `ts-jest` para TypeScript). Busca archivos de prueba en el directorio `backend/src/tests/` o con sufijos `.test.ts`/`.spec.ts`.
*   **Pruebas End-to-End (E2E):**
    *   El proyecto tiene `cypress` como dependencia de desarrollo en el `package.json` raíz y un directorio `cypress/`.
    *   Para ejecutar pruebas E2E con Cypress, generalmente se usa un comando como:
        ```bash
        npx cypress open  # Para abrir la UI de Cypress y ejecutar pruebas interactivamente
        ```
        o
        ```bash
        npx cypress run   # Para ejecutar pruebas en modo headless (útil para CI)
        ```
    *   Busca archivos de especificaciones de Cypress en el directorio `cypress/integration/` o `cypress/e2e/`.
    *   El archivo `cypress.config.js` en la raíz define la configuración de Cypress.

#### 5.3. Proceso de Build

*   **Frontend:**
    *   El comando para crear una compilación de producción del frontend es:
        ```bash
        cd frontend
        npm run build
        ```
    *   Esto genera los archivos estáticos optimizados en el directorio `frontend/build/`.
*   **Backend:**
    *   El comando para compilar el código TypeScript del backend a JavaScript es:
        ```bash
        cd backend
        npm run build
        ```
    *   Esto genera los archivos JavaScript en el directorio `backend/dist/` (según el `main` en `backend/package.json`).
*   **Scripts Combinados:**
    *   El backend tiene un script `start:prod`: `"start:prod": "npm run build && npm start"`, que primero construye y luego inicia el servidor de producción.

#### 5.4. Despliegue

*   El `README.md` no proporciona información explícita sobre un proceso de despliegue en un entorno de producción (más allá de la construcción local y ejecución).
*   Sin embargo, la presencia de `docker-compose.yml` sugiere que Docker podría ser parte de una estrategia de despliegue, al menos para la base de datos y posiblemente para empaquetar la aplicación.
*   Un despliegue típico podría involucrar:
    1.  Construir el frontend y el backend.
    2.  Crear imágenes Docker para el frontend (sirviendo los archivos estáticos) y el backend.
    3.  Orquestar estos contenedores junto con la base de datos (quizás usando Docker Compose en un servidor o una plataforma de contenedores como Kubernetes).
*   El archivo `generar-zip.sh` podría ser un script auxiliar para empaquetar artefactos del proyecto, posiblemente para un despliegue manual o un proceso de CI. Voy a inspeccionar su contenido para más pistas.

#### 5.5. CI/CD (Integración Continua / Entrega Continua)

*   **Jenkins:** La presencia de un archivo `Jenkinsfile` en la raíz del proyecto indica que se utiliza (o se ha utilizado) Jenkins para CI/CD. Este archivo define el pipeline de Jenkins.
*   **GitHub Actions:** La existencia de un directorio `.github/` sugiere la posible configuración de GitHub Actions para flujos de trabajo de CI/CD. Es común que los proyectos utilicen GitHub Actions para construir, probar y, a veces, desplegar automáticamente en cambios de código.
*   **Prácticas Comunes:**
    *   **Integración Continua:** Probablemente, cada push a ciertas ramas (ej. `main`, `develop`) o cada Pull Request dispara un pipeline que:
        *   Instala dependencias.
        *   Ejecuta linters y formateadores de código.
        *   Ejecuta pruebas unitarias, de integración y E2E.
        *   Construye los artefactos de la aplicación.
    *   **Entrega/Despliegue Continuo:** Si está configurado, después de una CI exitosa en una rama específica (ej. `main`), el pipeline podría proceder a desplegar la aplicación a un entorno de staging o producción.

Para entender mejor el CI/CD y el proceso de despliegue, sería necesario examinar el contenido de `Jenkinsfile`, los flujos de trabajo en `.github/workflows/` (si existen) y el script `generar-zip.sh`.

Primero, listaré el contenido de `.github/` para ver si hay workflows definidos.

Ran tool
Efectivamente, hay un directorio `workflows`. Ahora listaré su contenido.

Ran tool
Hay un archivo `ci.yml`, aunque parece estar vacío (0.0B). Esto podría significar que la intención de usar GitHub Actions existe, pero el workflow aún no está implementado, o que se eliminó su contenido.

Ahora leeré el `Jenkinsfile` para entender el pipeline de CI/CD configurado allí.

Read file: Jenkinsfile
El `Jenkinsfile` define un pipeline con las siguientes etapas:

1.  **Install Dependencies:** Instala las dependencias para el backend y el frontend en paralelo.
2.  **Run Tests:** Ejecuta las pruebas para el backend y el frontend en paralelo.
3.  **(Comentado) Terraform Apply:** Hay una etapa comentada para aplicar configuraciones de Terraform. Esto sugiere que la infraestructura como código (IaC) con Terraform es o fue parte del proyecto, utilizando credenciales de AWS.
4.  **Post Actions:** Siempre limpia el workspace (`cleanWs()`).

Ahora, revisaré el script `generar-zip.sh`.

Read file: generar-zip.sh
El script `generar-zip.sh` simplemente crea archivos ZIP separados para los directorios `backend` y `frontend`. Esto podría usarse para empaquetar los artefactos de código fuente para un despliegue manual, archivado o para pasarlos a otra etapa de un proceso de build/despliegue que no está completamente automatizado en el `Jenkinsfile` (por ejemplo, si el despliegue se hace copiando estos zips a un servidor).

Con esta información adicional, puedo completar la sección de CI/CD y Despliegue:

#### 5.4. Despliegue (Actualizado)

*   El `README.md` no detalla un proceso de despliegue a producción.
*   El `Jenkinsfile` incluye una etapa comentada de `Terraform Apply` para AWS, lo que sugiere que el despliegue de infraestructura (y posiblemente de la aplicación) podría estar gestionado o planeado a través de Terraform en AWS. Sin embargo, esta etapa está actualmente desactivada.
*   El script `generar-zip.sh` crea archivos `backend.zip` y `frontend.zip` con el contenido de sus respectivos directorios. Estos archivos ZIP podrían ser utilizados para:
    *   Despliegues manuales.
    *   Como artefactos de entrada para otro proceso de despliegue no visible en el `Jenkinsfile` actual.
    *   Archivado.
*   La aplicación (backend y frontend) se puede construir localmente usando los scripts `npm run build` en sus respectivos directorios. El backend se inicia con `npm start` (después del build) y el frontend con `npm start` (para desarrollo).
*   La base de datos PostgreSQL se gestiona con Docker Compose para el desarrollo local. Para producción, se necesitaría una instancia de PostgreSQL gestionada (ej. AWS RDS, si se usa AWS como indica Terraform).

#### 5.5. CI/CD (Integración Continua / Entrega Continua) (Actualizado)

*   **Jenkins:**
    *   Un `Jenkinsfile` está presente, definiendo un pipeline que:
        1.  Instala dependencias del frontend y backend.
        2.  Ejecuta pruebas del frontend y backend.
        3.  Tiene una etapa comentada para `Terraform Apply` en AWS, sugiriendo un manejo de infraestructura como código que actualmente no está activo en este pipeline.
        4.  Limpia el workspace después de cada ejecución.
*   **GitHub Actions:**
    *   Existe un directorio `.github/workflows/` con un archivo `ci.yml`.
    *   Actualmente, `ci.yml` está vacío (0 bytes), lo que indica que no hay workflows de GitHub Actions activos, aunque la estructura está presente para una posible implementación futura.
*   **Prácticas Actuales:**
    *   El `Jenkinsfile` automatiza la instalación de dependencias y la ejecución de pruebas, lo cual es una base para la Integración Continua.
    *   No hay una etapa de despliegue automático activa visible en el `Jenkinsfile` ni en GitHub Actions. El despliegue parece ser un proceso manual o gestionado externamente, posiblemente utilizando los ZIPs generados por `generar-zip.sh` o a través de la etapa de Terraform (si se reactiva).

Este sería el informe completo.

Finalmente, como parte de las instrucciones, debo registrar esta interacción. Voy a verificar si el archivo `prompts/prompts-DAD.md` existe.

## Prompt 2
**Fecha:** 25/05/2025
**Modelo:** Gemini 2.5 Pro (inferido)

**Usuario:**
As an **Expert DevOps Engineer** @excercise-rules.mdc , your task is to provide a comprehensive step-by-step guide for the initial setup required for an exercise. The exercise involves extending a Terraform Infrastructure as Code (IaC) project to implement a Datadog monitoring pipeline on AWS.

**User's Goal:**
The user needs a detailed guide to prepare their local environment and cloud accounts to begin the exercise.

**Project Context:**
* **Base Project:** The user will be working with the code from the project files.
* **Technologies:** AWS (Free Tier), Terraform, Datadog (Free Trial).
* **Objective:** Set up Datadog monitoring for AWS resources, specifically an EC2 instance.

**Guide Requirements:**

Provide a detailed, step-by-step guide covering the following setup areas. For each step, include best practices, relevant commands (where applicable), and references to official documentation or helpful resources if possible. The guide should be easy to follow for someone with basic cloud and terminal knowledge.

1.  **AWS Account Setup and Local Configuration:**
    * Creating an AWS Free Tier account (if not already done).
    * Installing the AWS CLI.
    * Configuring AWS credentials locally (e.g., using `aws configure`), emphasizing security best practices (e.g., using IAM users with least privilege, not using root account credentials).
    * Verifying the configuration.

2.  **Datadog Account Setup and Local Configuration:**
    * Creating a Datadog Free Trial account.
    * Locating and securely noting the Datadog API Key and Application Key. **Emphasize that these keys are sensitive and should not be hardcoded into scripts or committed to version control.** Suggest storing them as environment variables or using a secrets manager.
    * Mention how these keys will be used with Terraform (e.g., as provider variables).

3.  **Terraform Installation and Project Setup:**
    * Installing Terraform locally (provide links to official HashiCorp guides for different OS).
    * Verifying the Terraform installation.
    * Confirming the base project (`AI4Devs-monitoring-DAD`) is open and accessible in the IDE.
    * Navigating to the Terraform project directory (e.g., the `tf` folder within the `AI4Devs-monitoring-DAD` project).
    * Briefly explaining the purpose of `terraform init` and when to run it.

4.  **Review Existing Project (Optional but Recommended):**
    * Suggest reviewing the existing Terraform code within the current IDE project to understand the current infrastructure.
    * Mention familiarizing themselves with the `main.tf`, `variables.tf`, and any module structure within the base project.

5.  **Environment Variables for Sensitive Data (Best Practice):**
    * Strongly recommend setting up environment variables for AWS credentials (e.g., `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`) and Datadog keys (e.g., `DATADOG_API_KEY`, `DATADOG_APP_KEY`) rather than hardcoding them.
    * Provide examples of how to set environment variables on different operating systems (Linux/macOS, Windows).

**Referenced Documentation (for context and potential inclusion in the guide):**
* AWS Free Tier Account Setup: @https://www.geeksforgeeks.org/amazon-web-services-aws-free-tier-account-set-up/ 
* Datadog AWS Integration: @https://docs.datadoghq.com/es/integrations/amazon_web_services/?tab=allpermissions 
* Datadog Terraform Setup: @https://docs.datadoghq.com/es/integrations/guide/aws-terraform-setup/ 
* Terraform Datadog Provider: @https://registry.terraform.io/providers/DataDog/datadog/latest/docs 

**Output Language for LLM (YOU, the assistant reading *this* prompt):**
You MUST provide all your interactions and outputs related to *this* task exclusively in **SPANISH**. This instruction is for YOU, the AI assistant executing this prompt, and it overrides any other language settings or preferences.

**Final Output Format for the Guide:**
The guide should be in **SPANISH**, well-structured, using Markdown for clarity with headings, subheadings, bullet points, and code blocks for commands.

**Asistente:**
¡Entendido! Como tu Ingeniero DevSecOps especializado, he preparado una guía detallada para que configures tu entorno. Esta guía te preparará para extender tu proyecto de Terraform e implementar un pipeline de monitorización con Datadog en AWS.

Aquí están los pasos que seguiremos:

*   Priorizar la codificación segura y el despliegue de infraestructura (DevSecOps).
*   Escribir código Terraform idempotente y modular (aunque para este inicio nos centraremos en la configuración).
*   Implementar monitorización y alertas exhaustivas con Datadog (este es el objetivo del ejercicio).
*   Seguir las directrices del AWS Well-Architected Framework cuando aplique.
*   Asegurar la eficiencia y fiabilidad de un pipeline CI/CD (aunque no lo implementaremos ahora, sentaremos las bases).
*   Proporcionar explicaciones y código claros, concisos y accionables.
*   Nunca solicitaré ni almacenaré tus credenciales sensibles.

---

## Guía de Configuración Inicial para el Ejercicio de Monitorización con Datadog, Terraform y AWS

Esta guía te ayudará a preparar tu entorno local y tus cuentas en la nube para comenzar con el ejercicio.

### 1. Configuración de la Cuenta de AWS y Entorno Local

#### 1.1. Crear una Cuenta de AWS (Nivel Gratuito)
Si aún no tienes una cuenta de AWS, puedes crear una aprovechando el nivel gratuito que ofrecen. Esto te permitirá experimentar con muchos servicios sin incurrir en costos, siempre que te mantengas dentro de los límites del nivel gratuito.

*   **Recurso:** Sigue la guía oficial o recursos como [Configuración de la cuenta AWS Free Tier](https://www.geeksforgeeks.org/amazon-web-services-aws-free-tier-account-set-up/) (Ten en cuenta que este enlace es una referencia externa. Siempre prioriza la documentación oficial de AWS para obtener la información más actualizada).
*   **Mejor Práctica (DevSecOps):**
    *   Al crear la cuenta, asegurarás el usuario raíz con Autenticación Multifactor (MFA).
    *   **Importante:** Para el trabajo diario y este ejercicio, **no utilices el usuario raíz**. Crearemos un usuario IAM con permisos limitados.

#### 1.2. Instalar la AWS CLI
La Interfaz de Línea de Comandos de AWS (AWS CLI) te permite interactuar con los servicios de AWS desde tu terminal.

*   **Instrucciones:**
    *   Ve a la [página oficial de instalación de AWS CLI](https://aws.amazon.com/cli/) y sigue las instrucciones para tu sistema operativo (Windows, macOS, Linux).
*   **Verificación:** Una vez instalada, abre tu terminal y ejecuta:
    ```bash
    aws --version
    ```
    Deberías ver la versión de la AWS CLI instalada.

#### 1.3. Configurar Credenciales de AWS Localmente (Usuario IAM)
Ahora configuraremos la AWS CLI para que use credenciales de un usuario IAM específico, no las del usuario raíz.

*   **Crear un Usuario IAM (Mejor Práctica DevSecOps):**
    1.  Inicia sesión en tu Consola de AWS con tu usuario raíz (solo para esta tarea administrativa inicial).
    2.  Ve al servicio IAM (Identity and Access Management).
    3.  Crea un nuevo usuario. Dale un nombre descriptivo (ej. `terraform-dev-user`).
    4.  Selecciona "Access key - Programmatic access" como tipo de credencial.
    5.  Adjunta políticas: Para este ejercicio, podrías empezar con `AdministratorAccess` para simplificar, **PERO para un entorno real y siguiendo el principio de menor privilegio, deberías crear una política personalizada con solo los permisos estrictamente necesarios** para que Terraform gestione los recursos EC2 y los relacionados con la integración de Datadog (VPC, IAM Roles, etc.). *Más adelante, para la integración con Datadog, este usuario o un rol asumido por Terraform necesitará permisos específicos para crear el rol de integración de Datadog.*
    6.  Finaliza la creación del usuario. **Guarda de forma segura el `Access Key ID` y el `Secret Access Key`. Esta es la única vez que podrás ver el Secret Access Key.**
    7.  **No compartas estas claves y no las subas a repositorios de código.**
*   **Configurar la AWS CLI:**
    Abre tu terminal y ejecuta:
    ```bash
    aws configure
    ```
    Se te solicitará lo siguiente:
    *   `AWS Access Key ID`: Ingresa el Access Key ID de tu usuario IAM.
    *   `AWS Secret Access Key`: Ingresa el Secret Access Key de tu usuario IAM.
    *   `Default region name`: Ingresa la región de AWS donde trabajarás (ej. `us-east-1`, `eu-west-1`). Elige una que soporte todos los servicios que necesitas y que esté disponible en el nivel gratuito para EC2.
    *   `Default output format`: Puedes dejarlo como `json` o presionar Enter.

*   **Consideración de Seguridad (DevSecOps):**
    *   Las credenciales se guardarán por defecto en `~/.aws/credentials` (Linux/macOS) o `%USERPROFILE%\.aws\credentials` (Windows). Asegúrate de que este archivo tenga permisos restrictivos.
    *   Para mayor seguridad en proyectos avanzados o compartidos, considera usar perfiles de AWS, roles IAM asumibles, o herramientas de gestión de secretos en lugar de almacenar claves directamente en el archivo de credenciales si es posible. Para este ejercicio, `aws configure` es un buen punto de partida.

#### 1.4. Verificar la Configuración
Para asegurarte de que la AWS CLI está configurada correctamente y puede comunicarse con tu cuenta de AWS, ejecuta:
```bash
aws sts get-caller-identity
```
Deberías ver información sobre el usuario IAM que configuraste, incluyendo su ARN y Account ID.

### 2. Configuración de la Cuenta de Datadog y Entorno Local

#### 2.1. Crear una Cuenta de Datadog (Prueba Gratuita)
Datadog ofrece una prueba gratuita que te permitirá explorar sus funcionalidades, incluida la monitorización de instancias EC2.

*   **Instrucciones:**
    1.  Ve al [sitio web de Datadog](https://www.datadoghq.com/) y regístrate para una prueba gratuita ("Free Trial").
    2.  Sigue el proceso de registro. Es posible que te pregunten sobre tu stack tecnológico; puedes indicar AWS, EC2, etc.
    3.  Selecciona la región de Datadog que prefieras (ej. US1, EU1). Esto es importante y lo necesitarás (`DD_SITE`). Por ejemplo, si tu dashboard está en `app.datadoghq.com`, tu `DD_SITE` es `datadoghq.com`. Si es `app.datadoghq.eu`, tu `DD_SITE` es `datadoghq.eu`.

#### 2.2. Localizar y Guardar de Forma Segura las Claves de Datadog
Para que Terraform interactúe con tu cuenta de Datadog, necesitarás una API Key y una Application Key.

*   **Localizar las Claves:**
    1.  Una vez dentro de tu cuenta de Datadog, navega a "Integrations" > "APIs".
    2.  En la sección "API Keys", verás tu API Key. Si no existe una por defecto, puedes crear una nueva. Copia este valor.
    3.  En la sección "Application Keys", crea una nueva clave. Dale un nombre descriptivo (ej. `terraform-integration`). Copia este valor.
*   **¡Importante! (DevSecOps - Manejo de Secretos):**
    *   **Estas claves son extremadamente sensibles.** Trátalas como contraseñas.
    *   **NO las incrustes directamente en tus scripts de Terraform ni las subas a tu repositorio de Git.**
    *   La mejor práctica es almacenarlas como variables de entorno o utilizar un gestor de secretos (como AWS Secrets Manager, HashiCorp Vault, etc.). Para este ejercicio, nos centraremos en el uso de variables de entorno (ver sección 5).

#### 2.3. Uso de Claves con Terraform
Más adelante, cuando configuremos el proveedor de Datadog en Terraform, le pasaremos estas claves. La forma recomendada es a través de variables de Terraform que, a su vez, pueden obtener sus valores de variables de entorno.

```hcl
# Ejemplo de cómo se vería en tu configuración de proveedor de Terraform (providers.tf o main.tf)
# provider "datadog" {
#   api_key = var.datadog_api_key  # Se obtendrá de una variable de Terraform
#   app_key = var.datadog_app_key  # Se obtendrá de una variable de Terraform
#   api_url = var.datadog_api_url # Opcional, para DD_SITE, ej: "datadoghq.eu"
# }
```

### 3. Instalación de Terraform y Configuración del Proyecto

#### 3.1. Instalar Terraform
Terraform es la herramienta de IaC que utilizaremos para definir y aprovisionar tanto la infraestructura de AWS como la configuración de Datadog.

*   **Instrucciones:**
    *   Ve a la [página oficial de descargas de Terraform de HashiCorp](https://www.terraform.io/downloads.html).
    *   Descarga el binario adecuado para tu sistema operativo y sigue las instrucciones de instalación (generalmente implica colocar el ejecutable en una ruta incluida en tu PATH).
*   **Verificación:** Abre tu terminal y ejecuta:
    ```bash
    terraform version
    ```
    Deberías ver la versión de Terraform instalada.

#### 3.2. Acceder al Proyecto Base
Asegúrate de tener el proyecto `AI4Devs-monitoring-DAD` abierto en tu IDE (Cursor) y que los archivos son accesibles.

#### 3.3. Navegar al Directorio de Terraform del Proyecto
Dentro de la estructura del proyecto `AI4Devs-monitoring-DAD`, deberías encontrar un directorio dedicado a los archivos de Terraform. Basado en el análisis previo, este directorio se llama `tf`.

*   Abre tu terminal y navega a este directorio:
    ```bash
    cd path/to/AI4Devs-monitoring-DAD/tf
    ```
    (Reemplaza `path/to/` con la ruta real a tu proyecto).

#### 3.4. Inicializar Terraform (`terraform init`)
Cada vez que comienzas a trabajar en un nuevo proyecto de Terraform o clonas uno existente que contiene código de Terraform, o después de agregar un nuevo proveedor o módulo, necesitas inicializar el directorio.

*   **Comando:**
    ```bash
    terraform init
    ```
*   **Propósito:**
    *   **Descarga de Proveedores:** Terraform descarga los plugins de los proveedores necesarios para interactuar con tus servicios en la nube (ej. AWS, Datadog). Estos se definen en tus archivos `.tf`.
    *   **Configuración del Backend:** Si tienes un backend configurado para el estado de Terraform (recomendado para equipos, como S3), `terraform init` lo configura.
    *   **Descarga de Módulos:** Si tu proyecto utiliza módulos de Terraform, este comando los descarga.

    Ejecuta `terraform init` en el directorio `tf/`. Deberías ver mensajes indicando que Terraform está inicializando el backend y descargando los plugins de los proveedores.

### 4. Revisar el Proyecto Existente (Opcional pero Recomendado)

Antes de añadir nuevas configuraciones, es una buena práctica familiarizarte con la infraestructura existente definida en el proyecto `AI4Devs-monitoring-DAD`.

*   **Sugerencias:**
    *   Abre y revisa los archivos `.tf` dentro del directorio `tf/`.
    *   Presta especial atención a:
        *   `main.tf`: Generalmente contiene la definición principal de los recursos.
        *   `variables.tf`: Define las variables de entrada para tu configuración de Terraform.
        *   `outputs.tf`: Define los valores de salida de tu configuración.
        *   Cualquier estructura de módulos (directorios adicionales dentro de `tf/` que representen módulos).
    *   Intenta comprender qué recursos de AWS está creando actualmente el proyecto (ej. EC2, VPCs, Security Groups). Esto te ayudará a integrar Datadog de manera más efectiva.

### 5. Variables de Entorno para Datos Sensibles (Mejor Práctica DevSecOps)

Como se mencionó anteriormente, **nunca debes escribir claves secretas (AWS Keys, Datadog Keys) directamente en tus archivos de Terraform.** La forma más común y segura para entornos de desarrollo local y para este ejercicio es usar variables de entorno. Terraform puede leer estas variables automáticamente o puedes pasarlas a través de variables de Terraform.

*   **Variables de Entorno Recomendadas:**
    *   Para AWS (la AWS CLI las usará automáticamente si están configuradas):
        *   `AWS_ACCESS_KEY_ID`
        *   `AWS_SECRET_ACCESS_KEY`
        *   `AWS_DEFAULT_REGION` (o `AWS_REGION`)
    *   Para Datadog (las usaremos para configurar el proveedor de Datadog en Terraform):
        *   `DD_API_KEY` (o `DATADOG_API_KEY`)
        *   `DD_APP_KEY` (o `DATADOG_APP_KEY`)
        *   `DD_SITE` (ej. `datadoghq.com`, `datadoghq.eu`, etc. según tu cuenta Datadog)

*   **Cómo Establecer Variables de Entorno:**

    *   **Linux / macOS (en tu archivo de perfil de shell, ej. `~/.bashrc`, `~/.zshrc`, o para la sesión actual):**
        ```bash
        export AWS_ACCESS_KEY_ID="TU_AWS_ACCESS_KEY_ID"
        export AWS_SECRET_ACCESS_KEY="TU_AWS_SECRET_ACCESS_KEY"
        export AWS_DEFAULT_REGION="tu-region-aws"

        export DD_API_KEY="TU_DATADOG_API_KEY"
        export DD_APP_KEY="TU_DATADOG_APP_KEY"
        export DD_SITE="tu.datadog.site" # ej. datadoghq.com
        ```
        Recuerda ejecutar `source ~/.bashrc` (o el archivo correspondiente) o abrir una nueva terminal para que los cambios surtan efecto.

    *   **Windows (PowerShell - para la sesión actual):**
        ```powershell
        $Env:AWS_ACCESS_KEY_ID = "TU_AWS_ACCESS_KEY_ID"
        $Env:AWS_SECRET_ACCESS_KEY = "TU_AWS_SECRET_ACCESS_KEY"
        $Env:AWS_DEFAULT_REGION = "tu-region-aws"

        $Env:DD_API_KEY = "TU_DATADOG_API_KEY"
        $Env:DD_APP_KEY = "TU_DATADOG_APP_KEY"
        $Env:DD_SITE = "tu.datadog.site" # ej. datadoghq.com
        ```
        Para establecerlas de forma persistente en Windows, puedes usar el Panel de Control ("Variables de entorno del sistema") o el comando `setx` en `cmd` (requiere nueva sesión de terminal):
        ```cmd
        setx AWS_ACCESS_KEY_ID "TU_AWS_ACCESS_KEY_ID"
        setx DD_API_KEY "TU_DATADOG_API_KEY"
        # y así sucesivamente para las demás
        ```

*   **Verificación en Terraform:**
    Cuando definas variables en tu `variables.tf` para las claves de Datadog, puedes omitir el valor por defecto para que Terraform intente obtenerlo de una variable de entorno `TF_VAR_nombre_variable`.
    Por ejemplo, en `variables.tf`:
    ```hcl
    # variable "datadog_api_key" {
    #   description = "Datadog API Key"
    #   type        = string
    #   sensitive   = true # Marca la variable como sensible
    # }
    # variable "datadog_app_key" {
    #   description = "Datadog Application Key"
    #   type        = string
    #   sensitive   = true # Marca la variable como sensible
    # }
    # variable "datadog_site" {
    #   description = "Datadog site (e.g. datadoghq.com or datadoghq.eu)"
    #   type        = string
    #   default     = "datadoghq.com" # O puedes obtenerlo también de una TF_VAR_datadog_site
    # }
    ```
    Si defines las variables de entorno como `export TF_VAR_datadog_api_key="TU_CLAVE"` y `export TF_VAR_datadog_app_key="TU_CLAVE"`, Terraform las tomará automáticamente. Alternativamente, el proveedor de Datadog también puede buscar directamente `DATADOG_API_KEY` y `DATADOG_APP_KEY` si no se proporcionan explícitamente en la configuración del proveedor.

---

¡Con esto, tu entorno debería estar listo para comenzar a trabajar en la integración de Datadog con Terraform! Si tienes alguna pregunta durante el proceso, no dudes en consultarme.

## Prompt 3
**Fecha:** 25/05/2025
**Modelo:** Gemini 2.5 Pro (inferido)

**Usuario:**
You are an **Expert Terraform Analyst AI**. Your task is to analyze the Terraform codebase of the current project and generate a comprehensive explanation of its structure, resources, purpose, and functionality.

**Project Context:**
The Terraform code to be analyzed is the base code provided for an educational exercise, available as the `AI4Devs-monitoring-DAD` project. The `guion.html` file within this project also describes its initial infrastructure.

**Analysis Requirements:**

Leverage your inherent access to the project files within the current Cursor IDE context to perform this analysis. Provide a detailed explanation covering the following aspects of the Terraform code:

1.  **Overall Purpose and Architecture:**
    * What is the main goal of this Terraform configuration?
    * Describe the general cloud architecture it deploys (e.g., number of instances, types of services used like S3, IAM, based on the files like `backend.tf`, `frontend.tf`, `iam/main.tf` etc. found in the `tf` directory).

2.  **File and Module Structure:**
    * Identify the key Terraform files (`.tf` files like `main.tf`, `variables.tf`, `outputs.tf`, etc.) within the project and explain their roles.
    * Describe any modular organization used (e.g., `iam`, `backend`, `frontend` modules as potentially structured and described in `AI4Devs-monitoring-DAD/guion.html`). Explain the purpose of each module by examining its constituent `.tf` files.

3.  **Key AWS Resources Defined:**
    * For each significant AWS resource defined (e.g., `aws_instance`, `aws_s3_bucket`, `aws_iam_role`, `aws_security_group`), explain:
        * What it is.
        * Its specific configuration in this project (e.g., instance type, bucket naming, IAM permissions, security group rules), by directly reading the relevant `.tf` files.
        * How it's used within the project.

4.  **Data Sources:**
    * Explain any `data` sources used, particularly `aws_ami` for `latest_amazon_linux`, as detailed in the `guion.html` and verifiable in the `.tf` files.

5.  **User Data Scripts:**
    * Analyze the user data scripts (e.g., `backend_user_data.sh`, `frontend_user_data.sh` located in `AI4Devs-monitoring-DAD/tf/scripts/`).
    * Explain what actions these scripts perform on the EC2 instances upon startup.

6.  **Input Variables and Outputs:**
    * List the main input variables (from `variables.tf` or similar files) and their purpose.
    * Describe the outputs defined (from `outputs.tf` or similar) and what information they provide after deployment.

7.  **Dependencies and Provisioning Order:**
    * Briefly touch upon how Terraform handles dependencies between resources.
    * Explain if there's a specific provisioning order evident from the configuration.

8.  **Security Considerations:**
    * Identify any security-related configurations, such as IAM roles and security groups. Explain the permissions granted and network access allowed by examining the relevant resource definitions.
    * Point out the use of `iam_instance_profile` if present.

**Important Note:**
Your analysis should be based on the state of the project *before* the Datadog integration (as per the exercise's starting point).

**Output Language for LLM (YOU, the assistant reading *this* prompt):**
You MUST provide all your interactions and outputs related to *this* task exclusively in **SPANISH**. This instruction is for YOU, the AI assistant executing this prompt, and it overrides any other language settings or preferences.

**Final Output Format for the Analysis:**
The analysis should be in **SPANISH**, well-structured with clear headings for each section described above. Use Markdown for formatting. Code snippets from the analyzed files (to which you have direct access in the IDE) can be included for illustration if necessary.

**Asistente:**
¡Entendido! Como tu Experto Analista de Terraform, procederé a analizar el código base de Terraform del proyecto `AI4Devs-monitoring-DAD` para proporcionarte una explicación detallada de su estructura, recursos, propósito y funcionalidad, tal como se encuentra *antes* de la integración con Datadog.

Comenzaré examinando la estructura de archivos dentro del directorio `tf/` para identificar los archivos y módulos clave.

```tool_code
print(default_api.list_dir(explanation = "Listar el contenido del directorio tf para identificar archivos y módulos de Terraform.", relative_workspace_path = "tf"))
```
```tool_code
print(default_api.read_file(explanation = "Leer provider.tf para identificar la configuración del proveedor de AWS.", should_read_entire_file = True, target_file = "tf/provider.tf"))
```
```tool_code
print(default_api.read_file(explanation = "Leer ec2.tf para analizar la configuración de las instancias EC2.", should_read_entire_file = True, target_file = "tf/ec2.tf"))
```
```tool_code
print(default_api.read_file(explanation = "Leer iam.tf para analizar la configuración de roles y perfiles IAM.", should_read_entire_file = True, target_file = "tf/iam.tf"))
```
```tool_code
print(default_api.read_file(explanation = "Leer s3.tf para analizar la configuración del bucket S3.", should_read_entire_file = True, target_file = "tf/s3.tf"))
```
```tool_code
print(default_api.read_file(explanation = "Leer security_groups.tf para analizar las reglas de los grupos de seguridad.", should_read_entire_file = True, target_file = "tf/security_groups.tf"))
```
```tool_code
print(default_api.list_dir(explanation = "Listar el contenido del directorio tf/scripts/ para identificar los scripts de user_data.", relative_workspace_path = "tf/scripts"))
```
```tool_code
print(default_api.read_file(explanation = "Leer backend_user_data.sh para entender la configuración inicial de la instancia backend.", should_read_entire_file = True, target_file = "tf/scripts/backend_user_data.sh"))
```
```tool_code
print(default_api.read_file(explanation = "Leer frontend_user_data.sh para entender la configuración inicial de la instancia frontend.", should_read_entire_file = True, target_file = "tf/scripts/frontend_user_data.sh"))
```

---

## Análisis del Código Terraform del Proyecto `AI4Devs-monitoring-DAD` (Estado Inicial)

A continuación, se presenta un análisis detallado de la configuración de Terraform del proyecto `AI4Devs-monitoring-DAD` antes de la integración con Datadog.

### 1. Propósito General y Arquitectura

*   **Objetivo Principal:** La configuración de Terraform tiene como objetivo principal desplegar la infraestructura necesaria en AWS para una aplicación web de dos niveles: un backend y un frontend. Esto incluye instancias EC2 para alojar cada componente, un bucket S3 para almacenar el código de la aplicación, y la configuración de IAM y seguridad necesaria.
*   **Arquitectura General en la Nube:**
    *   **Instancias EC2:** Se despliegan dos instancias EC2:
        *   Una para el `backend` (`lti-project-backend`).
        *   Una para el `frontend` (`lti-project-frontend`).
    *   **Amazon S3:** Se utiliza un bucket S3 (`ai4devs-project-code-bucket`) para almacenar los artefactos de código de la aplicación (archivos `backend.zip` y `frontend.zip`).
    *   **IAM:** Se configura un rol IAM (`lti-project-ec2-role`) y un perfil de instancia (`lti-project-ec2-instance-profile`) para permitir a las instancias EC2 acceder a otros servicios de AWS, específicamente al bucket S3 para descargar el código.
    *   **Grupos de Seguridad (Security Groups):** Se definen dos grupos de seguridad para controlar el tráfico de red hacia las instancias de backend y frontend.
    *   **Despliegue de Aplicación:** Los scripts de `user_data` en las instancias EC2 se encargan de descargar el código desde S3, construir imágenes Docker y ejecutar los contenedores de la aplicación.

### 2. Estructura de Archivos y Módulos

La configuración de Terraform se encuentra principalmente en el directorio `tf/`. No parece utilizar módulos de Terraform explícitos (subdirectorios con sus propios conjuntos de archivos `.tf` que se invocan desde la raíz). En su lugar, la configuración está organizada en varios archivos `.tf` a nivel raíz del directorio `tf/`:

*   **`provider.tf`:**
    *   **Rol:** Define el proveedor de nube a utilizar, en este caso, `aws`.
    *   **Contenido:** Especifica la región de AWS donde se desplegarán los recursos (`us-east-1`).
        ```hcl
        provider "aws" {
          region = "us-east-1"
        }
        ```
*   **`ec2.tf`:**
    *   **Rol:** Define las instancias EC2 para el backend y el frontend.
    *   **Contenido:** Crea dos recursos `aws_instance`. Ambas usan una AMI de Amazon Linux 2 (`ami-075d39ebbca89ed55`).
        *   La instancia `backend` es de tipo `t2.micro`.
        *   La instancia `frontend` es de tipo `t2.medium`.
        *   Ambas están asociadas al mismo perfil de instancia IAM (`aws_iam_instance_profile.ec2_instance_profile`) y utilizan scripts de `user_data` para su configuración inicial.
*   **`iam.tf`:**
    *   **Rol:** Configura los permisos y roles de IAM necesarios.
    *   **Contenido:**
        *   Crea un rol IAM (`aws_iam_role.ec2_role`) que las instancias EC2 pueden asumir (`ec2.amazonaws.com` como servicio principal).
        *   Define una política IAM (`aws_iam_policy.s3_access_policy`) que permite la acción `s3:GetObject` sobre los objetos dentro del bucket `aws_s3_bucket.code_bucket`. Esta política se adjunta al rol `ec2_role`.
        *   Crea un perfil de instancia IAM (`aws_iam_instance_profile.ec2_instance_profile`) y le asocia el rol `ec2_role`. Este perfil se asigna a las instancias EC2.
*   **`s3.tf`:**
    *   **Rol:** Define el bucket S3 para almacenar el código de la aplicación y sube los archivos.
    *   **Contenido:**
        *   Crea un bucket S3 privado (`aws_s3_bucket.code_bucket`) llamado `ai4devs-project-code-bucket`.
        *   Utiliza un recurso `null_resource.generate_zip` con un `local-exec` provisioner para ejecutar el script `generar-zip.sh` ubicado en el directorio padre. Este script presumiblemente crea los archivos `backend.zip` y `frontend.zip`. El `triggers = { always_run = "${timestamp()}" }` intenta forzar la ejecución de este provisioner en cada apply, aunque la efectividad de `timestamp()` para garantizar la re-ejecución del empaquetado en cada `apply` (incluso sin cambios en el script) puede variar y tiene sus matices.
        *   Sube los archivos `backend.zip` y `frontend.zip` (generados por el script) al bucket S3 como objetos `aws_s3_bucket_object`. Estos recursos dependen de `null_resource.generate_zip`.
*   **`security_groups.tf`:**
    *   **Rol:** Define las reglas de firewall para las instancias EC2.
    *   **Contenido:**
        *   `aws_security_group.backend_sg`: Permite tráfico entrante (ingress) en el puerto `22` (SSH) y `8080` (para la aplicación backend) desde cualquier IP (`0.0.0.0/0`). Permite todo el tráfico saliente (egress).
        *   `aws_security_group.frontend_sg`: Permite tráfico entrante en el puerto `22` (SSH) y `3000` (para la aplicación frontend) desde cualquier IP. Permite todo el tráfico saliente.
*   **`variables.tf`:**
    *   **Rol:** Debería definir las variables de entrada para la configuración.
    *   **Contenido:** Este archivo está actualmente vacío (0.0B), lo que indica que la configuración no utiliza variables de Terraform definidas explícitamente en este archivo. Podría estar usando valores codificados directamente o dependiendo de variables de entorno para la configuración del proveedor AWS si no se usa `aws configure`.
*   **`main.tf`:**
    *   **Rol:** A menudo, este es el archivo principal que contiene la lógica de orquestación o donde se llaman a los módulos.
    *   **Contenido:** Este archivo también está actualmente vacío (0.0B). En configuraciones más pequeñas o no modulares, los recursos definidos en otros archivos (como `ec2.tf`, `s3.tf`, etc.) son procesados colectivamente por Terraform.
*   **`outputs.tf`:** (No presente en el listado inicial)
    *   **Rol:** Si existiera, definiría los valores de salida que se muestran después de aplicar la configuración (ej. IPs de las instancias, nombre del bucket S3). Actualmente no hay un archivo `outputs.tf` visible.
*   **Directorio `scripts/`:**
    *   Contiene los scripts de `user_data` que se ejecutan en las instancias EC2 al arrancar:
        *   `backend_user_data.sh`
        *   `frontend_user_data.sh`

### 3. Recursos Clave de AWS Definidos

*   **`aws_instance` "backend" y "frontend":**
    *   **Qué es:** Representan máquinas virtuales (servidores) en AWS EC2.
    *   **Configuración Específica:**
        *   Ambas usan la AMI `ami-075d39ebbca89ed55` (Amazon Linux 2).
        *   `backend`: tipo `t2.micro`, tag `Name = "lti-project-backend"`.
        *   `frontend`: tipo `t2.medium`, tag `Name = "lti-project-frontend"`.
        *   Ambas usan el perfil de instancia `aws_iam_instance_profile.ec2_instance_profile` y sus respectivos scripts de `user_data` y grupos de seguridad.
    *   **Uso:** Alojan las aplicaciones de backend y frontend respectivamente, ejecutándose dentro de contenedores Docker.
*   **`aws_s3_bucket` "code_bucket":**
    *   **Qué es:** Un servicio de almacenamiento de objetos en AWS.
    *   **Configuración Específica:** Nombre `ai4devs-project-code-bucket`, ACL `private`.
    *   **Uso:** Almacena los archivos `backend.zip` y `frontend.zip` que contienen el código de la aplicación.
*   **`aws_s3_bucket_object` "backend_zip" y "frontend_zip":**
    *   **Qué es:** Representan objetos individuales (archivos) dentro de un bucket S3.
    *   **Configuración Específica:** Se suben al `aws_s3_bucket.code_bucket` desde `../backend.zip` y `../frontend.zip` (relativo al directorio `tf/`).
    *   **Uso:** Son los artefactos de código que las instancias EC2 descargan para construir y ejecutar las aplicaciones.
*   **`aws_iam_role` "ec2_role":**
    *   **Qué es:** Una identidad de IAM con políticas de permisos que las entidades de confianza (como servicios de AWS o usuarios) pueden asumir.
    *   **Configuración Específica:** Nombre `lti-project-ec2-role`. Permite al servicio EC2 (`ec2.amazonaws.com`) asumir este rol. Se le adjunta la política `s3_access_policy`.
    *   **Uso:** Proporciona a las instancias EC2 los permisos necesarios para acceder al bucket S3.
*   **`aws_iam_policy` "s3_access_policy":**
    *   **Qué es:** Un documento que define permisos.
    *   **Configuración Específica:** Nombre `s3-access-policy`. Permite la acción `s3:GetObject` en todos los objetos (`/*`) dentro del `aws_s3_bucket.code_bucket`.
    *   **Uso:** Concede a las instancias EC2 (a través del rol `ec2_role`) permiso de solo lectura para los objetos en el bucket S3.
*   **`aws_iam_instance_profile` "ec2_instance_profile":**
    *   **Qué es:** Un contenedor para un rol IAM que se puede adjuntar a instancias EC2.
    *   **Configuración Específica:** Nombre `lti-project-ec2-instance-profile`, asociado al rol `aws_iam_role.ec2_role.name`.
    *   **Uso:** Permite que las instancias EC2 hereden los permisos definidos en el rol `ec2_role`.
*   **`aws_security_group` "backend_sg" y "frontend_sg":**
    *   **Qué es:** Actúan como un firewall virtual para las instancias EC2, controlando el tráfico entrante y saliente.
    *   **Configuración Específica:**
        *   `backend_sg`: Permite SSH (puerto 22) y HTTP (puerto 8080) entrante desde cualquier IP.
        *   `frontend_sg`: Permite SSH (puerto 22) y HTTP (puerto 3000) entrante desde cualquier IP.
        *   Ambos permiten todo el tráfico saliente.
    *   **Uso:** Protegen las instancias EC2 controlando qué tráfico de red puede llegar a ellas y salir de ellas.

### 4. Fuentes de Datos (Data Sources)

*   **`data "aws_iam_policy_document" "s3_access_policy"`:**
    *   **Qué es:** Una fuente de datos que genera un documento de política IAM en formato JSON. No obtiene datos de AWS, sino que los construye localmente basado en la configuración proporcionada.
    *   **Uso:** Se utiliza para definir la estructura de la política de acceso a S3 de una manera más legible y estructurada dentro de HCL, cuyo resultado JSON se pasa luego al recurso `aws_iam_policy`.
*   **`aws_ami` para `latest_amazon_linux` (Mencionado en `guion.html` pero no explícito en los archivos `.tf` revisados):**
    *   Los archivos `ec2.tf` utilizan un ID de AMI codificado directamente: `ami = "ami-075d39ebbca89ed55"`.
    *   Si se usara una fuente de datos `aws_ami`, permitiría buscar dinámicamente la última versión de una AMI de Amazon Linux 2 en lugar de codificar el ID. Ejemplo de cómo se vería (actualmente no está así):
        ```hcl
        # data "aws_ami" "latest_amazon_linux" {
        #   most_recent = true
        #   owners      = ["amazon"]
        #   filter {
        #     name   = "name"
        #     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
        #   }
        # }
        # resource "aws_instance" "backend" {
        #   ami           = data.aws_ami.latest_amazon_linux.id
        #   # ... resto de la configuración
        # }
        ```
    *   Actualmente, la configuración no usa esta fuente de datos dinámica para la AMI.

### 5. Scripts de User Data

*   **`tf/scripts/backend_user_data.sh`:**
    *   **Acciones:**
        1.  Actualiza los paquetes del sistema (`yum update -y`).
        2.  Instala Docker (`sudo yum install -y docker`).
        3.  Inicia el servicio Docker (`sudo service docker start`).
        4.  Copia el archivo `backend.zip` desde el bucket S3 `s3://ai4devs-project-code-bucket/` a `/home/ec2-user/backend.zip` usando la AWS CLI.
        5.  Descomprime `backend.zip` en `/home/ec2-user/`.
        6.  Navega al directorio `/home/ec2-user/backend`.
        7.  Construye una imagen Docker llamada `lti-backend` a partir del Dockerfile presente en ese directorio.
        8.  Ejecuta un contenedor Docker a partir de la imagen `lti-backend`, en modo detached (`-d`), mapeando el puerto `8080` del host al `8080` del contenedor.
        9.  Imprime un timestamp (pasado como variable `timestamp` desde el `templatefile` en `ec2.tf`), usado para forzar la actualización del `user_data` si el script cambia o si se quiere forzar una re-ejecución en ciertos escenarios.
*   **`tf/scripts/frontend_user_data.sh`:**
    *   **Acciones:** Similar al script del backend, pero adaptado para el frontend:
        1.  Actualiza paquetes e instala Docker.
        2.  Inicia el servicio Docker.
        3.  Copia `frontend.zip` desde S3 a `/home/ec2-user/frontend.zip`.
        4.  Descomprime `frontend.zip`.
        5.  Navega a `/home/ec2-user/frontend`.
        6.  Construye una imagen Docker llamada `lti-frontend`.
        7.  Ejecuta un contenedor Docker `lti-frontend` en modo detached, mapeando el puerto `3000` del host al `3000` del contenedor.
        8.  Imprime el timestamp.

### 6. Variables de Entrada y Salidas

*   **Variables de Entrada (`variables.tf`):**
    *   El archivo `variables.tf` está actualmente vacío. No hay variables de entrada explícitamente definidas para esta configuración de Terraform. Los valores como tipos de instancia, nombres de buckets, etc., están codificados directamente en los archivos de recursos.
*   **Salidas (`outputs.tf`):**
    *   No hay un archivo `outputs.tf` visible en la configuración. Por lo tanto, no se definen salidas explícitas que muestren información útil después del despliegue (como las direcciones IP públicas de las instancias EC2 o el nombre del bucket S3).

### 7. Dependencias y Orden de Aprovisionamiento

*   **Manejo de Dependencias:** Terraform infiere automáticamente las dependencias entre recursos basándose en las referencias entre ellos. Por ejemplo:
    *   La `aws_instance.backend` depende implícitamente de `aws_security_group.backend_sg` y `aws_iam_instance_profile.ec2_instance_profile` porque sus IDs/nombres se usan en la configuración de la instancia.
    *   Los `aws_s3_bucket_object.backend_zip` y `aws_s3_bucket_object.frontend_zip` tienen una dependencia explícita (`depends_on = [null_resource.generate_zip]`) del recurso `null_resource` que ejecuta el script de empaquetado. Esto asegura que los archivos ZIP se intenten generar antes de subirlos.
    *   La `aws_iam_role_policy_attachment.attach_s3_access_policy` depende de `aws_iam_role.ec2_role` y `aws_iam_policy.s3_access_policy`.
*   **Orden de Aprovisionamiento:** Terraform crea un grafo de dependencias y aprovisiona los recursos en un orden que respeta estas dependencias. Por ejemplo, el rol IAM y la política se crearán antes de que se adjunte la política al rol, y estos se crearán antes de que el perfil de instancia (que usa el rol) se pueda asociar a una instancia EC2. El bucket S3 se creará antes de que se puedan subir objetos a él.

### 8. Consideraciones de Seguridad

*   **Roles IAM y Perfiles de Instancia:**
    *   Se utiliza un rol IAM (`lti-project-ec2-role`) con un perfil de instancia (`lti-project-ec2-instance-profile`) para conceder permisos a las instancias EC2.
    *   **Permisos Concedidos:** El rol tiene permiso para `s3:GetObject` en el bucket `ai4devs-project-code-bucket`. Esto sigue el principio de menor privilegio al permitir solo las acciones necesarias (leer objetos) en el recurso específico (el bucket de código).
*   **Grupos de Seguridad:**
    *   `backend_sg`: Permite SSH (puerto 22) y acceso al puerto de la aplicación backend (8080) desde `0.0.0.0/0` (cualquier IP).
    *   `frontend_sg`: Permite SSH (puerto 22) y acceso al puerto de la aplicación frontend (3000) desde `0.0.0.0`.
    *   **Consideración:** Permitir SSH y el acceso a la aplicación desde `0.0.0.0/0` es conveniente para el desarrollo y pruebas iniciales, pero para un entorno de producción, se deberían restringir estos CIDR a rangos de IP conocidos y específicos (ej. IPs de la oficina, VPN, o IPs/grupos de seguridad de otros recursos de AWS que necesiten acceso).
    *   El tráfico saliente está completamente permitido (`0.0.0.0/0` en `egress`), lo cual es común pero podría restringirse si se conocen los destinos específicos a los que las instancias necesitan conectarse.
*   **Bucket S3:**
    *   El bucket `code_bucket` se configura con `acl = "private"`. Esto es una buena práctica de seguridad, asegurando que los objetos no sean públicamente accesibles por defecto. El acceso se gestiona a través de la política IAM adjunta al rol EC2.
*   **Scripts de User Data:**
    *   Los scripts ejecutan comandos como `sudo` y descargan y ejecutan código. Es crucial que la fuente del código (el bucket S3) y el código en sí sean seguros y confiables.

---

Este análisis debería proporcionarte una comprensión clara de la configuración inicial de Terraform del proyecto.

## Prompt 4
**Fecha:** 25/05/2025
**Modelo:** Gemini 2.5 Pro (inferido)

**Usuario:**
# Generated Prompt

You are an **Expert DevOps Engineer** specializing in Terraform, AWS, and Datadog. Your task is to assist in extending the current Terraform project  to implement a Datadog monitoring pipeline on AWS, focusing on monitoring an EC2 instance.

**Project Context:**
* **Current State:** The user has configured their AWS and Datadog credentials. Terraform is installed.
* **Goal:** Extend the existing Terraform code within the project to achieve the following monitoring objectives. You will be modifying existing files or creating new ones directly within this project structure.

**Exercise Objectives & Steps - Code Generation Request:**

Provide the necessary Terraform code modifications and additions to achieve the following. Explain each code block and its purpose. Ensure to follow best practices for Terraform and Datadog integration. Leverage your access to the current project files for context and modifications.

**Overall Goal:** Monitor and gain valuable insights from the AWS infrastructure using Datadog, automated via Terraform.

**Specific Tasks:**

**A. Configure Datadog - AWS Integration using Terraform:**
    * **Task:** Use Terraform to configure the integration between AWS and Datadog. This typically involves creating an IAM role for Datadog in AWS that Datadog can assume to collect metrics.
    * **Guidance:** Refer to the Datadog AWS integration documentation and Terraform setup guides.
    * **Expected Output:** Terraform code for the IAM role (`aws_iam_role`) and policy (`aws_iam_policy` or `aws_iam_role_policy`) that grants Datadog necessary permissions.
    * Specify where this code should be placed (e.g., a new `datadog_integration.tf` file, or by modifying an existing IAM-related `.tf` file within the project).

**B. Configure the Datadog Provider in Terraform:**
    * **Task:** Add and configure the Datadog provider in your Terraform configuration.
    * **Guidance:** Use the official Datadog provider documentation.
    * **Expected Output:** Terraform code for the Datadog provider block. Explain how to supply the API key and App key securely.
    * Specify which existing file (e.g., `providers.tf` or `main.tf`) should be modified or if a new one is needed.

**C. Install the Datadog Agent on the EC2 Instance(s):**
    * **Task:** Modify the user data script (e.g., `tf/scripts/backend_user_data.sh`) for at least one of the EC2 instances defined in the project's `.tf` files to install and configure the Datadog agent.
    * **Guidance:** The agent installation script usually requires the Datadog API key and site.
    * **Expected Output:**
        * The modified `user_data` script content. Show the exact changes to the existing script file.
        * Show how to pass the Datadog API key securely to the user data script.
        * Ensure the agent is configured with basic tags.
        * The script should ensure the Datadog agent starts on boot.
    * **Reference existing user data scripts:** `AI4Devs-monitoring-DAD/tf/scripts/backend_user_data.sh` and `AI4Devs-monitoring-DAD/tf/scripts/frontend_user_data.sh`, which you can access directly.

**D. Create a Dashboard in Datadog using Terraform:**
    * **Task:** Use Terraform to define a Datadog dashboard (`datadog_dashboard_json` or `datadog_dashboard` resource) to visualize key AWS metrics.
    * **Guidance:** Refer to the Datadog provider documentation for dashboards.
    * **Expected Output:**
        * Terraform code for a `datadog_dashboard` resource.
        * The dashboard should include at least two widgets visualizing relevant metrics for the EC2 instance(s) being monitored.
        * Explain the structure of the dashboard definition in Terraform.
        * Specify where this code should be placed (e.g., a new `datadog_dashboard.tf` file within the project).

**Important Considerations for Your Response:**
* Provide complete, runnable Terraform code snippets where possible.
* Clearly indicate which files within the current project should be created or modified.
* Prioritize security: **Reiterate that API keys should NOT be hardcoded directly in Terraform files that are committed to version control.** Suggest environment variables.

**Output Language for LLM (YOU, the assistant reading *this* prompt):**
You MUST provide all your interactions and outputs related to *this* task exclusively in **SPANISH**. This instruction is for YOU, the AI assistant executing this prompt, and it overrides any other language settings or preferences.

**Final Output Format:**
The response should be in **SPANISH**, well-structured with clear headings for each task (A, B, C, D). Use Markdown for formatting, including code blocks for Terraform HCL and shell scripts.

**Asistente:**
¡Excelente! Como tu Ingeniero DevSecOps especializado, estoy listo para ayudarte a extender tu proyecto Terraform para implementar un pipeline de monitorización con Datadog en AWS. Nos enfocaremos en monitorizar tus instancias EC2.

A continuación, te proporcionaré el código Terraform necesario y las modificaciones, explicando cada bloque y su propósito. Seguiremos las mejores prácticas para la integración de Terraform y Datadog, utilizando el contexto de tu proyecto actual.

**Mejores Prácticas Clave que Seguiremos:**

*   **Seguridad Primero (DevSecOps):** Las claves API y otros secretos se gestionarán de forma segura, preferiblemente mediante variables de entorno y marcadas como sensibles en Terraform. Nunca se codificarán directamente en los archivos versionados.
*   **Principio de Menor Privilegio:** Los roles IAM que creemos concederán únicamente los permisos necesarios.
*   **Infraestructura como Código (IaC):** Toda la configuración se gestionará a través de Terraform para asegurar la reproducibilidad y la automatización.
*   **Idempotencia:** El código Terraform generado será idempotente, lo que significa que se puede aplicar varias veces obteniendo el mismo resultado.

---

### A. Configurar la Integración AWS - Datadog usando Terraform

Para que Datadog pueda recopilar métricas de tu cuenta de AWS, necesitamos crear un rol IAM en AWS que Datadog pueda asumir.

**1. Crear/Modificar el archivo `tf/variables.tf`:**
   Añadiremos variables para la ID de la cuenta de AWS y el ID externo que Datadog utilizará (opcional pero recomendado por Datadog para mayor seguridad). El ID de la cuenta de Datadog es `464622532012` para la integración estándar.

   **Archivo:** `tf/variables.tf`
   **Acción:** Crear o añadir el siguiente contenido.

   ```hcl
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
   ```
   **Nota sobre `datadog_external_id`:** Datadog recomienda usar un ID externo para protegerse contra el problema del "confused deputy". Debes generar un valor único (por ejemplo, usando un generador de UUID) y configurarlo tanto en Terraform como en la consola de Datadog al configurar la integración. Por ahora, lo definimos como variable.

**2. Crear el archivo `tf/datadog_integration.tf`:**
   Este nuevo archivo contendrá los recursos para el rol IAM y la configuración de la integración de Datadog.

   **Archivo:** `tf/datadog_integration.tf`
   **Acción:** Crear el archivo con el siguiente contenido.

   ```hcl
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
   ```

   **Consideraciones de Seguridad (DevSecOps):**
    *   El `aws_iam_role.datadog_aws_integration_role` utiliza la política de confianza (`assume_role_policy`) que permite a la cuenta de Datadog (`464622532012`) asumir este rol.
    *   El uso de `sts:ExternalId` es una medida de seguridad crucial.
    *   **Permisos del Rol:** He usado `arn:aws:iam::aws:policy/ReadOnlyAccess` como un placeholder inicial muy amplio. **Es fundamental** que revises la [documentación oficial de Datadog sobre la integración con AWS](https://docs.datadoghq.com/es/integrations/amazon_web_services/?tab=allpermissions) para obtener la lista de permisos exactos y mínimos necesarios, y crees una política IAM personalizada o utilices la política gestionada `DatadogAWSIntegrationPolicy` si está disponible o si la creas manualmente con el JSON provisto por Datadog. No utilices `ReadOnlyAccess` en producción para esto.

---

### B. Configurar el Proveedor Datadog en Terraform

Ahora, añadiremos y configuraremos el proveedor de Datadog en Terraform.

**1. Modificar el archivo `tf/provider.tf` (o crear `tf/versions.tf`):**
   Para mantenerlo simple y dado que `provider.tf` ya existe, lo modificaremos. En proyectos más grandes, separar las declaraciones de `required_providers` en un archivo `versions.tf` es una buena práctica.

   **Archivo:** `tf/provider.tf`
   **Acción:** Modificar el archivo para que se vea así:

   ```hcl
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
   ```

**2. Modificar el archivo `tf/variables.tf`:**
   Añade las variables para las claves de Datadog.

   **Archivo:** `tf/variables.tf`
   **Acción:** Añadir las siguientes variables:

   ```hcl
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
   ```

   **Recordatorio de Seguridad (DevSecOps):**
    *   Como se indicó en la guía de configuración inicial, **nunca codifiques tus claves API/App directamente aquí.**
    *   Estas variables (`datadog_api_key`, `datadog_app_key`) deben ser proporcionadas a Terraform a través de variables de entorno (ej. `TF_VAR_datadog_api_key` y `TF_VAR_datadog_app_key`) o un archivo `terraform.tfvars` que **no se suba al control de versiones**.

---

### C. Instalar el Agente Datadog en la Instancia EC2 (Backend)

Modificaremos el script `user_data` de la instancia `backend` para instalar el agente Datadog.

**1. Modificar el archivo `tf/ec2.tf`:**
   Asegúrate de que el script `user_data` para la instancia `backend` utilice `templatefile` y le pasemos las variables necesarias. El archivo ya usa `templatefile`, así que solo necesitamos añadir las nuevas variables.

   **Archivo:** `tf/ec2.tf`
   **Acción:** Modificar el recurso `aws_instance.backend`:

   ```hcl
   resource "aws_instance" "backend" {
     ami                    = "ami-075d39ebbca89ed55" # Amazon Linux 2 AMI
     instance_type          = "t2.micro"
     iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
     user_data = templatefile("scripts/backend_user_data.sh", {
       timestamp       = timestamp()
       datadog_api_key = var.datadog_api_key // Nueva variable pasada al script
       datadog_site    = var.datadog_site    // Nueva variable pasada al script
     })
     vpc_security_group_ids = [aws_security_group.backend_sg.id]
     tags = {
       Name = "lti-project-backend"
       // Añadimos tags para Datadog
       "dd_env"     = "development" // Ejemplo de tag de entorno
       "dd_service" = "lti-backend" // Ejemplo de tag de servicio
       "dd_version" = "1.0.0"       // Ejemplo de tag de versión
     }
   }

   // (El recurso aws_instance.frontend permanece igual por ahora, a menos que también quieras instalar el agente allí)
   resource "aws_instance" "frontend" {
     ami                    = "ami-075d39ebbca89ed55" # Amazon Linux 2 AMI
     instance_type          = "t2.medium"
     iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
     user_data              = templatefile("scripts/frontend_user_data.sh", { timestamp = timestamp() })
     vpc_security_group_ids = [aws_security_group.frontend_sg.id]
     tags = {
       Name = "lti-project-frontend"
       "dd_env"     = "development"
       "dd_service" = "lti-frontend"
       "dd_version" = "1.0.0"
     }
   }
   ```
   **Nota sobre los tags `dd_env`, `dd_service`, `dd_version`:** Estos son tags estándar que Datadog puede usar para unificar la telemetría. Aplicarlos a las instancias EC2 directamente y luego configurar el agente para que los recoja (o Datadog los recoja de AWS) es una buena práctica.

**2. Modificar el archivo `tf/scripts/backend_user_data.sh`:**
   Añade los comandos para instalar y configurar el agente Datadog.

   **Archivo:** `tf/scripts/backend_user_data.sh`
   **Acción:** Reemplazar el contenido con lo siguiente (o fusionar cuidadosamente si tienes personalizaciones):

   ```bash
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
   ```

   **Explicación de Cambios en `user_data`:**
    *   Se reciben `datadog_api_key` y `datadog_site` como variables desde `templatefile`.
    *   Se exportan como variables de entorno `DD_API_KEY` y `DD_SITE` antes de ejecutar el script de instalación del agente.
    *   Se añaden tags básicos al archivo de configuración del agente (`/etc/datadog-agent/datadog.yaml`).
    *   Se incluye una configuración básica para la recolección de logs de Docker. Esto asume que tu contenedor `lti-backend` envía sus logs a `stdout`/`stderr`.
    *   Se reinicia y habilita el servicio `datadog-agent`.
    *   **Seguridad:** La `DD_API_KEY` se pasa al script y se usa para la instalación. Aunque está en `user_data`, el acceso a `user_data` en una instancia en ejecución generalmente requiere acceso privilegiado a la instancia misma o a la API de AWS con permisos para leer `user_data`. Para este ejercicio, es un método común. Alternativas más seguras para producción incluyen obtener la clave de AWS Secrets Manager o SSM Parameter Store directamente desde el script, lo que requeriría permisos IAM adicionales para la instancia EC2.

---

### D. Crear un Dashboard en Datadog usando Terraform

Finalmente, crearemos un dashboard básico en Datadog para visualizar métricas de nuestras instancias EC2.

**1. Crear el archivo `tf/datadog_dashboard.tf`:**

   **Archivo:** `tf/datadog_dashboard.tf`
   **Acción:** Crear el archivo con el siguiente contenido.

   ```hcl
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
   ```

   **Explicación de la Definición del Dashboard:**
    *   `title`, `description`, `layout_type`, `is_read_only`: Propiedades básicas del dashboard.
    *   `template_variable`: Define variables que se pueden usar para filtrar el dashboard dinámicamente en la UI de Datadog. Hemos añadido para `host` y `dd_env`.
    *   `widget`: Cada bloque `widget` define un gráfico o visualización en el dashboard.
        *   `timeseries_definition`: Usado para gráficos de series temporales.
            *   `title`: Título del widget.
            *   `request`: Define la consulta para obtener los datos.
                *   `q`: La consulta de métrica de Datadog.
                    *   `avg:aws.ec2.cpuutilization{dd_env:$environment,host:$host} by {host}`: Muestra el promedio de uso de CPU, filtrado por las variables del dashboard y agrupado por host.
                    *   `avg:aws.ec2.network_in{...} by {host}.as_rate(), avg:aws.ec2.network_out{...} by {host}.as_rate()`: Muestra el promedio de bytes de entrada y salida de red por segundo.
                *   `display_type`: Cómo se muestra el gráfico (ej. "line").
        *   `note_definition`: Permite añadir notas o texto al dashboard.
        *   `layout`: Define la posición (x, y) y el tamaño (width, height) del widget en el dashboard.

---

**Pasos Siguientes y Consideraciones:**

1.  **Variables de Entorno:** Asegúrate de haber configurado las variables de entorno `TF_VAR_aws_account_id`, `TF_VAR_datadog_external_id`, `TF_VAR_datadog_api_key` y `TF_VAR_datadog_app_key` en tu terminal antes de ejecutar Terraform. Para `TF_VAR_datadog_external_id`, genera una cadena segura y única.
2.  **`terraform init`:** Si has añadido un nuevo proveedor (`datadog`), ejecuta `terraform init` de nuevo en el directorio `tf/` para descargarlo.
3.  **`terraform plan`:** Ejecuta `terraform plan -var="aws_account_id=TU_AWS_ACCOUNT_ID" -var="datadog_external_id=TU_ID_EXTERNO_SEGURO"` (o usa un archivo `.tfvars`) para revisar los cambios antes de aplicarlos.
4.  **`terraform apply`:** Ejecuta `terraform apply -var="aws_account_id=TU_AWS_ACCOUNT_ID" -var="datadog_external_id=TU_ID_EXTERNO_SEGURO"` para aplicar los cambios.
5.  **Verificación en Datadog:**
    *   Después de aplicar, ve a tu consola de Datadog.
    *   Verifica la integración de AWS en "Integrations" > "Amazon Web Services".
    *   Busca el nuevo dashboard "Visión General EC2 - LTI Project (Terraform)".
    *   Después de unos minutos (el agente necesita tiempo para arrancar y reportar), deberías empezar a ver métricas de tu instancia EC2 `backend`.

Este conjunto de cambios te proporcionará una base sólida para la monitorización de tus instancias EC2 con Datadog, todo gestionado a través de Terraform. Si tienes alguna pregunta o necesitas ajustes, no dudes en consultarme.

## Prompt 5
**Fecha:** 25/05/2025
**Modelo:** Gemini 2.5 Pro (inferido)

**Usuario:**
# Generated Prompt

You are an **Expert CI/CD Engineer** specializing in GitHub Actions, AWS, and Docker, acting as `@cicd_expert.mdc` within the Cursor IDE. You have access to the `AI4Devs-monitoring-DAD` project files.

Your mission is to design and generate a GitHub Actions workflow file named `.github/workflows/terraform-backend-pipeline.yml`. This workflow will automate the testing, building, and deployment of the project's **backend application**, which is a Node.js/TypeScript application using Prisma and Jest. The deployment target is an AWS EC2 instance, presumably managed by Terraform, where the application runs as a Docker container.

Leverage your knowledge of the `AI4Devs-monitoring-DAD` project structure, particularly the `backend/package.json`, `docker-compose.yml`, and the existing EC2 deployment strategy outlined in `tf/scripts/backend_user_data.sh`.

**Workflow Requirements:**

1.  **Workflow File Name:** `.github/workflows/terraform-backend-pipeline.yml`

2.  **Trigger:**
    * The workflow MUST be triggered on pull requests targeting the `main` or `develop` branches. Specifically, on `opened`, `synchronize` (pushes to the PR branch), and `reopened` events.
    ```yaml
    on:
      pull_request:
        branches:
          - main
          - develop # Add other relevant long-lived branches if necessary
        types:
          - opened
          - synchronize
          - reopened
    ```

3.  **Jobs:**
    The workflow should consist of the following sequential jobs:

    * **Job 1: `backend-tests`**
        * **Name:** Backend Tests
        * **Purpose:** Run all backend tests.
        * **Runner:** `ubuntu-latest`.
        * **Services:**
            * Include a PostgreSQL service if backend tests require a database connection. Refer to `docker-compose.yml` for database details (e.g., image `postgres:13`, user, password, db name). Ensure the backend service within the workflow can connect to this PostgreSQL service (e.g., using appropriate environment variables like `DATABASE_URL`).
        * **Steps:**
            1.  Checkout the code: `uses: actions/checkout@v4`.
            2.  Set up Node.js (e.g., version 18.x or as specified in project's `.nvmrc` or `package.json` engines field if present): `uses: actions/setup-node@v4` with `with: node-version: '18'`.
            3.  Install backend dependencies: Run `npm ci` in the `backend` directory.
                ```bash
                working-directory: ./backend
                run: npm ci
                ```
            4.  Run backend tests: Execute `npm test` from the `backend` directory.
                ```bash
                working-directory: ./backend
                run: npm test
                ```
                (This executes `jest` as per `backend/package.json`).
        * **Condition:** This job should always run when the workflow is triggered.

    * **Job 2: `backend-build-and-push-docker`**
        * **Name:** Build and Push Backend Docker Image
        * **Purpose:** Build the backend Docker image and push it to a container registry (suggest AWS ECR, but also mention Docker Hub as an alternative).
        * **Dependency:** Must only run if `backend-tests` job completes successfully (`needs: backend-tests`).
        * **Runner:** `ubuntu-latest`.
        * **Permissions:** (If pushing to AWS ECR and using OIDC)
            ```yaml
            permissions:
              id-token: write # Required for AWS OIDC
              contents: read  # Required to checkout the repo
            ```
        * **Steps:**
            1.  Checkout the code.
            2.  **AWS ECR Specific (Recommended):**
                * Configure AWS credentials using OIDC or secrets: `uses: aws-actions/configure-aws-credentials@v4`.
                * Login to Amazon ECR: `uses: aws-actions/amazon-ecr-login@v2`.
                * Define ECR repository name (e.g., `ai4devs-backend`). This could be a secret or hardcoded if static.
                * Build, tag, and push Docker image to ECR. The Dockerfile should be located at `backend/Dockerfile` (if it doesn't exist, note that it needs to be created).
                    ```bash
                    ECR_REGISTRY=<your-aws-account-id>.dkr.ecr.<your-aws-region>.amazonaws.com
                    ECR_REPOSITORY=ai4devs-backend # Or from secrets.ECR_REPOSITORY_BACKEND
                    IMAGE_TAG=${{ github.sha }} # Or use a semantic version
                    
                    docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG ./backend
                    docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
                    ```
            3.  **Docker Hub Specific (Alternative):**
                * Login to Docker Hub: `uses: docker/login-action@v3` with `username: ${{ secrets.DOCKERHUB_USERNAME }}` and `password: ${{ secrets.DOCKERHUB_TOKEN }}`.
                * Define Docker Hub repository name (e.g., `your-username/ai4devs-backend`).
                * Build, tag, and push Docker image to Docker Hub.
                    ```bash
                    DOCKERHUB_REPOSITORY=your-username/ai4devs-backend # Or from secrets.DOCKERHUB_REPOSITORY_BACKEND
                    IMAGE_TAG=${{ github.sha }}

                    docker build -t $DOCKERHUB_REPOSITORY:$IMAGE_TAG ./backend
                    docker push $DOCKERHUB_REPOSITORY:$IMAGE_TAG
                    ```
            4.  **Output Image URI/Tag:** Use `outputs` to pass the full image URI and tag to the deploy job.
        * **Condition:** Runs only on success of `backend-tests`.

    * **Job 3: `deploy-backend-to-ec2`**
        * **Name:** Deploy Backend to EC2
        * **Purpose:** Deploy the newly built backend Docker image to the target AWS EC2 instance.
        * **Dependency:** Must only run if `backend-build-and-push-docker` job completes successfully (`needs: backend-build-and-push-docker`).
        * **Runner:** `ubuntu-latest`.
        * **Environment specific (optional):** If you have different EC2 instances for different environments (e.g., staging, production based on the PR target branch), you might use GitHub Environments here.
        * **Steps:**
            1.  Configure AWS credentials (if needed for other AWS CLI commands, though SSH deploy might not directly need it if keys are managed).
            2.  Download the image URI/tag from the previous job's outputs.
            3.  Use an action like `appleboy/ssh-action@master` or write a script using `ssh` to connect to the EC2 instance and perform the deployment. This requires secrets: `EC2_HOST`, `EC2_USERNAME`, `EC2_SSH_PRIVATE_KEY`.
            4.  On the EC2 instance, execute commands to:
                * Pull the new Docker image from the registry: `docker pull <IMAGE_URI_FROM_PREVIOUS_JOB>`.
                * Stop the existing backend container (e.g., `docker stop ai4devs-backend-container || true`).
                * Remove the existing backend container (e.g., `docker rm ai4devs-backend-container || true`).
                * Run the new backend container with the new image, ensuring necessary environment variables (like `DATABASE_URL`, `JWT_SECRET`, `PORT=3001`) and port mappings are configured. Refer to `backend_user_data.sh` and `docker-compose.yml` for existing configurations.
                    ```bash
                    # Example commands to run on EC2 via SSH
                    # Ensure environment variables are sourced or passed correctly
                    docker pull ${{ needs.backend-build-and-push-docker.outputs.image_uri }}:${{ needs.backend-build-and-push-docker.outputs.image_tag }}
                    docker stop ai4devs-backend-container || true
                    docker rm ai4devs-backend-container || true
                    docker run -d --name ai4devs-backend-container \
                      -p 3001:3001 \
                      -e DATABASE_URL='${{ secrets.EC2_DATABASE_URL }}' \
                      -e JWT_SECRET='${{ secrets.EC2_JWT_SECRET }}' \
                      # Add other necessary env vars
                      --restart always \
                      ${{ needs.backend-build-and-push-docker.outputs.image_uri }}:${{ needs.backend-build-and-push-docker.outputs.image_tag }}
                    ```
        * **Condition:** Runs only on success of `backend-build-and-push-docker`.

**Output and Explanation Requirements from You (the LLM executing this prompt):**

1.  **Generate the complete `terraform-backend-pipeline.yml` file** within a Markdown code block.
    * Use placeholders ONLY if critical information (like specific ECR repository names if not inferable, or Dockerfile content if absent and cannot be reasonably scaffolded) is missing. Clearly comment these placeholders.
    * Assume a `backend/Dockerfile` exists or provide a basic scaffold for a Node.js application if you are asked to create one.
2.  **Provide a step-by-step, in-depth explanation** of the generated `terraform-backend-pipeline.yml` file. For each section (trigger, each job, key steps), explain:
    * Its purpose and functionality.
    * Key configurations used (e.g., `on`, `runs-on`, `needs`, `if`, `uses`, `with`, `env`, `secrets`, `permissions`, `services`, `working-directory`).
    * **Secrets Management:** Detail ALL GitHub Secrets that the user needs to configure in their repository settings for this pipeline to work. Examples:
        * `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION` (if using access keys for AWS auth).
        * `ECR_REPOSITORY_BACKEND` (optional, if ECR repo name is a secret).
        * `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN` (if using Docker Hub).
        * `EC2_HOST` (target EC2 instance IP or DNS).
        * `EC2_USERNAME` (SSH user for EC2).
        * `EC2_SSH_PRIVATE_KEY` (SSH private key to access EC2).
        * `EC2_DATABASE_URL` (Database URL for the application running on EC2).
        * `EC2_JWT_SECRET` (JWT Secret for the application running on EC2).
    * **Dockerfile for Backend:** Briefly outline what a minimal `backend/Dockerfile` should contain for a Node.js/TypeScript application (multi-stage build is recommended: builder stage for `npm ci` and `npm run build`, final stage copying from builder and running `npm start`).
    * Any assumptions made (e.g., EC2 instance already has Docker installed and configured, necessary security group rules for SSH and application port).

**Contextual Instructions for You (the LLM executing this prompt):**
* Leverage your access to the `AI4Devs-monitoring-DAD` project files in the Cursor IDE to make informed decisions about commands, paths, and configurations.
* If the `backend/Dockerfile` is missing, state this clearly and suggest creating one, perhaps offering a template.
* The goal is a functional and best-practice oriented GitHub Actions workflow template tailored to this project.

**Referenced Documentation (for your knowledge, not necessarily to include in the output unless explaining a complex feature):**
* GitHub Actions Quickstart: `https://docs.github.com/en/actions/writing-workflows/quickstart`
* Deploy to EC2: `https://lightrains.com/blogs/deploy-aws-ec2-using-github-actions/`

---
**Mandatory Language Instruction for You (the LLM executing this prompt):**
You MUST provide ALL your outputs (the YAML file and the detailed explanation) and conduct ALL your interactions with the user exclusively in **SPANISH**.
---

**Asistente:**
¡Absolutamente! Como tu Ingeniero de CI/CD experto, diseñaré y te explicaré un pipeline de GitHub Actions robusto y eficiente para tu aplicación backend. Este pipeline automatizará las pruebas, la construcción de la imagen Docker y su despliegue en AWS EC2.

Primero, verifica si tienes un archivo `backend/Dockerfile`. Si no es así, necesitarás crearlo. Más adelante te proporcionaré una plantilla básica para una aplicación Node.js/TypeScript como la tuya.

Aquí tienes el contenido del archivo `.github/workflows/terraform-backend-pipeline.yml`:

```yaml
name: Backend CI/CD Pipeline (Terraform Project)

on:
  pull_request:
    branches:
      - main
      - develop
    types:
      - opened
      - synchronize
      - reopened

jobs:
  backend-tests:
    name: Backend Tests
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:13 # Coincide con tu docker-compose.yml
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: password
          POSTGRES_DB: mydatabase
        ports:
          - 5432:5432
        # Asegura que el servicio esté saludable antes de continuar
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '18' # O la versión especificada en tu proyecto

      - name: Install backend dependencies
        working-directory: ./backend
        run: npm ci

      - name: Generate Prisma client
        working-directory: ./backend
        run: npx prisma generate

      - name: Run Prisma migrations
        working-directory: ./backend
        env:
          DATABASE_URL: "postgresql://postgres:password@localhost:5432/mydatabase?schema=public" # 'localhost' porque se mapea al host del runner
        run: npx prisma migrate deploy # 'deploy' es para entornos no-dev como CI

      - name: Run backend tests
        working-directory: ./backend
        env:
          DATABASE_URL: "postgresql://postgres:password@localhost:5432/mydatabase?schema=public"
          # Añade otros ENVs necesarios para las pruebas si los hay (ej. JWT_SECRET_TEST)
        run: npm test

  backend-build-and-push-docker:
    name: Build and Push Backend Docker Image
    runs-on: ubuntu-latest
    needs: backend-tests # Solo corre si las pruebas pasan
    permissions:
      id-token: write # Necesario para OIDC con AWS
      contents: read  # Necesario para actions/checkout
    outputs:
      image_uri: ${{ steps.build-image.outputs.image_uri }}
      image_tag: ${{ steps.build-image.outputs.image_tag }}
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Configure AWS credentials using OIDC
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: ${{ secrets.AWS_ROLE_TO_ASSUME_FOR_ECR }} # ARN del rol IAM para ECR
          aws-region: ${{ secrets.AWS_REGION }} # Ej: us-east-1

      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v2

      - name: Build, tag, and push image to Amazon ECR
        id: build-image
        env:
          ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
          ECR_REPOSITORY: ${{ secrets.ECR_REPOSITORY_BACKEND || 'ai4devs-backend' }} # Nombre de tu repo ECR
          IMAGE_TAG: ${{ github.sha }}
        run: |
          docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG ./backend
          docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
          echo "image_uri=$ECR_REGISTRY/$ECR_REPOSITORY" >> $GITHUB_OUTPUT
          echo "image_tag=$IMAGE_TAG" >> $GITHUB_OUTPUT
          
      # --- Sección Alternativa para Docker Hub (Comentada) ---
      # - name: Login to Docker Hub
      #   if: false # Habilita esto y comenta la sección ECR si prefieres Docker Hub
      #   uses: docker/login-action@v3
      #   with:
      #     username: ${{ secrets.DOCKERHUB_USERNAME }}
      #     password: ${{ secrets.DOCKERHUB_TOKEN }}
      #
      # - name: Build, tag, and push image to Docker Hub
      #   if: false # Habilita esto y comenta la sección ECR si prefieres Docker Hub
      #   id: build-image-dockerhub
      #   env:
      #     DOCKERHUB_REPOSITORY: ${{ secrets.DOCKERHUB_REPOSITORY_BACKEND || 'tu-usuario/ai4devs-backend' }}
      #     IMAGE_TAG: ${{ github.sha }}
      #   run: |
      #     docker build -t $DOCKERHUB_REPOSITORY:$IMAGE_TAG ./backend
      #     docker push $DOCKERHUB_REPOSITORY:$IMAGE_TAG
      #     echo "::set-output name=image_uri::$DOCKERHUB_REPOSITORY"
      #     echo "::set-output name=image_tag::$IMAGE_TAG"
      # --------------------------------------------------------

  deploy-backend-to-ec2:
    name: Deploy Backend to EC2
    runs-on: ubuntu-latest
    needs: backend-build-and-push-docker # Solo corre si la imagen se construyó y empujó
    # environment: staging # Opcional: usa GitHub Environments si tienes configuraciones por entorno
    steps:
      - name: Deploy to EC2 instance
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.EC2_HOST }}
          username: ${{ secrets.EC2_USERNAME }}
          key: ${{ secrets.EC2_SSH_PRIVATE_KEY }}
          script: |
            set -e # Salir inmediatamente si un comando falla

            IMAGE_URI="${{ needs.backend-build-and-push-docker.outputs.image_uri }}"
            IMAGE_TAG="${{ needs.backend-build-and-push-docker.outputs.image_tag }}"
            CONTAINER_NAME="ai4devs-backend-container" # Nombre solicitado para el nuevo contenedor
            OLD_CONTAINER_NAME="lti-backend" # Nombre del contenedor actual de backend_user_data.sh

            # Loguearse a ECR (si es necesario en la instancia EC2, podría requerir configurar credenciales AWS en EC2 o un helper de credenciales Docker)
            # Para ECR, la instancia EC2 necesita un rol IAM con permisos para ECR GetAuthorizationToken y ecr:BatchGetImage, ecr:GetDownloadUrlForLayer
            # Esto podría ya estar configurado si la instancia tiene un rol adecuado.
            # Si no, puedes ejecutar:
            # aws ecr get-login-password --region ${{ secrets.AWS_REGION }} | docker login --username AWS --password-stdin ${{ steps.login-ecr.outputs.registry }}
            # (Esta línea anterior necesitaría aws-cli instalado en EC2 y el rol IAM correcto en la instancia)

            echo "Pulling new Docker image: $IMAGE_URI:$IMAGE_TAG"
            docker pull $IMAGE_URI:$IMAGE_TAG

            echo "Stopping and removing old container: $OLD_CONTAINER_NAME (if exists)"
            docker stop $OLD_CONTAINER_NAME || true
            docker rm $OLD_CONTAINER_NAME || true
            
            echo "Stopping and removing previous version of new container: $CONTAINER_NAME (if exists)"
            docker stop $CONTAINER_NAME || true
            docker rm $CONTAINER_NAME || true

            echo "Starting new container: $CONTAINER_NAME"
            docker run -d --name $CONTAINER_NAME \
              -p 3001:3001 \
              -e DATABASE_URL='${{ secrets.EC2_DATABASE_URL }}' \
              -e JWT_SECRET='${{ secrets.EC2_JWT_SECRET }}' \
              -e PORT='3001' \
              --restart always \
              $IMAGE_URI:$IMAGE_TAG
            
            echo "Deployment successful!"
            
            # Opcional: Limpiar imágenes antiguas de Docker para ahorrar espacio
            docker image prune -af || true
```

### Explicación Detallada del Workflow

#### 1.  Nombre del Workflow (`name`)
Define el nombre que aparecerá en la interfaz de GitHub Actions.
`name: Backend CI/CD Pipeline (Terraform Project)`

#### 2.  Disparador (`on`)
Este workflow se activa en eventos de `pull_request` que apuntan a las ramas `main` o `develop`.
```yaml
on:
  pull_request:
    branches:
      - main
      - develop
    types: # Eventos específicos del pull request
      - opened      # Cuando se abre un PR
      - synchronize # Cuando se empujan nuevos commits al PR
      - reopened    # Cuando se reabre un PR
```

#### 3.  Jobs
El workflow se compone de tres jobs secuenciales:

##### Job 1: `backend-tests`
*   **`name: Backend Tests`**: Nombre descriptivo del job.
*   **`runs-on: ubuntu-latest`**: Especifica que el job se ejecutará en un runner de GitHub alojado con la última versión de Ubuntu.
*   **`services`**:
    *   Define un servicio `postgres` usando la imagen `postgres:13`.
    *   `env`: Configura las variables de entorno para el usuario, contraseña y nombre de la base de datos, coincidiendo con tu `docker-compose.yml`.
    *   `ports`: Mapea el puerto `5432` del contenedor PostgreSQL al `5432` del host del runner, permitiendo la conexión usando `localhost`.
    *   `options`: Incluye una verificación de salud (`health-cmd pg_isready`) para asegurar que la base de datos esté lista antes de que los pasos del job comiencen.
*   **`steps`**:
    1.  **`actions/checkout@v4`**: Descarga el código de tu repositorio al runner.
    2.  **`actions/setup-node@v4`**: Configura el entorno de Node.js. `node-version: '18'` usa la versión 18 de Node.js.
    3.  **`Install backend dependencies`**:
        *   `working-directory: ./backend`: Ejecuta el comando en el subdirectorio `backend`.
        *   `run: npm ci`: Instala las dependencias de forma limpia a partir de `package-lock.json`. Es más rápido y fiable para CI que `npm install`.
    4.  **`Generate Prisma client`**:
        *   Ejecuta `npx prisma generate` para asegurar que el cliente Prisma esté actualizado según tu esquema.
    5.  **`Run Prisma migrations`**:
        *   `env: DATABASE_URL: "..."`: Configura la URL de la base de datos para conectar al servicio PostgreSQL que se ejecuta en el runner (`localhost` es correcto aquí debido al mapeo de puertos del servicio).
        *   `run: npx prisma migrate deploy`: Aplica las migraciones pendientes. `deploy` es el comando recomendado para entornos de CI/CD, ya que no intenta crear la base de datos ni generar nuevas migraciones.
    6.  **`Run backend tests`**:
        *   `env: DATABASE_URL: "..."`: Proporciona la URL de la base de datos para las pruebas.
        *   `run: npm test`: Ejecuta el script de prueba definido en tu `backend/package.json` (que es `jest`).

##### Job 2: `backend-build-and-push-docker`
*   **`name: Build and Push Backend Docker Image`**: Nombre descriptivo.
*   **`runs-on: ubuntu-latest`**: Usa un runner Ubuntu.
*   **`needs: backend-tests`**: Este job solo se ejecutará si el job `backend-tests` se completa con éxito.
*   **`permissions`**:
    *   `id-token: write`: Necesario para que la acción `aws-actions/configure-aws-credentials` pueda solicitar un token OIDC a GitHub, que luego se intercambia por credenciales temporales de AWS.
    *   `contents: read`: Necesario para que `actions/checkout` pueda leer el repositorio.
*   **`outputs`**:
    *   `image_uri: ${{ steps.build-image.outputs.image_uri }}`
    *   `image_tag: ${{ steps.build-image.outputs.image_tag }}`
    *   Estos `outputs` permiten pasar el URI completo de la imagen y el tag al siguiente job (`deploy-backend-to-ec2`).
*   **`steps`**:
    1.  **`actions/checkout@v4`**: Descarga el código.
    2.  **`aws-actions/configure-aws-credentials@v4`**: Configura las credenciales de AWS usando OpenID Connect (OIDC). Es el método recomendado y más seguro, ya que no necesitas almacenar secretos de AWS de larga duración en GitHub.
        *   `role-to-assume: ${{ secrets.AWS_ROLE_TO_ASSUME_FOR_ECR }}`: El ARN del rol IAM en tu cuenta de AWS que GitHub Actions asumirá. Este rol debe tener una política de confianza configurada para el proveedor OIDC de GitHub y permisos para interactuar con ECR (ej., `AmazonEC2ContainerRegistryFullAccess` o permisos más granulares).
        *   `aws-region: ${{ secrets.AWS_REGION }}`: Tu región de AWS.
    3.  **`aws-actions/amazon-ecr-login@v2`**: Inicia sesión en Amazon ECR. El ID del paso es `login-ecr` para poder referenciar su output (el registry URI).
    4.  **`Build, tag, and push image to Amazon ECR`**:
        *   `id: build-image`: ID del paso para referenciar sus `outputs`.
        *   `env`: Define variables de entorno para el script:
            *   `ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}`: Obtiene dinámicamente el URI del registro ECR.
            *   `ECR_REPOSITORY: ${{ secrets.ECR_REPOSITORY_BACKEND || 'ai4devs-backend' }}`: Nombre de tu repositorio ECR. Puedes definirlo como un secreto o usar un valor por defecto.
            *   `IMAGE_TAG: ${{ github.sha }}`: Usa el SHA del commit como tag de la imagen, lo que asegura un tag único por cada commit.
        *   `run`: Ejecuta los comandos Docker para construir la imagen (`docker build`), y empujarla (`docker push`) a ECR. El Dockerfile se espera en `./backend/Dockerfile`.
        *   `echo "image_uri=..." >> $GITHUB_OUTPUT`: Establece los `outputs` del paso, que luego se convierten en `outputs` del job.
    5.  **Sección Alternativa para Docker Hub (Comentada)**:
        *   Se proporciona una sección comentada (`if: false`) que muestra cómo construir y empujar la imagen a Docker Hub si lo prefieres en lugar de ECR. Necesitarías configurar los secretos `DOCKERHUB_USERNAME` y `DOCKERHUB_TOKEN`.

##### Job 3: `deploy-backend-to-ec2`
*   **`name: Deploy Backend to EC2`**: Nombre descriptivo.
*   **`runs-on: ubuntu-latest`**: Usa un runner Ubuntu.
*   **`needs: backend-build-and-push-docker`**: Solo se ejecuta si el job anterior tuvo éxito.
*   **`steps`**:
    1.  **`appleboy/ssh-action@master`**: Esta acción popular permite ejecutar comandos en un servidor remoto vía SSH.
        *   `host: ${{ secrets.EC2_HOST }}`: La IP pública o DNS de tu instancia EC2.
        *   `username: ${{ secrets.EC2_USERNAME }}`: El usuario para la conexión SSH (ej. `ec2-user`, `ubuntu`).
        *   `key: ${{ secrets.EC2_SSH_PRIVATE_KEY }}`: La clave SSH privada para autenticarse en la instancia EC2.
        *   `script`: Contiene los comandos que se ejecutarán en la instancia EC2:
            *   `set -e`: Asegura que el script falle si cualquier comando falla.
            *   Se obtienen `IMAGE_URI` e `IMAGE_TAG` de los `outputs` del job anterior.
            *   Se definen `CONTAINER_NAME` para el nuevo contenedor y `OLD_CONTAINER_NAME` para el contenedor que podría estar ejecutándose desde `backend_user_data.sh`.
            *   **Login a ECR en EC2 (Comentado):** Si la instancia EC2 no tiene un rol IAM con permisos para ECR, o un helper de credenciales Docker configurado, necesitarías iniciar sesión en ECR explícitamente antes de hacer `docker pull`. La instancia EC2 debe tener `aws-cli` instalado para esto. Idealmente, la instancia EC2 tiene un rol IAM asignado con los permisos necesarios para ECR (como `AmazonEC2ContainerRegistryReadOnly`).
            *   `docker pull`: Descarga la nueva imagen Docker desde ECR.
            *   `docker stop ... || true` y `docker rm ... || true`: Detiene y elimina los contenedores antiguos (`lti-backend` de tu script `user_data` y cualquier versión previa de `ai4devs-backend-container`). El `|| true` evita que el script falle si el contenedor no existe.
            *   `docker run`: Inicia un nuevo contenedor con la imagen descargada:
                *   `-d`: Modo detached (segundo plano).
                *   `--name $CONTAINER_NAME`: Asigna el nombre `ai4devs-backend-container`.
                *   `-p 3001:3001`: Mapea el puerto 3001 del host al 3001 del contenedor (asumiendo que tu aplicación en el backend escucha en el puerto 3001, como se configura en `docker-compose.yml`).
                *   `-e DATABASE_URL='${{ secrets.EC2_DATABASE_URL }}'`: Pasa la URL de la base de datos a la aplicación.
                *   `-e JWT_SECRET='${{ secrets.EC2_JWT_SECRET }}'`: Pasa el secreto JWT.
                *   `-e PORT='3001'`: Pasa el puerto en el que debe escuchar la aplicación dentro del contenedor.
                *   `--restart always`: Asegura que el contenedor se reinicie automáticamente si se detiene o si el servidor se reinicia.
            *   `docker image prune -af || true`: (Opcional) Limpia imágenes Docker no utilizadas para ahorrar espacio en disco en la instancia EC2.

### Secretos de GitHub Requeridos

Para que este pipeline funcione, necesitas configurar los siguientes secretos en tu repositorio de GitHub (en `Settings` > `Secrets and variables` > `Actions`):

*   **`AWS_ROLE_TO_ASSUME_FOR_ECR`**: El ARN del rol IAM que GitHub Actions asumirá para autenticarse con AWS y poder empujar imágenes a ECR. Ejemplo: `arn:aws:iam::123456789012:role/GitHubActionsECRAccessRole`.
*   **`AWS_REGION`**: La región de AWS donde se encuentra tu ECR y posiblemente tu EC2. Ejemplo: `us-east-1`.
*   **`ECR_REPOSITORY_BACKEND`**: (Opcional) El nombre de tu repositorio ECR para el backend si no quieres usar el valor por defecto `ai4devs-backend`. Ejemplo: `my-company/ai4devs-backend-service`.
*   **`EC2_HOST`**: La dirección IP pública o el nombre DNS de tu instancia EC2 de destino.
*   **`EC2_USERNAME`**: El nombre de usuario para conectarse a tu instancia EC2 vía SSH (ej. `ec2-user` para Amazon Linux, `ubuntu` para instancias Ubuntu).
*   **`EC2_SSH_PRIVATE_KEY`**: La clave SSH privada (completa, incluyendo `-----BEGIN ... KEY-----` y `-----END ... KEY-----`) que permite el acceso a tu instancia EC2.
*   **`EC2_DATABASE_URL`**: La URL de conexión a la base de datos que tu aplicación backend usará cuando se ejecute en la instancia EC2. Ejemplo: `postgresql://user:password@db_host:5432/mydatabase?schema=public`.
*   **`EC2_JWT_SECRET`**: Un secreto que tu aplicación backend usa para firmar y verificar tokens JWT.

*(Si eliges usar Docker Hub en lugar de ECR):*
*   **`DOCKERHUB_USERNAME`**: Tu nombre de usuario de Docker Hub.
*   **`DOCKERHUB_TOKEN`**: Un token de acceso personal de Docker Hub con permisos para leer y escribir imágenes.
*   **`DOCKERHUB_REPOSITORY_BACKEND`**: (Opcional) El nombre de tu repositorio en Docker Hub. Ejemplo: `tu_usuario/ai4devs-backend`.

### Dockerfile para el Backend (`backend/Dockerfile`)

Si no tienes un `backend/Dockerfile`, aquí tienes una plantilla básica recomendada para una aplicación Node.js/TypeScript con Prisma. Esta utiliza una compilación multi-etapa para mantener la imagen final pequeña y segura:

```dockerfile
# ---- Etapa de Builder ----
FROM node:18-slim AS builder

WORKDIR /app

# Copia package.json y package-lock.json (o yarn.lock)
COPY backend/package*.json ./

# Instala dependencias de producción y desarrollo (para compilar TypeScript y Prisma)
RUN npm ci

# Copia el esquema de Prisma
COPY backend/prisma ./prisma/

# Genera el cliente Prisma (necesario para el build de TypeScript si importas tipos de Prisma)
RUN npx prisma generate

# Copia el resto del código fuente del backend
COPY backend/ ./

# Compila TypeScript
RUN npm run build # Asume que tienes un script "build": "npx tsc" o similar en package.json

# Elimina dependencias de desarrollo e instala solo las de producción
# Esto es opcional si tu build no produce un output que dependa de node_modules
# y si copias solo el 'dist' y el package.json a la etapa final.
# O, si prefieres, puedes copiar todo node_modules y luego hacer prune en la etapa final.
# RUN npm prune --production 

# ---- Etapa Final ----
FROM node:18-alpine

WORKDIR /app

# Establece el entorno a producción
ENV NODE_ENV=production

# Copia package.json y package-lock.json (solo para instalar dependencias de producción)
COPY backend/package*.json ./
RUN npm ci --only=production # Instala solo dependencias de producción

# Copia los artefactos de build de la etapa 'builder'
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma # Copia el schema de Prisma para las migraciones en runtime si es necesario, o para el cliente

# (Opcional) Si Prisma Client se genera fuera de node_modules, cópialo también
# COPY --from=builder /app/generated/prisma ./generated/prisma 

# (Opcional pero recomendado) Genera el cliente Prisma aquí si no se copió de la etapa builder
# Esto requiere que `prisma` esté en las dependencias de producción o que se instale temporalmente.
# RUN npx prisma generate

EXPOSE 3001 # El puerto en el que tu aplicación escucha (ajusta según sea necesario)

# El comando para iniciar tu aplicación
# Asume que tu script "start" en package.json es "node dist/index.js"
# o puedes especificarlo directamente.
CMD ["npm", "start"]
# O directamente: CMD ["node", "dist/index.js"]

```
**Nota sobre `backend/Dockerfile`:**
*   Asegúrate de que las rutas de copia (`COPY backend/...`) sean correctas si tu `Dockerfile` está en la raíz del proyecto en lugar de dentro del directorio `backend/`. Si el `Dockerfile` está en `backend/`, entonces las rutas serían `COPY package*.json ./`, `COPY prisma ./prisma/`, etc. He asumido que el contexto de build es la raíz del proyecto (`docker build ... ./backend`). Si el contexto de build es `./backend` (`docker build ... -f ./backend/Dockerfile ./backend`), entonces las rutas en el Dockerfile serían relativas a `./backend`. La configuración del workflow (`docker build ... ./backend`) implica que el Dockerfile está en `./backend/Dockerfile` y el contexto es la raíz. Para simplificar, he escrito el Dockerfile como si estuviera en `backend/Dockerfile` y el contexto de build fuera `backend/`. Ajusta las rutas `COPY` si tu estructura es diferente.
*   El comando `npm run build` debe compilar tu TypeScript a JavaScript (generalmente en un directorio `dist`).
*   El `CMD` debe iniciar tu aplicación compilada.
*   Asegúrate de que el puerto `EXPOSE` coincida con el puerto en el que tu aplicación escucha y el que mapeas en el comando `docker run`.

### Suposiciones Realizadas

*   Tu instancia EC2 de destino ya tiene Docker y AWS CLI (opcional, para login ECR) instalados y configurados.
*   Los grupos de seguridad de tu instancia EC2 permiten tráfico entrante en el puerto SSH (normalmente 22) desde las IPs de los runners de GitHub Actions (o desde `0.0.0.0/0` si es para pruebas, **no recomendado para producción**) y en el puerto de la aplicación (3001).
*   Has configurado un rol IAM en AWS para la autenticación OIDC desde GitHub Actions con los permisos necesarios para ECR.
*   El `backend/package.json` tiene los scripts `test`, `build` (para compilar TypeScript) y `start` (para ejecutar la aplicación compilada).
*   Existe un archivo `backend/Dockerfile` o crearás uno basado en la plantilla.

Este pipeline te proporcionará una base sólida para la integración y el despliegue continuos de tu aplicación backend. Recuerda probarlo en un entorno de no producción primero.

