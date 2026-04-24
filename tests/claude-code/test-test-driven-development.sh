#!/usr/bin/env bash
# Test: test-driven-development skill
# Verifies the skill emphasizes behavior-level TDD after prototyping stabilizes
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/test-helpers.sh"

echo "=== Test: test-driven-development skill ==="
echo ""

# Test 1: skill is recognized and framed as bounded implementation after prototyping
echo "Test 1: skill loading..."

output=$(run_claude "What is the test-driven-development skill? Describe when to use it." 30)

if assert_contains "$output" "test-driven-development\|Test-Driven Development\|TDD" "TDD skill is recognized"; then
    :
else
    exit 1
fi

if assert_contains "$output" "prototype.*stabilized\|bounded implementation\|behavior-level tests\|regression protection" "TDD is framed as post-prototype bounded work"; then
    :
else
    exit 1
fi

echo ""

# Test 2: starts with the 1-3 behavior-path pattern
echo "Test 2: behavior-path pattern..."

output=$(run_claude "In the test-driven-development skill, what is the recommended first test set?" 30)

if assert_contains "$output" "1-3 tests\|one to three tests\|3 tests" "TDD recommends a small starting test set"; then
    :
else
    exit 1
fi

if assert_contains "$output" "happy path" "TDD includes happy path"; then
    :
else
    exit 1
fi

if assert_contains "$output" "error path\|error scenario" "TDD includes error paths"; then
    :
else
    exit 1
fi

echo ""

# Test 3: warns against implementation-bound dead-end tests
echo "Test 3: dead-end test avoidance..."

output=$(run_claude "What kind of tests does the test-driven-development skill warn against?" 30)

if assert_contains "$output" "implementation details\|internal calls\|helper structure\|control flow" "TDD warns against implementation-bound tests"; then
    :
else
    exit 1
fi

if assert_contains "$output" "mocks" "TDD warns about overusing mocks"; then
    :
else
    exit 1
fi

echo ""

# Test 4: points exploratory work back to prototyping
echo "Test 4: prototyping handoff..."

output=$(run_claude "If I am still learning a new engine and mainly need to find out whether a gameplay idea works at all, should I use test-driven-development first?" 30)

if assert_contains "$output" "prototyping" "exploratory work is redirected to prototyping"; then
    :
else
    exit 1
fi

if assert_not_contains "$output" "test-driven-development.*first\|TDD.*first" "does not force TDD before exploratory work stabilizes"; then
    :
else
    exit 1
fi

echo ""

echo "=== All test-driven-development skill tests passed ==="
