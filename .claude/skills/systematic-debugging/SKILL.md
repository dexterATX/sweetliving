---
name: systematic-debugging
description: A hypothesis-driven method for diagnosing bugs, test failures, crashes, and unexpected behavior. Use whenever something is broken and the cause isn't immediately obvious — failing tests, runtime errors, incorrect output, flaky behavior, performance regressions. Prevents symptom-chasing and random-guess fixes. Trigger on "why is this failing", "debug this", "it's not working", or any diagnosis task.
---

# Systematic Debugging

Random guessing wastes time and often "fixes" a symptom while the real cause survives. Debug by hypothesis, not by vibes.

## The loop

1. **Reproduce reliably.** Find the smallest, deterministic way to trigger the bug. If it's flaky, that instability *is* a clue (ordering, timing, shared state, uninitialized data). You cannot fix what you can't reproduce.
2. **Observe precisely.** Read the actual error, stack trace, and logs — all of them, not just the last line. State the *exact* observed behavior vs. the expected behavior. Note the delta.
3. **Form a hypothesis.** Propose one specific, falsifiable cause: "X is null because Y runs before Z." Predict what you'd see if it's true.
4. **Test the hypothesis cheaply.** Add a log, a breakpoint, an assertion, or bisect the input/history. Confirm or kill the hypothesis with evidence — don't skip to editing code.
5. **Isolate.** Narrow the surface: binary-search the code path, comment out halves, git-bisect across commits, or minimize the input until the failure boundary is exact.
6. **Fix the cause, not the symptom.** Once the root cause is proven, make the minimal change that addresses *it*. Then confirm the original reproduction now passes — and that you didn't break neighbors.
7. **Prevent recurrence.** Add a regression test that fails without your fix and passes with it.

## Discipline

- **One variable at a time.** Change one thing, observe, repeat. Shotgun edits destroy your ability to reason about cause.
- **Trust evidence over intuition.** If the data contradicts your mental model, the model is wrong — update it.
- **Write down what you've ruled out.** It stops you re-checking the same dead ends and reveals where the cause must be hiding.
- **Suspect your own recent change first.** The bug usually lives in the newest diff, not the framework.
