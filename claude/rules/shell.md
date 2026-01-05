---
globs: ["**/*.sh", "**/*.bash", "**/*.zsh", "**/.*rc", "**/.*profile", "**/.*env"]
---

# Shell Script Guidelines

## Naming

- Use meaningful function names with underscore_case
- Prefix private/helper functions with underscore

## Structure

- Start scripts with appropriate shebang (`#!/usr/bin/env bash`)
- Use `set -e` to exit on errors when appropriate
- Document function purpose with comments

## Best Practices

- Handle errors with appropriate exit codes
- Prefer parameter expansion over command substitution when possible
- Quote variables to prevent word splitting: `"$var"` not `$var`
- Use `[[ ]]` over `[ ]` for conditionals in bash/zsh
- Prefer `$(command)` over backticks

## Functions

- Keep functions focused and single-purpose
- Use local variables inside functions
- Return meaningful exit codes

## Portability

- Note macOS vs Linux differences (BSD vs GNU tools)
- Use `command -v` to check for tool availability
