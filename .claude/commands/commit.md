---
description: Stage and commit the current changes following this repo's commit conventions.
disable-model-invocation: true
allowed-tools: Bash(git add *) Bash(git commit *) Bash(git status *) Bash(git diff *)
---

Review the current changes and create a commit.

1. Run `git status` and `git diff` to see what actually changed.
2. Group related changes into one focused commit. If the diff covers unrelated work, split it into multiple commits instead of one grab-bag commit.
3. Write the message in this format:
   - Subject line: imperative mood, under 72 characters (e.g. "Add retry logic to webhook handler")
   - Blank line, then a short body explaining *why*, only if the change isn't self-evident from the diff
4. Do not add "Generated with Claude Code" or similar attribution unless explicitly asked.
5. Run the commit.
6. Show `git log -1` to confirm.

If there's nothing staged or unstaged, say so and stop rather than creating an empty commit.
