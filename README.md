# Liminal Commons Discord

A Discord-integrated multiplayer platform for Liminal Commons, based on Phaser, Colyseus, and Discord SDK.

## Version 0.1

This is the initial release of the Liminal Commons Discord integration template. This template provides a foundation for building multiplayer experiences that connect with Discord through both OAuth authentication and webhooks.

### Features

- ✅ Discord authentication and integration
- ✅ Real-time multiplayer using Colyseus
- ✅ Phaser-based 2D world with character movement
- ✅ Chat system with Discord message syncing
- ✅ Persistent user data storage
- ✅ Mobile-friendly responsive design

### Setup

1. Clone the repository
2. Run `npm install` at the root
3. Copy `example.env` to `.env` and fill in your Discord application credentials
4. Run `npm run dev` to start in development mode

### Requirements

- Node.js 16+
- Discord Application with OAuth2 credentials
- Cloudflare tunnel (for development with Discord integration)

## Project Structure

- `packages/client` - Phaser-based frontend
- `packages/server` - Colyseus-based game server
- `gameassets` - Game assets (sprites, tiles, etc.)

## Development Plan

See the [development-plan.md](development-plan.md) file for the roadmap and current status.

## License

Copyright © 2025 Liminal Commons. All rights reserved.