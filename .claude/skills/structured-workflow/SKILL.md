---
name: structured-workflow
description: A disciplined phase-based workflow for multi-step engineering tasks — building a feature, migration, or anything spanning multiple files or sessions. Use when a task is large enough that jumping straight to code risks context drift, half-solutions, or untested output. Enforces brainstorm → spec → plan → test-driven implementation → review → finalize. Trigger on any substantial or multi-part build request.
---

# Structured Workflow

Big tasks fail when the agent skips straight to typing. This skill imposes six phases. Do not collapse them; each exists to catch a failure the previous one can't.

## Phase 1 — Brainstorm
Explore the problem space before committing. What is the user actually trying to achieve? What are 2–3 viable approaches, and their trade-offs? Name the risks and unknowns. Output: a short problem framing + chosen approach with a one-line justification.

## Phase 2 — Spec
Write down what "done" means *before* building. Concrete acceptance criteria, the public interface/behavior, edge cases, and explicit non-goals. A spec you can test against prevents scope creep and "I thought you meant…" rework.

## Phase 3 — Plan
Decompose into ordered, independently verifiable steps. Identify the exact files to touch. Flag steps that are risky or reversible-only-with-effort. If the plan has more than ~7 steps, look for a simpler decomposition. Output: a checklist.

## Phase 4 — Test-Driven Implementation
For each step: write or update the test first (or define how you'll verify), then implement the minimum to satisfy it, then run it. Keep changes surgical (see `karpathy-guidelines`). Commit logically-grouped, working increments — never one giant blob.

## Phase 5 — Review
Before declaring done, review your own diff adversarially — as if you're a reviewer trying to reject it. Check correctness, edge cases, error handling, and that nothing unrelated was touched. Run the full relevant test suite and any linter/typechecker. Fix what you find. (Pairs with `code-review-rigor`.)

## Phase 6 — Finalize
State plainly: what changed, what was verified and how, what was intentionally left out, and any follow-ups. If pushing, use clear commit messages and open a PR that a reviewer can understand without you in the room.

## Rules
- **Verify at every phase boundary** — don't advance on assumptions.
- **Use fresh, scoped context for isolated sub-tasks** so a long task doesn't drown in stale detail.
- **When blocked by genuine ambiguity, ask once, sharply** — then continue.
