# vault

<!-- TODO: one or two lines on what vault itself actually is/does -->

## Structure

- `llm-council/` — a nested clone of [karpathy/llm-council](https://github.com/karpathy/llm-council), a multi-LLM deliberation tool (FastAPI backend + React frontend). It's a separate application with its own stack and its own `llm-council/CLAUDE.md` — treat it as a subtree, not part of vault's main codebase. See `.claude/skills/llm-council-dev/SKILL.md` for how to work in it.
- `.claude/` — skills, commands, agents, and hooks live here. Each file documents itself via its `description` frontmatter — check there before assuming a workflow doesn't exist yet.

## Commands

<!-- TODO: replace with the real build/test/lint commands once the stack is filled in -->
- Build: `<fill in>`
- Test: `<fill in>`
- Lint: `<fill in>`

## Code style

<!-- TODO: your actual conventions go here -->

---
This file is mostly scaffolding right now — it exists so Claude Code at least knows the repo has a nested subproject with different conventions before it goes looking. Fill in the TODOs (or tell Claude your stack and real commands) whenever you're ready.
