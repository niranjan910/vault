# Agent memory

Subagents defined in `agents/*.md` with a `memory:` field get their own persistent notes here, separate from CLAUDE.md.

| `memory:` value | Stored at | Shared | Version controlled |
|---|---|---|---|
| `project` | `.claude/agent-memory/<agent-name>/` (this folder) | Yes, whole team | Yes — safe to commit |
| `local` | `.claude/agent-memory-local/<agent-name>/` | No, just you | No — add to `.gitignore` |
| `user` (or omitted) | `~/.claude/agent-memory/<agent-name>/` | No, cross-project | N/A — lives on your machine |

Each agent's memory is a `MEMORY.md` file with YAML frontmatter (`name`, `description`, `type`). The first ~200 lines are injected into that agent's context on every invocation, so keep it as a dense index rather than a running log — once it grows past that, partition detail into separate files (e.g. `react-patterns.md`) and leave a pointer in `MEMORY.md`.
