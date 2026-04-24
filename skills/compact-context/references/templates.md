# Compact Templates

Use these templates only after `compact-context` has already been triggered.
Pick the artifact type that matches the current phase.

Always name artifacts with:

`YYYY-MM-DD-HHMM-<artifact-type>-<readable-english-title>.md`

## Session Compact

Use when a noisy session is about to move into the next phase of the same task.

```md
# Task
[one sentence describing the immediate goal]

# Constraints
- ...
- ...

# Relevant Files
- `path/to/file`: why it matters next
- `path/to/file`: why it matters next

# Confirmed Findings
- ...
- ...

# Decision
- chosen approach: ...
- avoided approach: ... because ...

# Next Steps
1. ...
2. ...
3. ...

# Open Questions
- ...

# Verification Status
- done: ...
- not yet run: ...
```

## Design Compact

Use when design discussion is finished and only the durable design conclusions should remain.

```md
# Task
[one sentence describing the feature or problem]

# Design Goal
- ...
- ...

# Constraints
- ...
- ...

# Relevant Boundaries
- `module/or/component`: role in the design
- `module/or/component`: role in the design

# Chosen Approach
- ...
- ...

# Rejected Alternatives
- ... because ...
- ... because ...

# Interface Or Data Flow Notes
- ...
- ...

# Execution Implications
1. ...
2. ...
3. ...

# Open Questions
- ...

# Verification Status
- spec agreed: yes/no
- implementation not started / partially started / complete
```

## Execution Compact

Use when implementation is underway and the next worker needs the current coding state without rereading the whole thread.

```md
# Task
[one sentence describing the current implementation target]

# Current Status
- completed: ...
- in progress: ...
- blocked on: ...

# Constraints
- ...
- ...

# Relevant Files
- `path/to/file`: changed or next to change
- `path/to/file`: test or integration point

# Implemented So Far
- ...
- ...

# Remaining Work
1. ...
2. ...
3. ...

# Risks Or Watchpoints
- ...
- ...

# Verification Status
- passing: ...
- failing: ...
- not yet run: ...
```

## Resume Brief

Use when preparing a fresh-session handoff for later continuation.

```md
# Task
[one sentence describing what the next session must continue]

# Current Goal
- ...

# Constraints
- ...
- ...

# Relevant Files
- `path/to/file`: why it matters
- `path/to/file`: why it matters

# What Was Established
- ...
- ...

# Current State
- completed: ...
- pending: ...
- unresolved: ...

# Immediate Next Steps
1. ...
2. ...
3. ...

# Open Questions
- ...

# Verification Status
- done: ...
- pending: ...
```

## Title Guidance

Good titles describe the immediate work focus:

- `auth-token-refresh`
- `enemy-spawn-tuning`
- `inventory-stack-refactor`
- `combat-target-selection`

Avoid vague titles:

- `update`
- `notes`
- `misc`
- `progress`
- `work`
