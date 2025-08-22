const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para servir archivos estáticos
app.use(express.static('public'));

// Ruta principal
app.get('/', (req, res) => {
    res.send(`
        <!DOCTYPE html>
        <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Hola Mundo - DevOps</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    color: white;
                }
                .container {
                    text-align: center;
                    padding: 2rem;
                    background: rgba(255, 255, 255, 0.1);
                    border-radius: 15px;
                    backdrop-filter: blur(10px);
                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                    border: 1px solid rgba(255, 255, 255, 0.18);
                }
                h1 {
                    font-size: 3rem;
                    margin-bottom: 1rem;
                    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
                }
                p {
                    font-size: 1.2rem;
                    margin-bottom: 0.5rem;
                }
                .tech-stack {
                    margin-top: 2rem;
                    font-size: 0.9rem;
                    opacity: 0.8;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🌟 ¡Hola Mundo! 🌟</h1>
                <p>Aplicación web creada con Node.js y Express</p>
                <p>🐳 Dockerizada y lista para DevOps</p>
                <div class="tech-stack">
                    <p><strong>Tech Stack:</strong> Node.js | Express | Docker</p>
                    <p><strong>Puerto:</strong> ${PORT}</p>
                    <p><strong>Fecha:</strong> ${new Date().toLocaleDateString('es-ES')}</p>
                </div>
            </div>
        </body>
        </html>
    `);
});

// Ruta de salud para monitoreo
app.get('/health', (req, res) => {
    res.status(200).json({
        status: 'OK',
        message: 'Aplicación funcionando correctamente',
        timestamp: new Date().toISOString(),
        version: '1.0.0'
    });
});

// Ruta API simple
app.get('/api/mensaje', (req, res) => {
    res.json({
        mensaje: '¡Hola Mundo desde la API!',
        tecnologia: 'Node.js + Express',
        dockerizado: true,
        timestamp: new Date().toISOString()
    });
});

// Iniciar servidor
app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Servidor corriendo en http://localhost:${PORT}`);
    console.log(`📊 Health check disponible en http://localhost:${PORT}/health`);
    console.log(`🔗 API disponible en http://localhost:${PORT}/api/mensaje`);
});
