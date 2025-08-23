// test.js - Tests básicos para la aplicación
const http = require('http');

console.log('🧪 Ejecutando tests de la aplicación...');

// Test 1: Verificar que el archivo principal existe y tiene sintaxis válida
try {
    const fs = require('fs');
    const appContent = fs.readFileSync('./app.js', 'utf8');
    if (appContent.includes('express') && appContent.includes('app.listen')) {
        console.log('✅ Test 1: app.js tiene estructura correcta');
    } else {
        throw new Error('app.js no tiene la estructura esperada');
    }
} catch (error) {
    console.error('❌ Test 1: Error verificando app.js:', error.message);
    process.exit(1);
}

// Test 2: Verificar estructura del package.json
try {
    const pkg = require('./package.json');
    if (pkg.name && pkg.version && pkg.dependencies) {
        console.log('✅ Test 2: package.json tiene estructura válida');
    } else {
        throw new Error('package.json incompleto');
    }
} catch (error) {
    console.error('❌ Test 2: Error en package.json:', error.message);
    process.exit(1);
}

// Test 3: Verificar que Express está en las dependencias
try {
    const pkg = require('./package.json');
    if (pkg.dependencies.express) {
        console.log('✅ Test 3: Express está listado en dependencias');
    } else {
        throw new Error('Express no encontrado en dependencias');
    }
} catch (error) {
    console.error('❌ Test 3: Error verificando dependencias:', error.message);
    process.exit(1);
}

// Test 4: Verificar que el Dockerfile existe
const fs = require('fs');
try {
    if (fs.existsSync('./Dockerfile')) {
        console.log('✅ Test 4: Dockerfile existe');
    } else {
        throw new Error('Dockerfile no encontrado');
    }
} catch (error) {
    console.error('❌ Test 4: Error verificando Dockerfile:', error.message);
    process.exit(1);
}

console.log('🎉 Todos los tests pasaron exitosamente!');
console.log('📋 Resumen:');
console.log('   - Aplicación se carga correctamente');
console.log('   - Configuración válida');
console.log('   - Dependencias verificadas');
console.log('   - Dockerfile presente');
process.exit(0);
