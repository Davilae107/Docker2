# Usar imagen base oficial de Node.js
FROM node:18-alpine

# Información del mantenedor
LABEL maintainer="DevOps Team"
LABEL description="Aplicación web Hola Mundo para demostración de DevOps"
LABEL version="1.0.0"

# Crear directorio de trabajo en el contenedor
WORKDIR /app

# Copiar package.json y package-lock.json (si existe)
COPY package*.json ./

# Instalar dependencias
RUN npm install --omit=dev && npm cache clean --force

# Copiar el código fuente de la aplicación
COPY . .

# Crear usuario no-root para seguridad
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001

# Cambiar la propiedad de los archivos al usuario nodejs
RUN chown -R nextjs:nodejs /app
USER nextjs

# Exponer el puerto 3000
EXPOSE 3000

# Comando de salud para Docker
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "require('http').get('http://localhost:3000/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

# Comando para ejecutar la aplicación
CMD ["npm", "start"]
