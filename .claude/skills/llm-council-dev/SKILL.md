---
name: llm-council-dev
description: How to run, debug, and extend the LLM Council subproject at llm-council/ (a multi-LLM deliberation tool — FastAPI backend + React frontend). Use whenever working on any file under llm-council/, when asked to add a feature to its council/chairman flow, or when asked to run or debug the council app.
paths: ["llm-council/**"]
---

# LLM Council subproject

This is a nested clone of karpathy/llm-council, kept as its own subtree with its own stack. It already ships a detailed `llm-council/CLAUDE.md` — read that first for the real architecture (the stage1/stage2/stage3 flow in `backend/council.py`, the response-anonymization scheme, why backend imports are relative). Don't re-derive any of that from source when it's already written down there.

## Running it

- Backend (port 8001, not 8000): `cd llm-council && uv run python -m backend.main`
- Frontend (port 5173): `cd llm-council/frontend && npm run dev`
- Both at once: `cd llm-council && ./start.sh`

Requires `OPENROUTER_API_KEY` in `llm-council/.env`.

## Picking up a task

If not told what to build, check the "Future Enhancement Ideas" section of `llm-council/CLAUDE.md` first — it's an actual backlog, not just notes:
- Configurable council/chairman via UI instead of editing `config.py`
- Streaming responses instead of batch loading
- Export conversations to markdown/PDF
- Model performance analytics over time
- Custom ranking criteria beyond accuracy/insight
- Special handling for reasoning models (o1-style)

## Conventions specific to this subproject

- Always run the backend as `python -m backend.main` from `llm-council/`, never from inside `backend/` — the relative imports break otherwise.
- Changing a port means updating both `backend/main.py` and `frontend/src/api.js` — they're not read from one shared config.
- This subproject keeps its own light-mode theme (`#4a90e2` primary blue) and its own component conventions. It intentionally does not follow vault's root `frontend-design` skill — that skill's conventions are for the rest of vault, not this subtree.
- Wrap new `ReactMarkdown` output in `<div className="markdown-content">` or spacing breaks.
