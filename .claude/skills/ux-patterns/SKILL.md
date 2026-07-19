---
name: ux-patterns
description: UX design patterns and interaction conventions for this repo. Use for any mention of UX, user flow, navigation, forms, loading states, mobile experience, or interaction design.
---

# UX pattern conventions

## Information architecture

- Navigation should mirror how users think about the content, not how the codebase or database is organized.
- Keep primary navigation shallow — if something needs more than 2-3 clicks from the homepage, reconsider the hierarchy, don't just add a search box to compensate.
- Every page needs a clear "you are here": breadcrumbs, active-state nav, or a page title that orients the user, especially on deep pages.

## Form design

- Validate on blur or on submit, not on every keystroke — interrupting a user mid-input to tell them a 3-character email is invalid is worse than waiting.
- Error messages state what's wrong and how to fix it ("Password needs at least 8 characters"), never just "Invalid input."
- Order fields in the sequence a user would naturally think of them (e.g. name → email → password), and group related fields visually; don't reorder for form-layout convenience.
- Show inline errors next to the field they belong to, not just a summary banner at the top — both together is fine, one without the other isn't.

## Loading and empty states

- Prefer skeleton screens over spinners for anything that takes more than ~300ms — a skeleton previews the coming layout and feels faster at the same load time.
- A spinner is fine for short, indeterminate waits (a button submitting); a full-page spinner for a slow data fetch is a missed opportunity for a skeleton.
- Empty states are not dead ends — design them as a call to action ("No projects yet — create your first one") rather than a bare "No data" message.

## Mobile UX

- Minimum tap target size is 44×44px (iOS HIG) / 48×48px (Material) — err toward the larger number, and give adjacent targets enough spacing to avoid mis-taps.
- Put primary actions in the thumb-reachable zone (bottom half of the screen on a typical phone grip); don't put the main CTA in a top corner on mobile.
- Match platform gesture conventions users already have muscle memory for (swipe to dismiss, pull to refresh) instead of inventing new gestures for standard actions.

## Micro-interactions

- Every interactive element needs a hover state (pointer devices) and a pressed/active state (touch) — an element that looks static until clicked reads as broken.
- Transitions should confirm an action happened (a save, a toggle, an add-to-cart) — feedback within ~100ms of the action, even if the real work continues in the background.
- Don't animate for its own sake; every transition should answer "what changed, and does the user need to see that."

## When not to add complexity

- Before adding a new UI element (a filter, a toggle, a settings panel), ask what you could remove instead — most screens get worse from addition, not better.
- If a feature needs an explanatory tooltip to be usable, the design is doing too much — simplify the interaction before documenting it.
- Fewer, clearer choices beat more, flexible ones for most users; save configurability for power-user surfaces, not the primary flow.
