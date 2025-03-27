FROM node:18-alpine AS base

# Install pnpm
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy pnpm lockfile and workspace config
COPY pnpm-lock.yaml pnpm-workspace.yaml ./
COPY package.json ./

# Copy all package.json files
COPY packages/client/package.json ./packages/client/
COPY packages/server/package.json ./packages/server/

# Install dependencies
RUN pnpm install --frozen-lockfile

# Build stage
FROM base AS builder

# Copy source code
COPY . .

# Build the application
RUN pnpm build

# Production stage
FROM node:18-alpine AS production

WORKDIR /app

# Copy only production dependencies and built files
COPY --from=builder /app/package.json ./
COPY --from=builder /app/pnpm-lock.yaml ./
COPY --from=builder /app/pnpm-workspace.yaml ./
COPY --from=builder /app/packages/server/package.json ./packages/server/
COPY --from=builder /app/packages/server/dist ./packages/server/dist
COPY --from=builder /app/packages/client/dist ./packages/client/dist

# Install only production dependencies
RUN npm install -g pnpm && pnpm install --prod

# Set environment variables
ENV NODE_ENV=production

# Expose ports
EXPOSE 3000
EXPOSE 8080

# Start the server
CMD ["node", "packages/server/dist/index.js"]