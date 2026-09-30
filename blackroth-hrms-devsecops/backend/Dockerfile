# Use secure minimal base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy application source
COPY . .

# Create non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose API port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

