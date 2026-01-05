---
globs: ["**/.git*", "**/COMMIT_*"]
---

# Git Guidelines

## Commits

- Write concise commit messages in present tense
- Describe the purpose, not just what changed
- Keep commits focused and atomic

## Branches

- Default branch: main
- Use descriptive branch names: `feature/`, `fix/`, `refactor/`

## Configuration

- User info should be in ~/.gitconfig.local (not tracked)
- Use Cursor as difftool

## Workflow

- Pull before starting work
- Run tests before pushing
- Don't force push to main/master
