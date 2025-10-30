# Use official Node.js LTS image as base
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files first (to leverage Docker cache)
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy application source code
COPY . .

# Expose the port that the app listens on
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
