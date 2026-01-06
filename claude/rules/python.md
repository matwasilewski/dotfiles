---
globs: ["**/*.py"]
---

# Python Guidelines

## Formatting

- Line length: 79 characters
- Target Python version: 3.13
- Use Ruff for formatting and linting (`ruff format`, `ruff check`)


## Type Annotations

- Use mypy with `ignore_missing_imports = true`
- Use `from __future__ import annotations` for forward references

## Style

- Strive to write pure functions.
- Follow unix philosophy: write tools (functions) that do one thing well.
- Only add arguments to functions if a use-case for that parameter is already apparent.
- Prefer simplicity over covering all edge cases and adding flexibility in CLIs.
- Be concise in docstrings and comments.
- Prefer f-strings over .format() or %
- Use pathlib over os.path
- Keep mccabe complexity under 10

## Testing

- Use pytest with pytest-asyncio
- Prefer test functions over classes
- Place tests in `tests/` directory
- Unit tests in `tests/unit/` directory
- Integration tests in `tests/integration/` directory.
- Use `asyncio_mode = "auto"`
- Use fixtures for setup/teardown
- Avoid mocks and patching unless absolutely necessary. Prefer using integration tests to validate multi-component systems. If doing so, ideally spin up local integration test components via `Makefile`.
- LLM testing: it's OK to call LLMs in integration tests.

## Package Management

- Use uv for dependency management
- Use hatchling as build backend
- Keep pyproject.toml as single source of truth

## Common Commands

- `uv run ruff format .` - Format code
- `uv run ruff check --fix .` - Lint and auto-fix
- `uv run mypy .` - Type check
- `uv run pytest` - Run tests
