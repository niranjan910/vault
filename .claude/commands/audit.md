---
description: Audit a URL or local file for accessibility, SEO, performance, and responsive design issues. Manual-invoke only — reports findings, does not fix them.
argument-hint: [url-or-file-path]
disable-model-invocation: true
allowed-tools: Read, Grep, Glob, WebFetch
---

Audit `$ARGUMENTS` for frontend quality issues. If it's a URL, fetch and inspect the rendered/source HTML; if it's a local file path, read it directly.

Check these four areas:

1. **Accessibility**
   - Color contrast: text vs. background meets 4.5:1 (3:1 for large text)
   - Every interactive element has a visible focus state
   - Icon-only controls and unlabeled inputs have `aria-label` or equivalent
   - Images have `alt` text (or empty `alt=""` if purely decorative)

2. **SEO basics**
   - `<title>` present, ~50–60 characters, unique
   - Meta description present, ~150–160 characters
   - Exactly one `<h1>`, logical heading hierarchy below it
   - Canonical tag present and self-referencing (unless intentionally pointing elsewhere)

3. **Performance red flags**
   - Render-blocking `<script>`/`<link>` tags in `<head>` without `async`/`defer`/`media` guards
   - Unoptimized images: oversized dimensions, missing `srcset`, non-next-gen formats where WebP/AVIF would work, no `loading="lazy"` on offscreen images
   - Excessive JS: large unsplit bundles, obviously unused libraries, inline scripts that could be deferred

4. **Responsive design**
   - Missing or misconfigured `<meta name="viewport">`
   - Fixed-width elements or hardcoded pixel widths that won't reflow
   - Evidence of desktop-only design (no mobile breakpoints, horizontal scroll risk)

## Output format

Report every finding under its area, tagged **CRITICAL** / **HIGH** / **MEDIUM** / **LOW**:

- CRITICAL: blocks users or search engines outright (missing alt on functional images, no title tag, unusable on mobile)
- HIGH: significant harm to usability, ranking, or performance (poor contrast, no canonical, large render-blocking bundle)
- MEDIUM: real but bounded impact (suboptimal meta description length, missing lazy-loading on a few images)
- LOW: polish-level (minor heading nesting oddity, a non-next-gen image format on a low-traffic page)

State _what's wrong_ and _what to change_ for every CRITICAL and HIGH finding — not just "this looks off." Do not modify any files; this command reports only.
