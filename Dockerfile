# tag this phase as build pahse
FROM node:20-alpine AS builder

WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# copy from builder phase to this place
COPY --from=builder /app/build /usr/share/nginx/html
