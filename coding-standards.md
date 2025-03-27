# Coding Standards and Patterns

This document outlines the coding standards and pattern preferences to follow throughout the development of our multiplayer platform.

## Code Organization

- Keep the codebase very clean and organized
- Avoid having files over 200-300 lines of code. Refactor at that point.
- Avoid duplication of code whenever possible, which means checking for other areas of the codebase that might already have similar code and functionality

## Implementation Approach

- Always prefer simple solutions
- When fixing an issue or bug, do not introduce a new pattern or technology without first exhausting all options for the existing implementation. And if you finally do this, make sure to remove the old implementation afterwards so we don't have duplicate logic.
- You are careful to only make changes that are requested or you are confident are well understood and related to the change being requested

## Environment Handling

- Write code that takes into account the different environments: dev, test, and prod
- Mocking data is only needed for tests, never mock data for dev or prod
- Never add stubbing or fake data patterns to code that affects the dev or prod environments
- Never overwrite .env file without first asking and confirming

## Script Management

- Avoid writing scripts in files if possible, especially if the script is likely only to be run once

## Phaser-Specific Best Practices

- Keep scene files focused on a single responsibility
- Properly clean up resources when transitioning between scenes
- Separate game logic from rendering logic where possible
- Use TypeScript interfaces for game objects and state
- Prefer composition over inheritance for game objects
- Use the Phaser physics system consistently

## Git Workflow

- Create feature branches for new features
- Make meaningful commit messages that describe the change
- Keep pull requests small and focused
- Review code before merging

## Documentation

- Document public APIs and complex functions
- Include comments for non-obvious code sections
- Keep README updated with setup and development instructions