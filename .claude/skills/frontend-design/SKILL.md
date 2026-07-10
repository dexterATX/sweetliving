---
name: frontend-design
description: Use when building or restyling any user-facing UI — web pages, app screens, React/Vue components, landing pages, dashboards, emails, or artifacts. Produces distinctive, production-grade interfaces and avoids generic "AI slop" defaults. Trigger whenever the task involves building/designing/styling a page, screen, or component, or choosing typography, color, spacing, motion, or layout.
---

# Frontend Design

Default AI-generated UI is *technically correct but visually interchangeable*: the same system font, the same violet→indigo gradient, the same centered card on a gray page. This skill pushes every interface toward a deliberate, production-grade point of view.

## Before writing markup

State a **design direction** in one sentence — the mood and who it's for (e.g. "editorial and calm for long-form reading," "dense and utilitarian for power users," "playful and tactile for a consumer launch"). Every later decision must serve that direction. If you can't name the direction, you're about to produce slop.

## The principles

1. **Typography carries the design.** Pick a typeface with a point of view — not the platform default. Establish a real type scale (e.g. 1.25 or 1.333 ratio), set generous line-height for body (1.5–1.7), tighten it for headings, and constrain measure to ~60–75 characters. One expressive display face + one neutral text face beats five random fonts.
2. **Color is a system, not a swatch.** Start from one anchor hue and derive a small, intentional ramp (surface, raised surface, border, muted text, text, accent). Aim for a real contrast story, not rainbow accents. Verify text meets WCAG AA (4.5:1 body, 3:1 large).
3. **Space is a design element.** Use a consistent spacing scale (4/8px base). Let sections breathe; crowding reads as unfinished. Alignment and rhythm do more for "premium" feel than any effect.
4. **Depth with restraint.** Prefer one or two elevation levels via subtle shadows/borders over heavy drop shadows. Borders at low opacity often beat shadows for crispness.
5. **Motion communicates, it doesn't decorate.** Animate state changes (enter/exit, hover, focus, loading) with short durations (120–240ms) and easing that matches the mood. Respect `prefers-reduced-motion`.
6. **Design the empty, loading, and error states.** A screen isn't done until these three exist. Skeletons over spinners where possible.
7. **Accessibility is table stakes.** Semantic HTML, visible focus rings, labelled controls, keyboard operability, and sufficient contrast — always, not as a follow-up.

## Anti-slop checklist (run before shipping)

- [ ] Is the typeface a deliberate choice, not the default?
- [ ] Does the color ramp derive from an anchor, with AA-passing text?
- [ ] Is spacing on a consistent scale, with room to breathe?
- [ ] Do interactive elements have hover, focus, and active states?
- [ ] Do empty/loading/error states exist?
- [ ] Does it look intentional in *both* light and dark, if both are supported?
- [ ] Would a designer recognize a point of view — or is it interchangeable?
