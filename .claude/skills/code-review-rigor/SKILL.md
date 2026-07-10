---
name: code-review-rigor
description: A structured, severity-ranked method for reviewing code — your own diff before committing, or someone else's PR. Use when reviewing changes, auditing a diff, or self-checking before you ship. Covers correctness, security, performance, and design (SOLID), and reports findings ranked by severity with concrete failure scenarios. Trigger on "review this", "check my code", "is this ready to merge", or before finalizing any non-trivial change.
---

# Code Review Rigor

A good review finds real defects and ranks them so the author knows what must change vs. what's optional. Vague "looks good" reviews and nitpick-only reviews are both failures.

## What to examine, in priority order

1. **Correctness** — Does it do what it claims for the normal case *and* the edges? Off-by-one, null/undefined, empty collections, boundary values, concurrency, error paths, and the case the author obviously didn't test.
2. **Security** — Untrusted input reaching a sink (injection, XSS, path traversal, SSRF), authz/authn gaps, secrets in code, unsafe deserialization, missing validation at trust boundaries.
3. **Data & failure handling** — Are errors caught at the right level? Are transactions/rollbacks correct? Any way to corrupt or lose data? Resource leaks (connections, files, handles)?
4. **Design & maintainability** — Single responsibility, sensible boundaries, no needless coupling or duplication, names that reveal intent. Flag over-engineering as firmly as under-engineering.
5. **Performance** — Only where it matters: N+1 queries, unbounded loops/allocations on hot paths, accidental O(n²), missing indexes. Don't micro-optimize cold code.
6. **Tests** — Do tests exist for the new behavior and its edges? Would they actually fail if the code were wrong?

## Reporting format

For each finding, give: **severity · file:line · one-sentence defect · a concrete failure scenario (inputs → wrong outcome) · suggested fix.**

Severity scale:
- **P0 (blocker)** — data loss, security hole, crash, or wrong result on a common path. Must fix before merge.
- **P1 (should fix)** — real bug on an edge case, or a design flaw that will bite soon.
- **P2 (nice to have)** — maintainability, minor inefficiency, missing test.
- **P3 (nit)** — style/naming; never block a merge on these alone.

## Rules

- **Verify before you claim.** A finding without a plausible failure scenario is a guess — either prove it or drop it. Rank confirmed issues above speculative ones.
- **Lead with the P0/P1s.** If there are none, say so explicitly and clearly — don't manufacture severity to look thorough.
- **Review the diff, not the person.** Comment on code and behavior.
