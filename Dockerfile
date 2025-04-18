# Sample React Dockerfile
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
#COPY --from=build /app/build /usr/share/nginx/html
#COPY --from=build C:/Users/Keerthivasanb/Desktop/deploy/build
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
