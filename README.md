# Multi-Event Basket — A Proof of Concept for Bookwhen

**[Live demo](https://bookwhen-basket.fly.dev/)** &nbsp;|&nbsp; Rails 8.1 &nbsp;·&nbsp; Turbo Streams &nbsp;·&nbsp; PostgreSQL &nbsp;·&nbsp; RSpec

---

## The Problem

Bookwhen's public reviews contain a recurring complaint: users who want to book multiple classes — a Tuesday yoga session, a Saturday pottery workshop, a children's art class — must book each one individually. Every booking reloads a separate page. There is no basket. You book one event, navigate back to the listing, find the next event, book again. For users booking 3–4 events per visit (the primary use case for multi-class schedules), that is 3–4 full page cycles and 3–4 separate checkout flows.

This is the most commonly cited friction point in Bookwhen's public reviews, and it is a textbook Turbo Streams problem.

---

## The Solution

A persistent basket sidebar that updates in real time — no full page reloads, no navigation away from the event listing.

**Before:**
```
Browse events → Click event → Book → Payment → Confirmation
                    ↓
              Navigate back to listing
                    ↓
              Click next event → Book → Payment → Confirmation
                    ↓
              Navigate back to listing
                    ↓
              (repeat for every event)
```

**After:**
```
Browse events → Add to basket (instant, in-place)
              → Add to basket (instant, in-place)
              → Add to basket (instant, in-place)
              → Review basket → Single checkout
```

Turbo Streams is the right tool here because it pushes partial HTML fragments over the existing WebSocket connection — the basket sidebar updates, the event card flips state, and the basket review page refreshes, all simultaneously, triggered by a single form submission. No JavaScript written. No full page navigation.

---

## Architecture

### Data model

```
Event ──< BasketItem >── Basket
                            │
                     session_token (hex)
                     stored in Rails session
```

- **Event** — title, location, start/end time, capacity, price, category, instructor
- **Basket** — identified by a `SecureRandom.hex` token stored in the session cookie; no authentication required for this demo
- **BasketItem** — join record with a `[basket_id, event_id]` unique index to prevent duplicate entries

### Turbo Streams flow

```
User clicks "Add to basket"
        │
        ▼
POST /basket_items  (form submission, Turbo intercepts)
        │
        ▼
BasketItemsController#create
  → find_or_create_by(event: ...)
  → respond_to { |f| f.turbo_stream }
        │
        ▼
create.turbo_stream.erb
  → turbo_stream.update "basket"          # sidebar panel re-renders
  → turbo_stream.update "event_#{id}"    # event card flips to "Added ✓"
```

On **remove**, three targets update simultaneously:

```
destroy.turbo_stream.erb
  → turbo_stream.update "basket"          # sidebar panel re-renders
  → turbo_stream.update "event_#{id}"    # event card resets to "Add to basket"
  → turbo_stream.update "basket_review"  # /basket page item list re-renders
```

The third stream target (`basket_review`) means the basket review page stays live as items are removed — no stale data, no page refresh needed.

### Key decisions

| Decision | Rationale |
|---|---|
| Session-based basket, no auth | Removes the login barrier for a demo; in production this would scope to a user account |
| `find_or_create_by` in create action | Idempotent — double-submitting does not create duplicates; the unique DB index is a second line of defence |
| Three stream targets on destroy | The basket review page (`/basket`) is a live view, not a snapshot; removing an item there must update immediately |
| `data-turbo-frame="_top"` on navigation links | Links inside a Turbo Frame scope their navigation to that frame by default; `_top` breaks out for full-page transitions where needed |

---

## Demo

<video src="https://github.com/user-attachments/assets/c0f76da4-0f16-43e2-ba00-234ab5a04648" controls autoplay loop muted width="100%"></video>

---

## Tests

**28 examples, 0 failures**

```
bundle exec rspec
```

| Suite | File | Coverage |
|---|---|---|
| Model | `spec/models/event_spec.rb` | Presence validations, `sold_out?`, `price_pounds` |
| Model | `spec/models/basket_spec.rb` | Associations, `total_pounds` calculation |
| Model | `spec/models/basket_item_spec.rb` | Uniqueness constraint — same event cannot be added twice |
| System | `spec/system/basket_spec.rb` | Add event via UI; remove event via UI; duplicate prevention |

System tests run against Chrome via Selenium and exercise the full Turbo Streams flow end-to-end.

---

## Running locally

```bash
git clone https://github.com/victor-nwoseh/bookwhen-basket
cd bookwhen-basket
bundle install
export POSTGRES_PASSWORD=your_postgres_password
rails db:create db:migrate db:seed
rails server
```

Open `http://localhost:3000`. Requires Ruby 4.0+, Rails 8.1, PostgreSQL. Set `POSTGRES_PASSWORD` to match your local Postgres credentials (omit if your Postgres instance requires no password).

---

## What I'd build next

- **Real checkout flow** — integrate a payment provider (Stripe) and replace the "Proceed to checkout" placeholder with a real multi-item order summary and single-payment flow
- **Conflict detection** — flag overlapping events at add-to-basket time (a common pain point for users booking back-to-back sessions at different venues)
- **Mobile basket drawer** — the current two-column layout collapses on small screens; a Stimulus-driven slide-up drawer would be the right mobile pattern
- **Optimistic UI** — a Stimulus controller that speculatively updates the card state before the server round-trip completes, eliminating perceived latency on slow connections

---

For my production-grade engineering baseline, see [FlowForge](https://github.com/victor-nwoseh/FlowForge) — a multi-tenant SaaS platform with 124 automated tests and full CI/CD.
