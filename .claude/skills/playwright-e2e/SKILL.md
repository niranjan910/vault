---
name: playwright-e2e
description: How to write and run end-to-end tests with Playwright in this repo. Use when adding a new E2E test, debugging a flaky one, or asked to cover a user flow.
---

# Playwright E2E conventions

- Tests live in `e2e/` and are named `<flow>.spec.ts`.
- Prefer role- and text-based locators (`getByRole`, `getByText`) over CSS selectors — they survive markup changes and double as an accessibility check.
- One user-facing flow per test file; don't chain unrelated assertions into a single mega-test.
- Use `test.step()` to break a long flow into named, reportable steps.
- Never hard-code `waitForTimeout`; wait on a specific element or network response instead — arbitrary timeouts are the number one source of flaky tests.
- Run `npx playwright test --ui` locally to debug before pushing; CI runs headless.

## Additional resources
- scripts/run-flaky-detector.sh — reruns a spec N times to check for flakiness before merging
