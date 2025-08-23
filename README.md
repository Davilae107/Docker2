# 🌟 Hola Mundo - Aplicación DevOps

Una aplicación web simple "Hola Mundo" construida con Node.js y Express, dockerizada y con CI/CD completo usando GitHub Actions, Docker Hub y Render.com.

## 🚀 Características

- **Framework**: Node.js + Express
- **Dockerizada**: Lista para contenedores
- **CI/CD**: GitHub Actions automatizado
- **Deploy**: Automático a Render.com
- **Health Check**: Endpoint de monitoreo incluido
- **API REST**: Endpoint simple para pruebas
- **Responsive**: Interfaz web moderna y responsive

## 📋 Prerrequisitos

- Node.js 18+ (para desarrollo local)
- Docker (para contenedorización)
- Cuenta Docker Hub (para registry)
- Cuenta Render.com (para deploy)
- GitHub repository (para CI/CD)

## 🛠️ Instalación y Uso

### Desarrollo Local

```bash
# Instalar dependencias
npm install

# Ejecutar la aplicación
npm start

# La aplicación estará disponible en http://localhost:3000
```

### Con Docker

```bash
# Construir la imagen
docker build -t hola-mundo-app .

# Ejecutar el contenedor
docker run -p 3000:3000 hola-mundo-app

# La aplicación estará disponible en http://localhost:3000
```

## 🔗 Endpoints

- **GET /** - Página principal con interfaz web
- **GET /health** - Health check para monitoreo
- **GET /api/mensaje** - API REST simple

## � CI/CD Pipeline

### GitHub Actions Workflow
```
Push/PR → Build & Test → Docker Build & Push → Deploy to Render → Health Check
```

### Configuración
1. **Secrets en GitHub**:
   - `DOCKER_HUB_TOKEN`
   - `RENDER_API_KEY`
   - `RENDER_SERVICE_ID`

2. **Ver documentación completa**: [CI-CD-SETUP.md](CI-CD-SETUP.md)

## �🐳 Docker Hub

Esta imagen está disponible en Docker Hub:

```bash
# Descargar y ejecutar desde Docker Hub
docker run -p 3000:3000 dockerdav11/holamundodavila:latest
```

## 📊 Estructura del Proyecto

```
.
├── app.js              # Aplicación principal
├── package.json        # Dependencias y scripts
├── Dockerfile          # Configuración de Docker
├── .dockerignore       # Archivos ignorados por Docker
└── README.md          # Este archivo
```

## 🔧 Tecnologías Utilizadas

- **Runtime**: Node.js 18
- **Framework**: Express.js
- **Contenedorización**: Docker
- **Base Image**: node:18-alpine

## 📈 DevOps Pipeline

1. **Desarrollo**: Aplicación Node.js con Express
2. **Contenedorización**: Dockerfile optimizado
3. **Construcción**: Build de imagen Docker
4. **Registro**: Push a Docker Hub
5. **Despliegue**: Pull y run desde cualquier entorno

## 🏥 Health Check

La aplicación incluye un endpoint de health check en `/health` que retorna:

```json
{
  "status": "OK",
  "message": "Aplicación funcionando correctamente",
  "timestamp": "2025-08-22T10:30:00.000Z",
  "version": "1.0.0"
}
```

## 📝 Licencia

MIT License
