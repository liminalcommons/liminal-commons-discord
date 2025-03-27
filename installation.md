# Installation and Deployment Guide

This guide provides instructions for setting up the Liminal Commons Discord integrated multiplayer platform for development and production environments.

## Prerequisites

- Node.js >= 16.0.0
- PNPM package manager
- Cloudflare account (for tunnel deployment)
- Discord Developer account with application credentials

## Local Development Setup

### 1. Clone the repository

```bash
git clone https://github.com/liminalcommons/liminal-commons-discord.git
cd liminal-commons-discord
```

### 2. Install dependencies

```bash
pnpm install
```

### 3. Configure environment variables

Create a `.env` file in the root directory using the `example.env` template:

```bash
cp example.env .env
```

Then edit the `.env` file with your Discord application credentials and other configuration values.

### 4. Start the development servers

```bash
pnpm dev
```

This will start both the client and server in development mode with hot reloading.

## Discord Application Setup

### 1. Create a Discord application

1. Go to the [Discord Developer Portal](https://discord.com/developers/applications)
2. Click "New Application" and follow the setup wizard
3. Note your Client ID and Client Secret

### 2. Configure OAuth2

1. Go to the OAuth2 section in your Discord application
2. Add redirect URLs:
   - For development: `http://localhost:8080/auth/callback`
   - For production: `https://your-domain.com/auth/callback`
3. Set required scopes:
   - `identify`
   - `email`
   - `guilds`

### 3. Configure Interactions Endpoint URL

For production:

1. Go to the "General Information" tab
2. Set the "Interactions Endpoint URL" to `https://your-domain.com/api/discord/interactions`

## Production Deployment

### 1. Build the application

```bash
pnpm build
```

### 2. Server deployment options

#### Option A: Traditional hosting

1. Set up a Node.js environment on your server
2. Deploy the built files to your server
3. Start the server with:
   ```bash
   NODE_ENV=production pnpm start
   ```

#### Option B: Cloudflare Workers (recommended)

1. Install Cloudflare Wrangler:
   ```bash
   npm install -g wrangler
   ```

2. Configure Wrangler:
   ```bash
   wrangler login
   ```

3. Deploy:
   ```bash
   wrangler publish
   ```

#### Option C: Docker deployment

1. Build the Docker image:
   ```bash
   docker build -t liminal-commons-discord .
   ```

2. Run the Docker container:
   ```bash
   docker run -p 3000:3000 -p 8080:8080 --env-file .env liminal-commons-discord
   ```

## Troubleshooting

### Common Issues

1. **Discord API authentication errors**
   - Check that your Discord credentials are correct in the `.env` file
   - Verify that the redirect URLs are properly configured in the Discord Developer Portal

2. **Network connection issues**
   - Ensure your firewall allows connections to the required ports
   - Check that Cloudflare tunnel is properly configured if using that option

3. **Game asset loading problems**
   - Verify that all game assets are correctly packaged in the build process
   - Check browser console for specific loading errors

### Getting Help

If you encounter issues not covered in this guide, please:

1. Check the existing issues in the GitHub repository
2. Create a new issue with detailed information about your problem
3. Contact the development team at support@liminalcommons.com