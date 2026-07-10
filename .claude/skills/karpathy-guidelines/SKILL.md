---
name: karpathy-guidelines
description: Behavioral guardrails for coding tasks that keep output correct and minimal. Use on ANY non-trivial coding task — implementing a feature, fixing a bug, refactoring, or editing existing code — to prevent the two most common LLM failure modes: making silent wrong assumptions and over-engineering. Trigger before writing or changing code of any real consequence.
---

# Coding Guardrails

Two failure patterns cause most bad LLM code: **charging ahead on an unverified assumption**, and **over-engineering a simple change into a sprawling one**. These four rules counter both.

## 1. Think before you code

- Restate the goal in your own words. If the request is ambiguous, resolve it by *reading the code* first — not by guessing.
- Locate the exact files, functions, and call sites involved before editing. Never assume an API's shape; open it and confirm.
- If a genuine fork in behavior remains after reading, surface it and ask — one sharp question beats a wrong 200-line diff.

## 2. Simplicity is a hard constraint, not an afterthought

- Prefer the smallest change that fully solves the problem. Fewer lines, fewer files, fewer abstractions.
- Do not add configuration, layers, generics, or "flexibility" that the task did not ask for. Speculative generality is a cost, not a gift.
- If a solution is turning 50 lines into 500, stop and look for the version the codebase's existing patterns already imply.

## 3. Make surgical changes

- Touch only what the task requires. Do not reformat untouched lines, rename unrelated symbols, or "clean up" adjacent code in the same change.
- Match the surrounding code's style, naming, and idioms exactly — read like the file, don't stamp your own conventions on it.
- Keep diffs reviewable: a reviewer should see *only* the change and understand it in one pass.

## 4. Stay goal-driven

- Every edit should trace back to the stated goal. If you notice unrelated problems, note them — don't silently fix them and expand the blast radius.
- Verify the change does what it should by exercising the actual behavior, not by assuming.
- When done, state plainly what you changed and what you did *not* touch, so the boundary is explicit.

## The one-line test

Before committing any diff, ask: **"Is this the smallest, most surgical change that provably solves the stated goal — with no assumption I haven't checked in the code?"** If not, cut it back until it is.
