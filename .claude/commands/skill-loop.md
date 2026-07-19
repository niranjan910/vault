---
name: skill-loop
description: Iteratively develop or fix a skill under skills/ — draft it, test it against real prompts, grade the results, and repeat until it reliably triggers and produces the right output. Use when asked to build a new skill, fix one that isn't triggering, or clean up one that's giving inconsistent results.
argument-hint: [skill-name]
context: fork
agent: general-purpose
---

Run the iteration loop for the skill named `$0` (create `skills/$0/` if it doesn't exist yet).

1. **Draft.** Write or update `skills/$0/SKILL.md`. Keep `description` specific about *when* to trigger — that field is the entire triggering mechanism. Keep the body under 500 lines; push anything long into `references/` or `scripts/` inside the skill folder.
2. **Test.** Write 3-5 realistic prompts a user would actually send. Run each one against the skill in a clean context — no leftover conversation state from writing the skill itself, or you'll fool yourself into thinking it works.
3. **Grade.** For every run, check two things separately:
   - Did it trigger when it should have, and stay quiet when it shouldn't?
   - Was the output actually correct once it did trigger?
4. **Refine.** Fix whichever failed. Sharpen `description` if triggering was the problem; fix the instructions if the output was the problem. Change one thing per round and re-test — don't fix both blindly on the same pass, or you won't know what actually helped.
5. **Repeat** steps 2-4 until every test prompt passes, or for 5 rounds, whichever comes first. If it's still failing after 5 rounds, stop and report exactly what's going wrong instead of continuing to guess.

Report back: what changed each round, and the final pass/fail state of every test prompt.
