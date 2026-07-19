---
description: Regenerate types from the current API/schema and fix any type errors that result.
disable-model-invocation: true
---

Sync generated types with the current schema:

1. Run the project's type-generation command. *(Starter template — replace this step with the real command once wired up, e.g. `npm run codegen`, `openapi-typescript`, `graphql-codegen`, or `prisma generate`.)*
2. Diff the regenerated output against what's currently committed.
3. Run the type checker (`tsc --noEmit` or equivalent) and fix any new errors the schema change caused.
4. Summarize what changed: new/removed fields, renamed types, anything touching a public API.

Do not silently widen a type (casting to `any`, `unknown`, etc.) to make an error disappear — fix the real mismatch or flag it for review instead.
