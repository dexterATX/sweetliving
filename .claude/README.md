# Claude Skills Bundle — high-quality-output setup

A portable, version-controlled set of [Agent Skills](https://github.com/anthropics/skills)
that raise the quality of Claude's output on engineering work. Drop this `.claude/`
directory into any repo, or install it globally so it's the default everywhere.

## What's included

| Skill | Lifts quality by… |
|-------|-------------------|
| **frontend-design** | Distinctive, production-grade UI — kills generic "AI slop" defaults. |
| **karpathy-guidelines** | Prevents silent wrong assumptions and over-engineering on any coding task. |
| **structured-workflow** | Phase discipline (brainstorm → spec → plan → TDD → review → finalize) for big tasks. |
| **systematic-debugging** | Hypothesis-driven root-cause analysis instead of symptom-chasing. |
| **code-review-rigor** | Severity-ranked (P0–P3) review across correctness, security, perf, and design. |

Each skill is a folder with a `SKILL.md` (YAML frontmatter + Markdown), following
the open Agent Skills standard — so it also works in Codex, Cursor, Gemini CLI, and
other compatible clients.

## Two ways to use it

### A. Per-repo (already active)
Because these live under `.claude/skills/`, they load automatically whenever you run
Claude Code **inside a repo that contains this directory**. Nothing to install.
Copy `.claude/` into any other repo to bring them along.

### B. Global default for *every* repo
Install them into your user-level skills directory once:

```bash
bash ./.claude/install-skills.sh
```

This copies each skill into `~/.claude/skills/`, which loads in every Claude Code
session regardless of the current repository. Restart Claude Code afterward.

> **Note (Claude Code on the web):** web sessions run in an ephemeral container, so
> `~/.claude/skills` does not persist between sessions. There, prefer method **A**
> (commit `.claude/` into the repos you use), or have an org admin provision skills
> account-wide. On the desktop app / terminal CLI, method **B** persists on your machine.

## Want the canonical community skills too?

These authored skills capture the same principles as the top-ranked community skills.
To also install the originals via the Claude Code CLI:

```text
# Anthropic official design skill
npx skills add anthropics/skills --skill frontend-design

# Superpowers — full brainstorm→TDD→review workflow (user scope = all repos)
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace

# Vercel Web Design Guidelines — accessibility/UX audit
npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines
```

Community skills run their own instructions/scripts — prefer well-known, high-star,
or official sources.
