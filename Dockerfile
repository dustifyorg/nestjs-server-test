# Usa Node.js v22
FROM node:22-alpine

# Directorio de trabajo
WORKDIR /app

# Copia archivos de dependencias
COPY package.json package-lock.json ./

# Instala dependencias INCLUYENDO @nestjs/cli (para construcción)
RUN npm ci

# Copia el resto del código
COPY . .

# Compila la aplicación (ahora nest estará disponible)
RUN npm run build

# Instala SOLO dependencias de producción (optimización final)
RUN npm prune --production

# Puerto y comando de inicio
EXPOSE 4000
CMD ["node", "dist/main.js"]