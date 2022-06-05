FROM node:18-alpine3.14 as builder

WORKDIR /app/react

COPY package.json ./

RUN npm install

COPY . ./

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder /app/react/build /usr/share/nginx/html
