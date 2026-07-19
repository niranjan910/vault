---
name: workflows
description: Conventions for this repo's CI/CD pipelines (GitHub Actions). Use when adding or editing a .github/workflows/*.yml file, debugging a failing pipeline, or asked how CI is structured.
---

# CI/CD workflow conventions

- One workflow file per concern (`test.yml`, `deploy.yml`, `lint.yml`) rather than one giant pipeline — easier to see what failed and why.
- Pin action versions to a commit SHA or exact tag, not `@main`, so a third-party action can't change behavior under you.
- Scope secrets as narrowly as possible per job — don't pass repo-wide secrets into jobs that don't need them.
- Cache dependencies (`actions/cache` or the language-specific setup action's built-in cache) — cold installs are the biggest source of slow CI.
- Name jobs and steps descriptively; "build" tells you nothing when six workflows all have a "build" step and you're scanning a failed-checks list.

## Note
This skill's name overlaps with GitHub's own "workflows" term, which was a guess at intent — if this folder is actually meant for something else (e.g. internal team process docs), rename it and rewrite this description so it triggers correctly.
