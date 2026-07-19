# vault

Personal Claude Code workspace focused on frontend development, UI/UX design, and SEO for websites

## Structure

- `llm-council/` — a nested clone of [karpathy/llm-council](https://github.com/karpathy/llm-council), a multi-LLM deliberation tool (FastAPI backend + React frontend). It's a separate application with its own stack and its own `llm-council/CLAUDE.md` — treat it as a subtree, not part of vault's main codebase. See `.claude/skills/llm-council-dev/SKILL.md` for how to work in it.
- `.claude/` — skills, commands, agents, and hooks live here. Each file documents itself via its `description` frontmatter — check there before assuming a workflow doesn't exist yet.

## Commands

<!-- TODO: replace with the real build/test/lint commands once the stack is filled in -->

- Build: `<fill in>`
- Test: `<fill in>`
- Lint: `<fill in>`

## Code style

Write semantic HTML always. CSS follows mobile-first. No inline styles. Prefer CSS custom properties over hardcoded values.

## Current state / known gaps

**Closed this session:**

- vault is a git repo; first commit `cc89220`, pushed to [niranjan910/vault](https://github.com/niranjan910/vault) (private).
- `llm-council/` cloned from karpathy/llm-council; nested `.git` removed so it's a plain subtree, not an embedded repo.
- `.gitignore` created at the vault root.
- `.claude/hooks/format-on-write.sh` fixed — now uses Python instead of `jq` for parsing hook input, so it no longer silently fails when `jq` isn't installed.
- `.claude/skills/frontend-design/LICENSE.txt` added (Apache 2.0).

**Still open — needs a person:**

- `llm-council/.env` needs `OPENROUTER_API_KEY` before the council app will run.
- The `<!-- TODO -->` block under Commands (real build/test/lint commands for vault itself) still needs filling in. Code style now has a starting set of conventions but isn't exhaustive.
- `.claude/settings.local.json` is gitignored by design — it's per-machine, so each clone needs its own permission approvals; it won't carry over from this commit.

---

This file is mostly scaffolding right now — it exists so Claude Code at least knows the repo has a nested subproject with different conventions before it goes looking. Fill in the TODOs (or tell Claude your stack and real commands) whenever you're ready.
