#!/bin/bash

# Script de despliegue para aplicación Hola Mundo
# DevOps Pipeline Automation

echo "🚀 Iniciando pipeline de DevOps para Hola Mundo App"
echo "=================================================="

# Variables
APP_NAME="hola-mundo-app"
DOCKER_USER="ldavila"  # Cambiar por tu usuario de Docker Hub
VERSION="v1.0.0"
PORT="3001"

# Función para mostrar mensajes
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    log "❌ Docker no está instalado. Por favor instala Docker primero."
    exit 1
fi

log "✅ Docker encontrado"

# Construir la imagen
log "🔨 Construyendo imagen Docker..."
docker build -t $APP_NAME:latest . || {
    log "❌ Error al construir la imagen"
    exit 1
}

log "✅ Imagen construida exitosamente"

# Etiquetar para Docker Hub
log "🏷️  Etiquetando imagen para Docker Hub..."
docker tag $APP_NAME:latest $DOCKER_USER/$APP_NAME:latest
docker tag $APP_NAME:latest $DOCKER_USER/$APP_NAME:$VERSION

log "✅ Imagen etiquetada"

# Mostrar imágenes
log "📋 Imágenes disponibles:"
docker images | grep $APP_NAME

# Probar localmente
log "🧪 Probando aplicación localmente..."

# Detener contenedor existente si existe
docker rm -f ${APP_NAME}-test 2>/dev/null || true

# Ejecutar contenedor de prueba
docker run -d -p $PORT:3000 --name ${APP_NAME}-test $APP_NAME:latest || {
    log "❌ Error al ejecutar contenedor de prueba"
    exit 1
}

sleep 5

# Verificar health check
log "🔍 Verificando health check..."
if curl -f http://localhost:$PORT/health > /dev/null 2>&1; then
    log "✅ Health check exitoso"
else
    log "❌ Health check falló"
    docker logs ${APP_NAME}-test
    exit 1
fi

log "🌐 Aplicación disponible en: http://localhost:$PORT"
log "📊 Health check en: http://localhost:$PORT/health"
log "🔗 API en: http://localhost:$PORT/api/mensaje"

echo ""
log "📤 Para subir a Docker Hub, ejecuta:"
echo "   docker login"
echo "   docker push $DOCKER_USER/$APP_NAME:latest"
echo "   docker push $DOCKER_USER/$APP_NAME:$VERSION"

echo ""
log "🎉 Pipeline completado exitosamente!"

# Mostrar logs del contenedor
echo ""
log "📝 Logs del contenedor:"
docker logs ${APP_NAME}-test
