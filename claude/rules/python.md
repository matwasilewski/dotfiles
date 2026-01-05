---
globs: ["**/*.py"]
---

# Python Guidelines

## Formatting

- Line length: 79 characters
- Target Python version: 3.13
- Use Ruff for formatting and linting (`ruff format`, `ruff check`)

## Ruff Configuration

Standard ruff.lint.extend-select rules:
- `E`, `W` - pycodestyle errors/warnings
- `F`, `F401` - Pyflakes, unused imports
- `I` - isort
- `B` - bugbear
- `UP` - pyupgrade
- `RUF` - Ruff-specific rules
- `A` - flake8-builtins
- `C4` - flake8-comprehensions
- `C90` - mccabe complexity (max 10)
- `N` - pep8-naming
- `PT` - flake8-pytest-style
- `ARG` - flake8-unused-arguments
- `PTH` - flake8-use-pathlib
- `ERA` - eradicate (commented code)
- `COM` - flake8-commas
- `Q` - flake8-quotes
- `TD`, `FIX` - todos/fixmes

Common ignores: `E501` (line length handled by formatter), `COM812` (trailing comma), `B008` (function call in default arg)

## Type Annotations

- All functions require type annotations (`disallow_untyped_defs = true`)
- Use mypy with `ignore_missing_imports = true`
- Use `from __future__ import annotations` for forward references

## Style

- Prefer f-strings over .format() or %
- Use pathlib over os.path
- Keep mccabe complexity under 10

## Testing

- Use pytest with pytest-asyncio
- Place tests in `tests/` directory
- Use `asyncio_mode = "auto"`
- Use fixtures for setup/teardown

## Package Management

- Use uv for dependency management
- Use hatchling as build backend
- Keep pyproject.toml as single source of truth

## Common Commands

- `uv run ruff format .` - Format code
- `uv run ruff check --fix .` - Lint and auto-fix
- `uv run mypy .` - Type check
- `uv run pytest` - Run tests
