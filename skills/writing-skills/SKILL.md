---
name: writing-skills
description: Use when creating new skills, editing existing skills, or verifying skills work before deployment
---

# Writing Skills

## What is a Skill?

A **skill** is a reference guide for proven techniques, patterns, or tools. Skills help future agent instances find and apply effective approaches.

**Skills are:** Reusable techniques, patterns, tools, reference guides
**Skills are NOT:** Narratives about how you solved a problem once

**Personal skills live in agent-specific directories (`~/.claude/skills` for Claude Code, `~/.agents/skills/` for Codex)**

## When to Create a Skill

**Create when:**
- Technique wasn't intuitively obvious
- You'd reference this again across projects
- Pattern applies broadly (not project-specific)

**Don't create for:**
- One-off solutions
- Standard practices well-documented elsewhere
- Project-specific conventions (put in AGENTS.md)

## SKILL.md Structure

**Frontmatter (YAML):**
- Two required fields: `name` and `description`
- `name`: Use letters, numbers, and hyphens only
- `description`: Start with "Use when..." — describe ONLY triggering conditions, NOT the workflow

```markdown
---
name: skill-name
description: Use when [specific triggering conditions and symptoms]
---

# Skill Name

## Overview
Core principle in 1-2 sentences.

## When to Use
Bullet list with symptoms and use cases.
When NOT to use.

## Core Pattern
Before/after or step-by-step.

## Quick Reference
Table or bullets for scanning.

## Common Mistakes
What goes wrong + fixes.
```

## Critical: Description = When to Use, NOT What It Does

Testing revealed that when a description summarizes the skill's workflow, agents may follow the description shortcut instead of reading the full skill content.

```yaml
# BAD: Summarizes workflow
description: Use when executing plans - dispatches subagent per task with code review between tasks

# GOOD: Just triggering conditions
description: Use when executing implementation plans with independent tasks in the current session
```

## Directory Structure

```
skills/
  skill-name/
    SKILL.md              # Main reference (required)
    supporting-file.*     # Only if needed
```

**Separate files for:** Heavy reference (100+ lines), reusable tools/scripts.
**Keep inline:** Principles, concepts, code patterns (< 50 lines).

## Token Efficiency

Skills load into conversation context. Every token counts.

**Target word counts:**
- Frequently-loaded skills: <200 words
- Other skills: <500 words (still be concise)

**Techniques:**
- Reference `--help` instead of documenting all flags
- Cross-reference other skills by name instead of repeating content
- One excellent example beats many mediocre ones
- Choose the most relevant language for examples

## Keyword Coverage for Discovery

Use words agents would search for:
- Error messages, symptoms, synonyms
- Tool names, commands, file types

## Testing

Before deploying a skill, verify it works:
- Run a scenario with the skill loaded — does the agent follow it correctly?
- Check for gaps: are common use cases covered?
- For discipline-enforcing skills: does the agent comply under pressure?

## Deployment Checklist

- [ ] Name uses only letters, numbers, hyphens
- [ ] Description starts with "Use when..." (no workflow summary)
- [ ] Clear overview with core principle
- [ ] Quick reference for scanning
- [ ] Tested with at least one scenario
- [ ] Committed to git
