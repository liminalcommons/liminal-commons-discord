# Project Structure

This document outlines the structure of the Liminal Commons Discord integrated multiplayer platform.

## Root Directory
```
liminal-commons-discord/
├── README.md               # Project documentation
├── package.json            # Root package configuration
├── pnpm-workspace.yaml     # PNPM workspace configuration
├── coding-standards.md     # Coding standards documentation
├── development-plan.md     # Development plan
├── example.env             # Example environment variables
└── packages/               # Monorepo packages
```

## Packages
The project is organized as a monorepo with the following packages:

```
packages/
├── client/                 # Frontend Phaser.js application
│   ├── src/
│   │   ├── assets/         # Static assets (sprites, sounds, etc.)
│   │   ├── scenes/         # Phaser scenes
│   │   ├── utils/          # Utility functions
│   │   │   ├── discordSDK.ts # Discord SDK integration
│   │   │   └── ScaleFlow.ts # Screen scaling utilities
│   │   └── main.ts         # Application entry point
│   ├── index.html          # HTML entry point
│   ├── package.json        # Client package configuration
│   ├── tsconfig.json       # TypeScript configuration
│   └── vite.config.ts      # Vite configuration
│
└── server/                 # Backend Colyseus server
    ├── src/
    │   ├── index.ts        # Server entry point
    │   ├── schemas/        # Colyseus schemas
    │   │   ├── Player.ts   # Player schema
    │   │   └── WorldState.ts # World state schema
    │   ├── rooms/          # Colyseus rooms
    │   │   └── WorldRoom.ts # Main world room
    │   └── discord/        # Discord integration
    │       ├── auth.ts     # Authentication utilities
    │       └── webhook.ts  # Webhook handler
    ├── package.json        # Server package configuration
    └── tsconfig.json       # TypeScript configuration
```

## Key Files

### Client
- `main.ts`: Initializes the Phaser game and handles configuration
- `discordSDK.ts`: Manages Discord SDK integration and OAuth2 flow
- `ScaleFlow.ts`: Handles responsive scaling for different devices
- Scene files:
  - `MainMenu.ts`: Title screen and entry point
  - `MainWorld.ts`: Primary gameplay scene with multiplayer functionality

### Server
- `index.ts`: Configures and starts the Colyseus server with room definitions
- `WorldState.ts`: Defines the schema for the shared world state
- `WorldRoom.ts`: Implements game logic, player management, and synchronization
- `discord/webhook.ts`: Handles Discord interactions via webhooks

## Environment Configuration
Environment variables are defined in `.env` files (not committed to the repository):

- `VITE_DISCORD_CLIENT_ID`: Discord application client ID
- `DISCORD_CLIENT_SECRET`: Discord application client secret
- `DISCORD_WEBHOOK_SECRET`: Discord webhook verification secret
- `CLOUDFLARE_TUNNEL_URL`: URL for Cloudflare Tunnel integration
- `NODE_ENV`: Environment (development, production)