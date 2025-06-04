FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy remaining source
COPY . .

# Build the extension
RUN npm run build

# Default command - rebuild on changes
CMD ["npm", "run", "watch"]
