---
name: writing-plans
description: Use when you have design decisions or requirements for a multi-step task, before touching code
---

# Writing Plans

## Overview

Write comprehensive implementation plans assuming the engineer has zero context for our codebase. Document everything they need to know: which files to touch for each task, code, docs they might need to check, how to verify it. Give them the whole plan as bite-sized tasks. DRY. YAGNI. Frequent commits.

Assume they are a skilled developer, but know almost nothing about our toolset or problem domain.

**Announce at start:** "I'm using the writing-plans skill to create the implementation plan."

**Context:** For large workspaces or partially tracked repositories, prefer in-place scoped edits for small tasks or a normal Git branch when branch isolation is needed.

**Save plans to:** `docs/superpowers/plans/YYYY-MM-DD-<feature-name>.md`
- (User preferences for plan location override this default)

## Scope Check

If the design covers multiple independent subsystems, suggest breaking this into separate plans — one per subsystem. Each plan should produce working software on its own.

## File Structure

Before defining tasks, map out which files will be created or modified and what each one is responsible for.

- Design units with clear boundaries and well-defined interfaces. Each file should have one clear responsibility.
- Prefer smaller, focused files over large ones that do too much.
- Files that change together should live together. Split by responsibility, not by technical layer.
- In existing codebases, follow established patterns.

## Bite-Sized Task Granularity

**Each step is one action (2-5 minutes):**
- "Implement the change" - step
- "Verify it works" - step
- "Commit" - step

## Plan Document Header

**Every plan MUST start with this header:**

```markdown
# [Feature Name] Implementation Plan

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies/libraries]

---
```

## Task Structure

````markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.cs`
- Modify: `exact/path/to/existing.cs:123-145`

- [ ] **Step 1: Implement the change**

```csharp
// show the actual code
```

- [ ] **Step 2: Verify**

Verification method (pick what fits the project):
- Compile check: `dotnet build` or Unity Editor compile
- Runtime check: run the game and test the specific behavior
- Log check: confirm expected log output appears
- Code review: inspect the diff for correctness

- [ ] **Step 3: Commit**

```bash
git add <files>
git commit -m "feat: add specific feature"
```
````

## No Placeholders

Every step must contain the actual content an engineer needs. These are **plan failures** — never write them:
- "TBD", "TODO", "implement later", "fill in details"
- "Add appropriate error handling" / "add validation" / "handle edge cases"
- "Similar to Task N" (repeat the code — the engineer may be reading tasks out of order)
- Steps that describe what to do without showing how (code blocks required for code steps)
- References to types, functions, or methods not defined in any task

## Remember
- Exact file paths always
- Complete code in every step — if a step changes code, show the code
- Exact commands with expected output
- DRY, YAGNI, frequent commits

## Self-Review

After writing the complete plan, check it against the design decisions from conversation:

**1. Coverage:** Can you point to a task for each requirement? List any gaps.

**2. Placeholder scan:** Search for red flags from the "No Placeholders" section. Fix them.

**3. Type consistency:** Do types, method signatures, and property names match across tasks?

If you find issues, fix them inline. If you find a spec requirement with no task, add the task.

## Execution Handoff

After saving the plan, ask the user how they want to proceed:
- Execute tasks in this session
- Dispatch subagents per task (if platform supports it)
- Keep the plan for manual execution
