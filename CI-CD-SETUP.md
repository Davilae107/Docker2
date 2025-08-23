# 🔧 Configuración de CI/CD - GitHub Actions + Docker Hub + Render

## 📋 Requisitos Previos

### 1. 🐳 Docker Hub
- Cuenta en [Docker Hub](https://hub.docker.com)
- Token de acceso personal (PAT)

### 2. 🚀 Render.com
- Cuenta en [Render.com](https://render.com)
- API Key de Render
- Service ID del servicio web

### 3. 📂 GitHub Repository
- Repositorio con acceso a GitHub Actions
- Configuración de Secrets

## 🔑 Configuración de Secrets en GitHub

Ve a tu repositorio → Settings → Secrets and variables → Actions y añade:

### Docker Hub Secrets
```
DOCKER_HUB_TOKEN = <tu-docker-hub-token>
```

### Render.com Secrets
```
RENDER_API_KEY = <tu-render-api-key>
RENDER_SERVICE_ID = <tu-service-id>
```

## 📝 Cómo obtener las API Keys

### 🐳 Docker Hub Token
1. Ve a [Docker Hub Account Settings](https://hub.docker.com/settings/security)
2. Click en "New Access Token"
3. Nombre: `github-actions-ci`
4. Permissions: `Read, Write, Delete`
5. Copia el token generado

### 🚀 Render API Key
1. Ve a [Render Account Settings](https://dashboard.render.com/account)
2. Sección "API Keys"
3. Click en "Create API Key"
4. Nombre: `github-actions-deploy`
5. Copia la API key generada

### 🆔 Render Service ID
1. Ve a tu dashboard de Render
2. Selecciona tu servicio web
3. En la URL verás: `https://dashboard.render.com/web/srv-XXXXXXXXX`
4. El Service ID es: `srv-XXXXXXXXX`

## 🚀 Configuración del Servicio en Render

### Opción 1: Manual (Recomendado)
1. Ve a [Render Dashboard](https://dashboard.render.com)
2. Click en "New +" → "Web Service"
3. Conecta tu repositorio GitHub
4. Configuración:
   ```
   Name: hola-mundo-devops
   Environment: Docker
   Branch: main
   Dockerfile Path: ./Dockerfile
   Plan: Free (o el que prefieras)
   ```

### Opción 2: Usando render.yaml
1. Sube el archivo `render.yaml` a tu repositorio
2. En Render, selecciona "Deploy from repository"
3. Render detectará automáticamente la configuración

## 🔄 Workflow del CI/CD

### Trigger del Pipeline
El pipeline se ejecuta cuando:
- 🔄 Push a la rama `main`
- 🏷️ Creación de tags `v*`
- 🔄 Pull requests

### Jobs del Pipeline

#### 1. 🔨 Build & Test
- ✅ Checkout código
- ✅ Setup Node.js 18
- ✅ Instalar dependencias
- ✅ Ejecutar tests
- ✅ Security audit

#### 2. 🐳 Docker Build & Push
- ✅ Build imagen Docker
- ✅ Push a Docker Hub
- ✅ Multi-arquitectura (AMD64, ARM64)
- ✅ Cache optimizado
- ✅ Security scan
- ✅ SBOM generation

#### 3. 🚀 Deploy to Render
- ✅ Deploy automático
- ✅ Health check
- ✅ Monitoreo de deploy
- ✅ URL del servicio

#### 4. 📢 Notifications
- ✅ Resumen en GitHub
- ✅ Status de todos los jobs

## 🐛 Troubleshooting

### Error: "Docker Hub push denied"
- ✅ Verifica que `DOCKER_HUB_TOKEN` esté configurado
- ✅ Verifica que el token tenga permisos de escritura
- ✅ Verifica que el repositorio Docker exista

### Error: "Render deploy failed"
- ✅ Verifica `RENDER_API_KEY` y `RENDER_SERVICE_ID`
- ✅ Verifica que el servicio esté configurado para auto-deploy
- ✅ Revisa los logs en Render Dashboard

### Error: "Health check failed"
- ✅ Verifica que la aplicación exponga el puerto 3000
- ✅ Verifica que `/health` endpoint esté funcionando
- ✅ Revisa los logs del contenedor

## 📊 Monitoreo

### GitHub Actions
- Ve a Actions tab en tu repositorio
- Revisa los logs de cada job
- Verifica el resumen en cada run

### Docker Hub
- Ve a tu repositorio en Docker Hub
- Verifica las imágenes subidas
- Revisa los tags y digests

### Render.com
- Ve a tu dashboard de Render
- Monitorea los deploys
- Revisa métricas y logs

## 🎯 Mejoras Futuras

- 🔄 Rollback automático en caso de fallo
- 📊 Integración con Slack/Discord
- 🧪 Tests de integración
- 📈 Métricas de performance
- 🔒 Escaneo de seguridad avanzado
- 🌍 Deploy a múltiples entornos
