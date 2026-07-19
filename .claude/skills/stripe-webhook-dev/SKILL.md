---
name: stripe-webhook-dev
description: Conventions for building and testing Stripe webhook handlers in this repo. Use when adding a new webhook event handler, debugging signature verification, or testing webhooks locally.
---

# Stripe webhook development

- Every handler verifies the `Stripe-Signature` header against the raw request body using the webhook signing secret before touching the payload — never trust an unverified event.
- Handlers must be idempotent: Stripe retries on timeout or failure, so the same event ID can arrive more than once. Check `event.id` against already-processed events before acting on one.
- Return a 2xx response as fast as possible; do slow work (emails, downstream calls) after acknowledging the event, not before.
- Test locally with the Stripe CLI: `stripe listen --forward-to localhost:<port>/webhooks/stripe`, then `stripe trigger <event-name>` to fire a real test event.
- Keep the list of handled event types explicit — log and ignore (don't error on) event types you don't yet handle, since Stripe adds new ones over time.

## Additional resources
- references/event-types.md — the event types this app currently handles and why
