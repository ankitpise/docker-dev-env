# Use the latest Node.js LTS version on Alpine Linux
FROM node:lts-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install global tools necessary for development
RUN npm install -g firebase-tools typescript

# Default command to keep the container lightweight
CMD ["node"]
