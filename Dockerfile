# Use official Node.js LTS Alpine image for a small footprint
FROM node:18-alpine

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (better cache usage)
COPY package*.json ./

# Install only production dependencies by default
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Expose application port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
