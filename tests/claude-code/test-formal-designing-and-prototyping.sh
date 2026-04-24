#!/usr/bin/env bash
# Test: formal-designing and prototyping skills
# Verifies the two skills are distinct and describe the intended workflow boundaries
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/test-helpers.sh"

echo "=== Test: formal-designing and prototyping skills ==="
echo ""

# Test 1: formal-designing can be loaded and emphasizes durable boundary work
echo "Test 1: formal-designing skill loading..."

output=$(run_claude "What is the formal-designing skill? Describe when to use it and what kind of changes it is for." 30)

if assert_contains "$output" "formal-designing\|Formal Designing\|formal designing" "formal-designing is recognized"; then
    :
else
    exit 1
fi

if assert_contains "$output" "cross-cutting\|hard to reverse\|project boundaries\|durable design" "formal-designing describes boundary-sensitive work"; then
    :
else
    exit 1
fi

echo ""

# Test 2: prototyping can be loaded and emphasizes fast reversible experiments
echo "Test 2: prototyping skill loading..."

output=$(run_claude "What is the prototyping skill? Describe when to use it and what its goal is." 30)

if assert_contains "$output" "prototyping\|Prototyping" "prototyping is recognized"; then
    :
else
    exit 1
fi

if assert_contains "$output" "reversible experiment\|fast experiment\|validate.*core loop\|iteration speed" "prototyping describes fast reversible exploration"; then
    :
else
    exit 1
fi

echo ""

# Test 3: prototyping mentions engineering fences and timeboxing
echo "Test 3: prototyping guardrails..."

output=$(run_claude "In the prototyping skill, what should be written down before coding starts?" 30)

if assert_contains "$output" "hypothesis" "prototyping includes hypothesis"; then
    :
else
    exit 1
fi

if assert_contains "$output" "engineering fences\|fences\|invariants" "prototyping includes engineering fences"; then
    :
else
    exit 1
fi

if assert_contains "$output" "timebox\|exit rule\|success signal" "prototyping includes experiment controls"; then
    :
else
    exit 1
fi

echo ""

# Test 4: formal-designing should point to formal docs / plans, prototyping should not over-formalize
echo "Test 4: workflow separation..."

output=$(run_claude "Should a reversible unfamiliar-engine gameplay experiment use formal-designing or prototyping? Why?" 30)

if assert_contains "$output" "prototyping" "reversible experiment chooses prototyping"; then
    :
else
    exit 1
fi

if assert_not_contains "$output" "formal-designing.*first\|formal design.*first" "does not over-formalize reversible experiment"; then
    :
else
    exit 1
fi

echo ""

# Test 5: formal-designing should transition to writing-plans
echo "Test 5: formal-designing handoff..."

output=$(run_claude "After formal-designing finishes and the user approves, what skill comes next?" 30)

if assert_contains "$output" "writing-plans\|writing plans" "formal-designing hands off to writing-plans"; then
    :
else
    exit 1
fi

echo ""

echo "=== All formal-designing and prototyping skill tests passed ==="
