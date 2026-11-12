# use a small base image
FROM node:24-alpine AS base
WORKDIR /app

# install dependencies separately to leverage Docker cache
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# copy app source code
COPY . .

# run as non-root user
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]