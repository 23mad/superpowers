---
name: formal-designing
description: Use when a change is cross-cutting, hard to reverse, or likely to affect project boundaries and needs a durable design before implementation
---

# Formal Designing

Use this skill when the main risk is boundary damage, not uncertainty.

**Announce at start:** "I'm using the formal-designing skill to lock down the design before implementation."

## When to Use

Use this skill when:
- the change touches multiple modules, interfaces, or subsystems
- rollback would be expensive
- acceptance criteria need agreement before coding
- a successful prototype now needs durable structure
- the work will redefine project boundaries or invariants

Do NOT use this skill for:
- reversible experiments
- unfamiliar-engine feel checks
- early gameplay loop validation
- "just need to see if this works" tasks

Use `prototyping` for those.

## Core Principle

Formal design protects system integrity.

If the main problem is "what should this system look like long-term?", use formal design.
If the main problem is "is this direction even worth continuing?", prototype first.

## Required Workflow

1. Query local memory for past decisions and related entities
2. Explore current project context
3. Identify touched boundaries and invariants
4. Ask clarifying questions
5. Propose 2-3 approaches with trade-offs
6. Present the recommended design
7. Write a design doc
8. Self-review for ambiguity, scope, and contradictions
9. Get user approval
10. Write back key decisions to memory
11. Invoke `writing-plans`

## Design Output

Write a durable design that covers:
- architecture
- touched components
- invariants that must remain true
- data or control flow
- error handling
- verification strategy
- migration or rollback concerns if relevant

Default path:
`docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md`

## Anti-Pattern: Formalizing Uncertainty Too Early

Do not use this workflow just because a task sounds important.

Red flags:
- the core loop is still unclear
- the engine or toolchain is still being learned
- the user mainly needs a fast reversible experiment
- discussion is stuck at local features before a playable slice exists

When these appear, stop and use `prototyping`.

## Handoff

After the user approves the design, invoke `writing-plans`.
