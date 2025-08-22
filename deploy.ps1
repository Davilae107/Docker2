# Script de despliegue para aplicación Hola Mundo (PowerShell)
# DevOps Pipeline Automation

Write-Host "🚀 Iniciando pipeline de DevOps para Hola Mundo App" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green

# Variables
$APP_NAME = "hola-mundo-app"
$DOCKER_USER = "ldavila"  # Cambiar por tu usuario de Docker Hub
$VERSION = "v1.0.0"
$PORT = "3001"

# Función para mostrar mensajes con timestamp
function Write-Log {
    param($Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "$timestamp - $Message" -ForegroundColor Cyan
}

# Verificar si Docker está instalado
try {
    docker --version | Out-Null
    Write-Log "✅ Docker encontrado"
} catch {
    Write-Log "❌ Docker no está instalado. Por favor instala Docker primero."
    exit 1
}

# Construir la imagen
Write-Log "🔨 Construyendo imagen Docker..."
docker build -t "$APP_NAME`:latest" .
if ($LASTEXITCODE -ne 0) {
    Write-Log "❌ Error al construir la imagen"
    exit 1
}
Write-Log "✅ Imagen construida exitosamente"

# Etiquetar para Docker Hub
Write-Log "🏷️  Etiquetando imagen para Docker Hub..."
docker tag "$APP_NAME`:latest" "$DOCKER_USER/$APP_NAME`:latest"
docker tag "$APP_NAME`:latest" "$DOCKER_USER/$APP_NAME`:$VERSION"
Write-Log "✅ Imagen etiquetada"

# Mostrar imágenes
Write-Log "📋 Imágenes disponibles:"
docker images | Where-Object { $_ -match $APP_NAME }

# Probar localmente
Write-Log "🧪 Probando aplicación localmente..."

# Detener contenedor existente si existe
docker rm -f "$APP_NAME-test" 2>$null

# Ejecutar contenedor de prueba
docker run -d -p "$PORT`:3000" --name "$APP_NAME-test" "$APP_NAME`:latest"
if ($LASTEXITCODE -ne 0) {
    Write-Log "❌ Error al ejecutar contenedor de prueba"
    exit 1
}

Start-Sleep -Seconds 5

# Verificar health check
Write-Log "🔍 Verificando health check..."
try {
    $response = Invoke-WebRequest -Uri "http://localhost:$PORT/health" -UseBasicParsing
    if ($response.StatusCode -eq 200) {
        Write-Log "✅ Health check exitoso"
    } else {
        Write-Log "❌ Health check falló"
        docker logs "$APP_NAME-test"
        exit 1
    }
} catch {
    Write-Log "❌ Error al conectar con la aplicación"
    docker logs "$APP_NAME-test"
    exit 1
}

Write-Log "🌐 Aplicación disponible en: http://localhost:$PORT"
Write-Log "📊 Health check en: http://localhost:$PORT/health"
Write-Log "🔗 API en: http://localhost:$PORT/api/mensaje"

Write-Host ""
Write-Log "📤 Para subir a Docker Hub, ejecuta:"
Write-Host "   docker login" -ForegroundColor Yellow
Write-Host "   docker push $DOCKER_USER/$APP_NAME`:latest" -ForegroundColor Yellow
Write-Host "   docker push $DOCKER_USER/$APP_NAME`:$VERSION" -ForegroundColor Yellow

Write-Host ""
Write-Log "🎉 Pipeline completado exitosamente!"

# Mostrar logs del contenedor
Write-Host ""
Write-Log "📝 Logs del contenedor:"
docker logs "$APP_NAME-test"
