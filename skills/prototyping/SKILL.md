---
name: prototyping
description: Use when exploring unfamiliar tools, validating a core loop, or running a reversible experiment where iteration speed matters more than full design rigor
---

# Prototyping

Use this skill to learn quickly without losing control of the project.

**Announce at start:** "I'm using the prototyping skill to frame the smallest safe experiment."

## When to Use

Use this skill when:
- the engine or toolchain is unfamiliar
- the main question is "does this work" or "does this feel right"
- the change is reversible
- the project does not yet have a stable core loop
- iteration speed matters more than durable structure for this round

Do NOT use this skill when:
- the change is cross-cutting
- rollback would be expensive
- multiple subsystems need coordinated durable design
- the result is meant to be maintained immediately

Use `formal-designing` for those.

## Core Principle

Prototype to learn, not to finalize.

The goal is to reach a reliable judgment quickly, not to produce polished implementation.

## Required Output Before Coding

Write a short experiment frame:

- `Hypothesis`
- `Engineering fences`
- `Success signal`
- `Timebox`
- `Exit rule`

Keep it short. Usually 5-10 lines.

`Engineering fences` should say:
- what must not be changed
- what invariants must be preserved
- what files or modules are in scope

## Experiment Loop

1. Query memory for related attempts
2. Read local context just enough to avoid blind damage
3. Write the experiment frame
4. Get user approval on the frame
5. Run the smallest useful implementation
6. Validate the result quickly
7. Record what was learned
8. Decide whether to stop, iterate once more, or promote the work

## Testing Guidance

Do not force full feature-level TDD while the boundaries are still moving.

In prototype mode:
- prefer smoke checks
- prefer direct validation of the hypothesis
- prefer disposable verification over exhaustive coverage

Once behavior and boundaries stabilize, switch to `test-driven-development` or `formal-designing` as appropriate.

## Anti-Pattern: Formalizing Too Early

If you are repeatedly doing detailed requirement design, repeated feature approvals, or strict local TDD before the core loop is stable, you are probably protecting the wrong thing.

Protect iteration speed first.
Protect durable structure after the project earns it.

## Output Format

Default path:
`docs/superpowers/experiments/YYYY-MM-DD-<topic>.md`

Recommended template:
- Hypothesis:
- Engineering fences:
- Success signal:
- Timebox:
- Result:
- Decision:

## Handoff

If the experiment reveals a stable direction:
- use `formal-designing` if the next step changes boundaries
- use `test-driven-development` if the next step is now a bounded implementation task
