# Use a slim version of Node.js for a smaller image size
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY src/package*.json ./

# Install dependencies
RUN npm install --production

# Copy application source code
COPY src .

# Create a non-root user for security best practices
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["node", "index.js"]
