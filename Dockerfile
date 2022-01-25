FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn build

# /app/build <--- all the staff

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html


