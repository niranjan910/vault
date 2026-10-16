Source: https://github.com/vercel-labs/agent-skills @ 063bee94c3f4df8453406c830b0a7df0f2860278
Path: skills/react-best-practices
License: MIT, declared in SKILL.md frontmatter. The upstream repo has no LICENSE file, so no license text is bundled (see registry/skills.json). Imported from upstream, then locally modified (see below).

Local modification (registry: modified=true): SKILL.md gained a "Compatibility preflight" section before "When to Apply". It checks the target project's installed React/Next.js versions and gives minimum versions and fallbacks for Activity and useEffectEvent (React 19.2), use() and react-dom resource hints (React 19), and after() (Next.js 15.1). Minimums checked against react.dev (19 and 19.2 posts) and nextjs.org/docs after() version history on 2026-10-16. Nothing else changed; AGENTS.md, rules/ and metadata.json are byte-identical to upstream. To revert, restore SKILL.md from the pinned commit.

Open licence concern (not resolved): the upstream repo has no LICENSE file. MIT is declared only in this SKILL.md frontmatter, the upstream README and one build-package manifest, and no copyright notice is available to bundle. Ask upstream to add a LICENSE before redistributing publicly.
