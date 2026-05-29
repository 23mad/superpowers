---
name: compact-context
description: Use when a coding session has become noisy, when switching phases such as investigation to implementation, when finishing a subtask and preparing the next one, or when preparing a handoff or fresh-session resume brief.
---

# Compact Context

Announce at start: "I'm using the compact-context skill to produce a clean working brief."

## Goal

Turn a large amount of session history into the minimum context needed for the next stage of work.

Preserve decisions, constraints, relevant files, current status, and next actions.
Drop search noise, duplicate discussion, abandoned branches, and verbose reasoning.

This skill is for compressing active work context.
It does not replace formal design work from `designing`, implementation planning from `writing-plans`, or long-term knowledge capture in memory systems.

## Use This Skill When

Use this skill when one or more of these are true:

- investigation is complete and implementation is about to start
- a design or planning phase has ended and execution is next
- a subtask is finished and the next subtask needs a fresh working set
- the session contains a large amount of search, exploration, or discarded paths
- work needs to be handed off to a new session or another agent
- the current thread feels noisy, repetitive, or starts losing constraints

## Do Not Use This Skill When

Do not use this skill when:

- the task has just started and the problem is still unclear
- key constraints or architecture decisions are still unknown
- the session is already short and clean
- the user actually needs a formal spec or implementation plan instead

## Choose The Artifact Type

Pick exactly one artifact type before writing:

- `session-compact`: general phase transition inside the same task
- `design-compact`: compress design conclusions after discussion, option analysis, or spec work
- `execution-compact`: compress current implementation state during active coding
- `resume-brief`: prepare a fresh-session or handoff artifact for later continuation

## Artifact Naming

Every compact artifact must use this filename format:

`YYYY-MM-DD-HHMM-<artifact-type>-<readable-english-title>.md`

Rules:

- use local current time at the moment the artifact is created
- use lowercase English only for the title
- convert the title to kebab-case
- keep the title specific and readable, usually 3 to 8 words
- reflect the immediate work focus, not the whole project
- do not use spaces, underscores, or colons
- do not use vague titles such as `update`, `notes`, `misc`, or `progress`

Artifact type must be one of:

- `session-compact`
- `design-compact`
- `execution-compact`
- `resume-brief`

Good examples:

- `2026-04-24-1030-session-compact-auth-token-refresh.md`
- `2026-04-24-1145-execution-compact-inventory-stack-refactor.md`
- `2026-04-24-1305-resume-brief-combat-target-selection.md`

Bad examples:

- `notes.md`
- `2026-04-24-progress.md`
- `combat-work.md`
- `2026_04_24_resume.md`

## Process

1. Identify the current phase and why compression is needed now.
2. Extract only durable facts needed for the next phase.
3. Separate confirmed decisions from open questions.
4. Keep only the files and modules that matter next.
5. Record next actions in execution order.
6. Remove history that does not affect future work.

## Include

Always include:

- current goal
- constraints
- relevant files
- confirmed findings
- chosen approach
- next steps
- open questions
- verification status

## Exclude

Do not include:

- long search transcripts
- repeated discussion
- discarded options unless their rejection matters later
- verbose reasoning or hidden chain-of-thought
- raw terminal output unless a specific line matters
- broad project history that does not affect the next phase

## Output Rules

Keep the artifact short and actionable.
Prefer concrete statements over narrative.
Write for a fresh agent with no memory of the session.
Assume the artifact may replace a large amount of prior context.

The artifact should make the next action obvious.

Read `references/templates.md` when you need the exact template shape.
Read `references/examples.md` when you need to calibrate output quality.

## Quality Check

Before finishing, verify:

- someone new could resume from this without reading the full history
- every listed file is still relevant
- next steps are executable in order
- the title reflects the immediate work focus
- the filename follows the required timestamp format
- the compact is much smaller than the material it replaces
