# Usa una imagen oficial de Node.js (versión 18)
FROM node:22.12.0-alpine

# Crea un directorio para la app
WORKDIR /app

# Copia los archivos de configuración del proyecto
COPY package.json package-lock.json ./

# Instala las dependencias (modo producción)
RUN npm ci --only=production

# Copia el resto del código
COPY . .

# Compila la aplicación (si usas TypeScript)
RUN npm run build

# Puerto que usará la app (Koyeb lo manejará automáticamente)
EXPOSE 4000

# Comando para iniciar la app en producción
CMD ["node", "dist/main.js"]