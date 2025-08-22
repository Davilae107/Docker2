# 🌟 Hola Mundo - Aplicación DevOps

Una aplicación web simple "Hola Mundo" construida con Node.js y Express, dockerizada y lista para despliegue.

## 🚀 Características

- **Framework**: Node.js + Express
- **Dockerizada**: Lista para contenedores
- **Health Check**: Endpoint de monitoreo incluido
- **API REST**: Endpoint simple para pruebas
- **Responsive**: Interfaz web moderna y responsive

## 📋 Prerrequisitos

- Node.js 18+ (para desarrollo local)
- Docker (para contenedorización)
- Docker Hub account (para subir imagen)

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

## 🐳 Docker Hub

Esta imagen está disponible en Docker Hub:

```bash
# Descargar y ejecutar desde Docker Hub
docker run -p 3000:3000 [tu-usuario]/hola-mundo-app:latest
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
