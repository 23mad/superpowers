---
name: test-driven-development
description: Use when a prototype direction has stabilized and the next step is a bounded implementation task that needs behavior-level tests before coding
---

# Test-Driven Development (TDD)

Use TDD to lock in behavior after a direction is worth keeping.

**Core principle:** test the behavior that decides whether the work is trustworthy, not the implementation details that happen to make it work today.

Prototype to learn.
TDD to keep.

## When to Use

Use this skill when:
- a prototype or spike proved the direction is worth keeping
- the next task is bounded enough to describe expected behavior clearly
- you need regression protection before expanding the feature
- the main risk is incorrect behavior, not product uncertainty

Do NOT use this skill when:
- the engine or toolchain is still unfamiliar
- the core loop is not stable yet
- the work is mainly a reversible experiment
- you are still asking "does this work at all?" or "does this feel right?"

Use `prototyping` first for those.

## The Rule

```
NO PRODUCTION CODE WITHOUT A FAILING BEHAVIOR TEST FIRST
```

If you already wrote spike code, do not treat it as trusted implementation.
Either delete it, or quarantine it and re-implement from tests once the direction is chosen.

## Starting Pattern: 1-3 Tests Only

Start with the smallest test set that proves the slice matters:

1. `happy path`
2. `error path 1`
3. `error path 2`

Usually that is enough to define the feature boundary.

Prefer tests that answer:
- what the player or user does
- what the system returns
- what state visibly changes

Prefer:
- end-to-end or slice tests
- real behavior
- names a human can read in 5 seconds

Avoid:
- mocks unless unavoidable
- assertions about internal calls
- tests tied to helper structure or control flow
- giant fixture setup before the behavior is proven

## Red-Green-Refactor

### RED

Write one failing behavior test.
Run it and confirm it fails for the expected reason.

### GREEN

Write the smallest code that makes the test pass.
Do not broaden scope while the slice is still unproven.

### REFACTOR

Clean up only after green.
Keep behavior fixed.

### EXPAND

Add the second or third path only if it protects a real branch of behavior.

## Good Test Heuristic

A good first test is one you can explain as:

> "When the player or user does X, the system should do Y."

A bad first test is one you explain as:

> "This function calls helper B, sets field C, and invokes dependency D."

## Example

```typescript
test('happy path: player uses a potion and recovers HP', async () => {
  const game = await startGame({ playerHp: 40, maxHp: 100, potions: 1 });

  const result = await game.useItem('healing_potion');

  expect(result.message).toBe('Recovered 30 HP');
  expect(await game.playerHp()).toBe(70);
  expect(await game.potionCount()).toBe(0);
});

test('error path: cannot use potion when HP is already full', async () => {
  const game = await startGame({ playerHp: 100, maxHp: 100, potions: 1 });

  const result = await game.useItem('healing_potion');

  expect(result.message).toBe('HP is already full');
  expect(await game.playerHp()).toBe(100);
  expect(await game.potionCount()).toBe(1);
});

test('error path: cannot use potion when inventory has none', async () => {
  const game = await startGame({ playerHp: 40, maxHp: 100, potions: 0 });

  const result = await game.useItem('healing_potion');

  expect(result.message).toBe('No healing potion available');
  expect(await game.playerHp()).toBe(40);
});
```

These tests protect the player-visible slice.
They do not care how many helpers exist underneath.

## Dead-End Tests

Red flags:
- the test breaks every time implementation is refactored
- the test mostly checks mocks
- the setup is larger than the behavior under test
- the test proves internal structure, not user-visible outcome
- you already need 8 tests before the feature is even useful

If this happens, zoom back out and rewrite the test at the behavior level.

## Jam Guidance

In jam-style work:
- protect the playable loop first
- test the smallest meaningful slice
- prefer 3 readable behavior tests over 20 brittle unit tests
- only deepen coverage after the loop is stable and worth keeping

## Handoff

- `prototyping` decides whether the direction is worth keeping
- `test-driven-development` locks the kept direction into repeatable behavior
- `formal-designing` is for the point where the stable slice starts changing project boundaries
