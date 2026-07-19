# vault

Personal Claude Code workspace, not a traditional code repo. This is where `.claude/` config lives, plus whatever side projects get parked here — right now, just `llm-council`.

## What's inside

**`.claude/`**

- Skills: `frontend-design` (UI conventions), `llm-council-dev` (how to run/extend the council app), `playwright-e2e` (E2E test conventions), `stripe-webhook-dev` (webhook handler conventions), `workflows` (CI/CD conventions)
- Commands: `/commit` (stage + commit), `/skill-loop` (iterate on a skill until it triggers and works), `/sync-types` (placeholder for a type-codegen sync, not wired up yet)
- Agent: `code-reviewer` — read-only review subagent (correctness → security → style), with its own persistent memory file separate from this CLAUDE.md
- Hook: `format-on-write.sh` — runs prettier after every Write/Edit on `.ts/.tsx/.js/.jsx/.json/.css/.md`

**`llm-council/`** — a nested clone of [karpathy/llm-council](https://github.com/karpathy/llm-council), kept as its own subtree with its own stack (FastAPI backend + React/Vite frontend). Its `.git` was stripped on clone, so it's just files here, not an embedded repo. It's a 3-stage multi-LLM deliberation tool: query a council of models in parallel, have them anonymously rank each other's answers, then have a chairman model synthesize a final answer. See `llm-council/CLAUDE.md` for the real architecture notes — don't re-derive them from source, they're already written down.

To run it:

```
cd llm-council && uv run python -m backend.main   # backend, port 8001
cd llm-council/frontend && npm run dev             # frontend, port 5173
# or both at once:
cd llm-council && ./start.sh
```

Needs `OPENROUTER_API_KEY` in `llm-council/.env` (gitignored, not part of the clone).

**`CLAUDE.md`** — the file Claude Code reads automatically at the start of every session here. Structure, commands, code style, plus a running "current state / known gaps" list, so a fresh session (or a fresh me) doesn't have to rediscover any of this by grepping around.

## Getting started on a new machine

1. Clone the repo.
2. Open the folder in VS Code with the Claude Code extension.
3. Add `llm-council/.env` with `OPENROUTER_API_KEY=...`.
4. Run llm-council:
   ```
   cd llm-council && uv sync && cd frontend && npm install && cd .. && ./start.sh
   ```

One more per-machine thing: `.claude/settings.local.json` is gitignored (personal tool-permission grants, not shared config), so Claude Code will ask for approvals again the first time it needs to run something new on a fresh machine. Expected, not a bug.

## Skills

| Skill                | Triggers on                                                      | What it does                                                                                                                                            |
| -------------------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `frontend-design`    | Building or restyling any component, page, or view               | Design conventions — reuse existing tokens, don't introduce new fonts without reason, few deliberate accent colors, avoid the generic AI-generated look |
| `llm-council-dev`    | Any file under `llm-council/` (path-scoped, auto-triggers)       | How to run/debug/extend the council app; points to `llm-council/CLAUDE.md` for real architecture instead of re-deriving it                              |
| `playwright-e2e`     | Adding a new E2E test, debugging a flaky one                     | Test file location/naming, role/text locators over CSS selectors, no `waitForTimeout`                                                                   |
| `stripe-webhook-dev` | Adding a webhook event handler, debugging signature verification | Verify `Stripe-Signature` before touching payloads, idempotency via `event.id`, fast 2xx acks, local testing via Stripe CLI                             |
| `workflows`          | Adding/editing `.github/workflows/*.yml`                         | CI/CD conventions — one workflow per concern, pin action versions to a SHA, scope secrets narrowly                                                      |

`frontend-design`, `playwright-e2e`, `stripe-webhook-dev`, and `workflows` are scaffolding for whenever vault has actual app code to apply them to — there isn't any yet outside `llm-council`, which deliberately doesn't follow them (it has its own conventions, documented in its own CLAUDE.md).

## Commands

| Command       | What it does                                                                                                                  |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| `/commit`     | Stage and commit current changes, following this repo's commit conventions — no AI attribution added unless asked             |
| `/skill-loop` | Draft/test/grade/refine a skill under `.claude/skills/` until it reliably triggers and produces correct output                |
| `/sync-types` | Regenerate types from the schema and fix resulting type errors — currently a placeholder, not wired to a real codegen command |

## Not here yet

CLAUDE.md still has open TODOs:

- What vault actually is, beyond "personal Claude Code workspace" — no fuller mission/purpose written down yet
- Real build/test/lint commands for vault itself — none defined (only `llm-council` has its own, separate stack)
- Code style conventions — not written down
