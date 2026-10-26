# Architecture & System Design

## Overview
rgon-flash-orchestrator is an Antigravity plugin and skill package pairing Gemini 4 Argon (Lead Architect/Orchestrator) with Gemini 3.8 Flash subagents (Parallel Workhorses) for token economy and high-speed multi-file execution.

## Directory Layout
- skills/argon-flash-orchestration/SKILL.md: Core triage, interface contracts, and anti-rationalization matrix.
- gents/: Pre-configured subagent definitions targeting model: flash:
  - lash-scout.md: Low-cost codebase exploration and symbol reconnaissance.
  - lash-implementer.md: Parallel leaf module implementation based on strict contracts.
  - lash-verifier.md: Test runner and failure-only diagnostic extraction.
- commands/plan-economical.md: Slash command definition for /plan-economical.
- install.sh: Bash installer for Unix-like environments.
- install.ps1: PowerShell installer for Windows environments.
- README.md: Public documentation and usage instructions.
- AGENTS.md: Project-level operational constraints and execution protocol.
- LICENSE: MIT License.

## Subagent Lifecycle & Safety Boundaries
- **Context Isolation:** Subagents run in isolated conversation contexts, returning only verified diffs or structured failure logs to the architect.
- **Fail-Fast Boundary:** If a subagent encounters ambiguous specifications or syntax errors, execution halts early to prevent context drift.
- **Result Synthesis:** The lead architect validates output integrity against defined interface contracts before committing changes.