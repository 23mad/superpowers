---
name: verification-before-completion
description: Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always
---

# Verification Before Completion

## Overview

Claiming work is complete without verification is dishonesty, not efficiency.

**Core principle:** Evidence before claims, always.

## The Iron Law

```
NO COMPLETION CLAIMS WITHOUT FRESH VERIFICATION EVIDENCE
```

If you haven't run verification in this message, you cannot claim it passes.

## The Gate Function

```
BEFORE claiming any status:

1. IDENTIFY: What proves this claim? (compile, runtime, log, diff)
2. RUN: Execute the verification (fresh, complete)
3. READ: Full output, check exit code or result
4. VERIFY: Does output confirm the claim?
   - If NO: State actual status with evidence
   - If YES: State claim WITH evidence
5. ONLY THEN: Make the claim
```

## Verification Methods

Pick what fits the project and change:

| Method | When to use | Example |
|--------|-------------|---------|
| **Compile check** | Any code change | `dotnet build`, Unity Editor compile, `go build ./...` |
| **Runtime check** | Behavior changes | Run the game, trigger the specific scenario |
| **Log check** | Internal logic changes | Add temporary log, run, confirm output |
| **Diff review** | Small targeted fixes | Inspect the diff, confirm it matches intent |
| **Linter/static analysis** | Style or pattern changes | ReadLints, `go vet` |
| **Automated test** | If test infra is reliable | Run specific test command |

**Not every change needs every method.** Match verification to what you changed.

## Common Failures

| Claim | Requires | Not Sufficient |
|-------|----------|----------------|
| Code compiles | Build command output: 0 errors | "Should compile" |
| Bug fixed | Reproduce original symptom: gone | Code changed, assumed fixed |
| Feature works | Runtime or log evidence | "Looks correct" |
| Requirements met | Line-by-line checklist | Compilation passing |
| Agent completed | VCS diff shows correct changes | Agent reports "success" |

## Red Flags - STOP

- Using "should", "probably", "seems to"
- Expressing satisfaction before verification ("Great!", "Done!")
- About to commit/push/PR without verification
- Trusting agent success reports
- Relying on partial verification
- **ANY wording implying success without having run verification**

## Key Patterns

**Compile:**
```
✅ [Run build] [See: 0 errors] "Build passes"
❌ "Should compile now" / "Looks correct"
```

**Behavior:**
```
✅ [Run game/scenario] [See: expected behavior] "Verified working"
❌ "Code looks right so it should work"
```

**Bug fix:**
```
✅ [Reproduce original bug steps] [See: bug gone] "Fix verified"
❌ "Changed the code, should be fixed"
```

**Requirements:**
```
✅ Re-read plan → Create checklist → Verify each → Report gaps or completion
❌ "Code compiles, phase complete"
```

**Agent delegation:**
```
✅ Agent reports success → Check VCS diff → Verify changes → Report actual state
❌ Trust agent report
```

## Rationalization Prevention

| Excuse | Reality |
|--------|---------|
| "Should work now" | RUN the verification |
| "I'm confident" | Confidence ≠ evidence |
| "Just this once" | No exceptions |
| "Linter passed" | Linter ≠ compiler ≠ runtime |
| "Agent said success" | Verify independently |
| "Partial check is enough" | Partial proves nothing |

## The Bottom Line

**No shortcuts for verification.**

Run the command. Read the output. THEN claim the result.
