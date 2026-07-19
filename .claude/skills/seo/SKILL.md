---
name: seo
description: On-page and technical SEO conventions for this repo. Use for any mention of SEO, meta tags, page speed, Core Web Vitals, search ranking, schema markup, sitemap, robots.txt, or Lighthouse score.
---

# SEO conventions

## On-page SEO

- One `<h1>` per page, matching that page's primary intent — not the site name or a generic label.
- Heading hierarchy must be logical and sequential (H1 → H2 → H3); don't skip levels or pick a heading level for its font size.
- Title tags: ~50–60 characters, unique per page, primary keyword near the front, no keyword stacking.
- Meta descriptions: ~150–160 characters, written as genuine ad copy for the search result, not a keyword dump — it doesn't affect ranking directly but drives click-through.

## Technical SEO

- Core Web Vitals thresholds (measured at the 75th percentile of real users): LCP ≤ 2.5s, CLS ≤ 0.1, INP ≤ 200ms. Treat these as pass/fail gates, not aspirational targets.
- Every indexable page needs a self-referencing canonical tag, unless it's intentionally a duplicate pointing elsewhere (e.g. a filtered/sorted view of the same content).
- `robots.txt` should block crawl of non-public or duplicate-generating paths (search results, filters, admin) — never block CSS/JS the renderer needs, or Google can't evaluate the page properly.
- Keep an accurate, current XML sitemap; don't list URLs that 404, redirect, or are noindexed.

## Semantic HTML

- Use elements for what they mean, not how they look: `<button>` for actions, `<a>` for navigation, `<nav>`, `<main>`, `<article>`, `<section>` for structure — not a `<div>` with a click handler and a class name.
- Semantic markup is a two-for-one: it's what screen readers and assistive tech rely on, and what search engines use to understand page structure and content hierarchy.
- Common mistakes: `<div>`/`<span>` soup with no landmarks, links implemented as `<div onClick>` (unreachable by keyboard, invisible to crawlers), heading tags chosen for size instead of hierarchy.

## Image optimization

- Every meaningful image needs descriptive `alt` text; purely decorative images get `alt=""` (not omitted — omitting it is worse than empty).
- Lazy-load offscreen images (`loading="lazy"`) but never the largest above-the-fold image — that's usually the LCP element, and lazy-loading it hurts the metric it's supposed to help.
- Prefer WebP/AVIF over JPEG/PNG where support allows; serve responsive sizes (`srcset`/`sizes`) instead of one oversized image scaled down in CSS.

## Schema markup

- Add structured data (JSON-LD) when it maps to something real on the page — don't add a schema type speculatively hoping for a rich result.
- Common types: `Article`/`BlogPosting` for content pages, `Product` (with price/availability) for commerce, `BreadcrumbList` for navigation trail, `Organization`/`WebSite` sitewide.
- Validate with Google's Rich Results Test before shipping — invalid or mismatched schema (claiming data that isn't visible on the page) can trigger a manual action, not just a missed rich result.

## When not to over-optimize

- Keyword stuffing (unnatural repetition, hidden text, keyword-matching URLs for their own sake) reads as spam to both users and ranking algorithms — write for the person, not the crawler.
- Don't over-engineer meta tags: the meta-keywords tag is dead, ignored by every major engine — skip it. Don't hand-tune title/description per micro-variant page if it makes the copy unnatural.
- More schema isn't better schema — only mark up what's genuinely on the page, and don't chase every available schema type for one piece of content.
