# Claude Code Configuration

## Preferences

- Model: opus for complex tasks, sonnet for quick iterations
- Always show file paths with line numbers when referencing code
- Prefer concise responses unless detail is requested

## My Development Environment

- OS: macOS
- Shell: zsh
- Editor: Cursor
- Python: uv for package management

## Coding Principles

- Keep solutions simple and focused - avoid over-engineering
- Don't add features beyond what was asked
- Prefer editing existing files over creating new ones
- Use meaningful names; avoid abbreviations unless standard
- Write self-documenting code; add comments only for non-obvious logic

## Common Commands I Use

- `gs` - git status
- `gps` / `gpl` - git push / pull
- `dps` - docker ps
- `mf` / `mt` / `mr` - make format / test / run
- `port 8080` - check what's using a port
- `killport 8080` - kill process on port
- `psg X` - ps aux | grep X

## When Working on My Projects

- Check for existing patterns before introducing new ones
- Run tests after making changes when test commands are available
- Format code according to project conventions
- When users' intent is not clear, ask clarifying questions.
