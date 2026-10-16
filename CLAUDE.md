# vault

Personal Claude Code workspace focused on frontend development, UI/UX design, and SEO for websites

## Structure

- `llm-council/` — a nested clone of [karpathy/llm-council](https://github.com/karpathy/llm-council), a multi-LLM deliberation tool (FastAPI backend + React frontend). It's a separate application with its own stack and its own `llm-council/CLAUDE.md` — treat it as a subtree, not part of vault's main codebase. See `.claude/skills/llm-council-dev/SKILL.md` for how to work in it.
- `ponytail/` — a reference clone of [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail), a Claude Code plugin that nudges an agent toward minimal, YAGNI-first code. Kept for reference only — **not installed or active** in this workspace; nested `.git` removed on clone, same as llm-council.
- `skill-packs/` — reference clones of popular community Claude Code skill packs (shallow, nested `.git` removed; commits pinned in `skill-packs/.sources`). Kept for reference only — **not installed or active**; copy a skill into `.claude/skills/` to use it. Also pinned subsets (not whole repos) of `vercel-labs/agent-skills`, `wshobson/agents`, `microsoft/playwright-cli`, `trailofbits/skills` — see `registry/skills.json`. Contents: `matt-pocock-skills` (mattpocock/skills), `i-have-adhd` (ayghri/i-have-adhd), `superpowers` (obra/superpowers), `diagram-design` (cathrynlavery/diagram-design), `humanizer` (blader/humanizer), `graphify` (Graphify-Labs/graphify), `addy-osmani-skills` (addyosmani/agent-skills), `impeccable` (pbakaus/impeccable). "Security Audit Skill" from the same leaderboard is not added — no single repo identified. `ponytail/` (above) is the 10th entry of that list.
- `registry/` — `skills.json` provenance + activation status for imported skills (pinned SHAs, licences); `registry/README.md` is the add/update/rollback procedure. Manual only, nothing auto-installs.
- `.claude/` — skills, commands, agents, and hooks live here. Each file documents itself via its `description` frontmatter — check there before assuming a workflow doesn't exist yet.

## Connected repos

Repos that symlink their .claude/skills/ and .claude/commands/ from this vault. Updating a skill here automatically updates every repo that symlinks it.

| Repo                          | Path                             | Stack                                                            | Skills from vault                 | Notes                                                                                                                                                                                                                                                                                                                                                                             |
| ----------------------------- | -------------------------------- | ---------------------------------------------------------------- | --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| brain                         | d:/brain                         | Obsidian markdown, no build                                      | frontend-design, seo, ux-patterns | Also has brain-specific skills: brain-agent, /ingest, /brain-audit, /connect                                                                                                                                                                                                                                                                                                      |
| StudynLearn                   | d:/StudynLearn                   | Static PHP, Vercel, Bootstrap 5.3.3, vanilla JS                  | frontend-design, seo, ux-patterns, responsive-craft | Source of truth is brain.md, gitdoc auto-commits on save. `responsive-craft` linked as a junction, not a symlink — no symlink privilege in that session                                                                                                                                                                                                                                                                                                                          |
| SmartSchool Experience center | d:/SmartSchool Experience center | Design/wireframes only, no app code yet                          | frontend-design, seo, ux-patterns | Own repo: [niranjan910/SmartSchool-Experience-Center](https://github.com/niranjan910/SmartSchool-Experience-Center) (private). Linked as junctions/hard links, not symlinks — this machine has no symlink privilege                                                                                                                                                               |
| SNL Solutions                 | d:/SNL solutions                 | Static PHP, no framework/build step, hand-written CSS/vanilla JS | frontend-design, seo, ux-patterns | Own repo: [niranjan910/SNL_Solutions](https://github.com/niranjan910/SNL_Solutions) (private). Source of truth is brain.md. Linked as junctions/hard links, not symlinks — no symlink privilege in that session. Also has repo-specific `.claude/agents/code-reviewer.md` and a PHP/CSS/JS-adapted `format-on-write.sh` (not the vault TS-stack version) — kept local, not shared |
| NGI-Website                   | d:/Solar/NGI-Website             | Static PHP, no framework/build step, hand-written CSS/vanilla JS | frontend-design, seo, ux-patterns | Own repo: [niranjan910/NGI-Website](https://github.com/niranjan910/NGI-Website) (private). Rooftop solar EPC marketing/lead-gen site for National Grid & Infra, built from their own proposal doc + draft site copy. Source of truth is brain.md. Linked as junctions, not symlinks — no symlink privilege on this machine. Several content items are still placeholder pending real business input — see brain.md / README.md open-items lists |
| Portfolio (Front_End_Portfolio) | d:/Portfolio                   | Next.js 14.2.5, React 18.3.1, Tailwind v3, GSAP, Lenis, Three.js/@react-three/fiber | all — whole `.claude/skills/` and `.claude/commands/` junctioned (not per-skill) | Junctioned at the VS Code workspace root `d:/Portfolio/.claude/`, **not** inside the git repo — the actual git repo (and Claude Code project root, if `frontend/` is ever opened standalone instead of its `d:/Portfolio` wrapper) is `d:/Portfolio/frontend`: [niranjan910/Front_End_Portfolio](https://github.com/niranjan910/Front_End_Portfolio) (private). That folder was a plain directory with no git history until this session — `git init` + reconciled with the existing (unrelated-history) remote via `merge --allow-unrelated-histories -X ours`, local app code kept over remote's older copy. That remote also carries unrelated GitHub-profile automation (`profile-3d-contrib/`, `profile-summary-card-output/`, `daily-profile-refresh.yml`) — untouched, not part of this app. Its old `.claude/settings.json` (a PostToolUse auto-commit+push hook hardcoded to a stale path) was deliberately dropped, not carried over — no auto-push hook is active here. Source of truth is its own `brain.md`, not vault's |

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
