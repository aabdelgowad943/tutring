# Stage 1
# FROM node:18.13.0 as node\
FROM node:20.3.0 as node

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build 
# Stage 2 
FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/default.conf 
COPY --from=node /app/dist/tutoring /usr/share/nginx/html