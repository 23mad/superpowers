---
name: finishing-a-development-branch
description: Use when implementation is complete and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup
---

# Finishing a Development Branch

## Overview

Guide completion of development work by presenting clear options and handling chosen workflow.

**Core principle:** Verify → Present options → Execute choice → Clean up.

**Announce at start:** "I'm using the finishing-a-development-branch skill to complete this work."

## The Process

### Step 1: Verify Work

**Before presenting options, verify the work is sound:**

Pick verification methods appropriate to the project:
- **Compile check:** Does it build without errors?
- **Runtime check:** Does the changed behavior work correctly in Editor/runtime?
- **Code review:** Does the diff look correct and complete?
- **Regression check:** Are related systems still working?

**If verification fails:** Stop. Fix before proceeding.

**If verification passes:** Continue to Step 2.

### Step 2: Determine Base Branch

```bash
git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null
```

Or ask: "This branch split from main - is that correct?"

### Step 3: Present Options

Present exactly these 4 options:

```
Implementation complete. What would you like to do?

1. Merge back to <base-branch> locally
2. Push and create a Pull Request
3. Keep the branch as-is (I'll handle it later)
4. Discard this work

Which option?
```

### Step 4: Execute Choice

#### Option 1: Merge Locally

```bash
git checkout <base-branch>
git pull
git merge <feature-branch>
# Verify build still works
git branch -d <feature-branch>
```

#### Option 2: Push and Create PR

```bash
git push -u origin <feature-branch>
gh pr create --title "<title>" --body "$(cat <<'EOF'
## Summary
<2-3 bullets of what changed>
EOF
)"
```

#### Option 3: Keep As-Is

Report: "Keeping branch <name>."

#### Option 4: Discard

**Confirm first:**
```
This will permanently delete branch <name> and all commits.
Type 'discard' to confirm.
```

Wait for exact confirmation.

### Step 5: Cleanup Worktree (if applicable)

Check if in worktree and clean up for Options 1, 2, 4:
```bash
git worktree list | grep $(git branch --show-current)
```

## Quick Reference

| Option | Merge | Push | Cleanup Branch |
|--------|-------|------|----------------|
| 1. Merge locally | yes | - | yes |
| 2. Create PR | - | yes | - |
| 3. Keep as-is | - | - | - |
| 4. Discard | - | - | yes (force) |

## Related Skills

- `subagent-driven-development` — may call this after all tasks complete
- `executing-plans` — may call this after all batches complete
- `using-git-worktrees` — cleans up worktree if one was created
