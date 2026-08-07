# vault

Personal Claude Code workspace focused on frontend development, UI/UX design, and SEO for websites

## Structure

- `llm-council/` — a nested clone of [karpathy/llm-council](https://github.com/karpathy/llm-council), a multi-LLM deliberation tool (FastAPI backend + React frontend). It's a separate application with its own stack and its own `llm-council/CLAUDE.md` — treat it as a subtree, not part of vault's main codebase. See `.claude/skills/llm-council-dev/SKILL.md` for how to work in it.
- `ponytail/` — a reference clone of [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail), a Claude Code plugin that nudges an agent toward minimal, YAGNI-first code. Kept for reference only — **not installed or active** in this workspace; nested `.git` removed on clone, same as llm-council.
- `.claude/` — skills, commands, agents, and hooks live here. Each file documents itself via its `description` frontmatter — check there before assuming a workflow doesn't exist yet.

## Connected repos

Repos that symlink their .claude/skills/ and .claude/commands/ from this vault. Updating a skill here automatically updates every repo that symlinks it.

| Repo                          | Path                             | Stack                                                            | Skills from vault                 | Notes                                                                                                                                                                                                                                                                                                                                                                             |
| ----------------------------- | -------------------------------- | ---------------------------------------------------------------- | --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| brain                         | d:/brain                         | Obsidian markdown, no build                                      | frontend-design, seo, ux-patterns | Also has brain-specific skills: brain-agent, /ingest, /brain-audit, /connect                                                                                                                                                                                                                                                                                                      |
| StudynLearn                   | d:/StudynLearn                   | Static PHP, Vercel, Bootstrap 5.3.3, vanilla JS                  | frontend-design, seo, ux-patterns | Source of truth is brain.md, gitdoc auto-commits on save                                                                                                                                                                                                                                                                                                                          |
| SmartSchool Experience center | d:/SmartSchool Experience center | Design/wireframes only, no app code yet                          | frontend-design, seo, ux-patterns | Own repo: [niranjan910/SmartSchool-Experience-Center](https://github.com/niranjan910/SmartSchool-Experience-Center) (private). Linked as junctions/hard links, not symlinks — this machine has no symlink privilege                                                                                                                                                               |
| SNL Solutions                 | d:/SNL solutions                 | Static PHP, no framework/build step, hand-written CSS/vanilla JS | frontend-design, seo, ux-patterns | Own repo: [niranjan910/SNL_Solutions](https://github.com/niranjan910/SNL_Solutions) (private). Source of truth is brain.md. Linked as junctions/hard links, not symlinks — no symlink privilege in that session. Also has repo-specific `.claude/agents/code-reviewer.md` and a PHP/CSS/JS-adapted `format-on-write.sh` (not the vault TS-stack version) — kept local, not shared |

## Adding a new repo

1. Open the new repo in VS Code with Claude Code
2. Paste the vault connection prompt from .claude/commands/ (or ask Claude to connect it to d:/Vault)
3. Add a row to this table

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
