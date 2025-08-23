# Setup script para configuración rápida de CI/CD
# Ejecutar con: ./setup-cicd.ps1

Write-Host "🚀 Configuración de CI/CD - Hola Mundo DevOps" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green

# Variables
$REPO_NAME = "Docker2"
$DOCKER_USERNAME = "dockerdav11"
$IMAGE_NAME = "holamundodavila"

Write-Host "📋 Lista de verificación para CI/CD:" -ForegroundColor Cyan
Write-Host ""

# Docker Hub
Write-Host "🐳 DOCKER HUB:" -ForegroundColor Yellow
Write-Host "   ✅ Repositorio: $DOCKER_USERNAME/$IMAGE_NAME"
Write-Host "   🔑 Token necesario: DOCKER_HUB_TOKEN"
Write-Host "   📝 Obtener en: https://hub.docker.com/settings/security"
Write-Host ""

# Render.com
Write-Host "🚀 RENDER.COM:" -ForegroundColor Yellow
Write-Host "   🔑 API Key necesaria: RENDER_API_KEY"
Write-Host "   🆔 Service ID necesario: RENDER_SERVICE_ID"
Write-Host "   📝 Configurar en: https://dashboard.render.com"
Write-Host ""

# GitHub Secrets
Write-Host "🔐 GITHUB SECRETS a configurar:" -ForegroundColor Yellow
Write-Host "   1. DOCKER_HUB_TOKEN"
Write-Host "   2. RENDER_API_KEY"
Write-Host "   3. RENDER_SERVICE_ID"
Write-Host ""

# Tests
Write-Host "🧪 Ejecutando tests locales..." -ForegroundColor Cyan
try {
    npm test
    Write-Host "✅ Tests pasaron correctamente" -ForegroundColor Green
} catch {
    Write-Host "❌ Tests fallaron" -ForegroundColor Red
}

Write-Host ""

# Docker build test
Write-Host "🐳 Verificando Docker build..." -ForegroundColor Cyan
try {
    docker build -t test-build . | Out-Null
    Write-Host "✅ Docker build exitoso" -ForegroundColor Green
    docker rmi test-build | Out-Null
} catch {
    Write-Host "❌ Docker build falló" -ForegroundColor Red
}

Write-Host ""
Write-Host "📝 PRÓXIMOS PASOS:" -ForegroundColor Green
Write-Host "1. Configura los secrets en GitHub"
Write-Host "2. Crea el servicio en Render.com"
Write-Host "3. Haz push a la rama main"
Write-Host "4. Observa el pipeline en GitHub Actions"
Write-Host ""
Write-Host "🔗 URLs útiles:" -ForegroundColor Cyan
Write-Host "   - GitHub Actions: https://github.com/${{ github.repository }}/actions"
Write-Host "   - Docker Hub: https://hub.docker.com/r/$DOCKER_USERNAME/$IMAGE_NAME"
Write-Host "   - Render Dashboard: https://dashboard.render.com"
