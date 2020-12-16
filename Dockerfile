# Build phase
FROM node:alpine
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx
EXPOSE 80
# Kopieer de build directory van de vorige phase in de nginx container
COPY --from=0 /app/build usr/share/nginx/html