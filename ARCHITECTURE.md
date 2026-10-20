# Architecture & System Design

## Overview
`argon-flash-orchestrator` is an Antigravity plugin and skill package pairing Gemini 4 Argon (Lead Architect/Orchestrator) with Gemini 3.8 Flash subagents (Parallel Workhorses) for token economy and high-speed multi-file execution.

## Directory Layout
- `skills/argon-flash-orchestration/SKILL.md`: Core triage, interface contracts, and anti-rationalization matrix.
- `agents/`: Pre-configured subagent definitions targeting `model: flash`:
  - `flash-scout.md`: Low-cost codebase exploration and symbol reconnaissance.
  - `flash-implementer.md`: Parallel leaf module implementation based on strict contracts.
  - `flash-verifier.md`: Test runner and failure-only diagnostic extraction.
- `commands/plan-economical.md`: Slash command definition for `/plan-economical`.
- `install.sh`: Bash installer for Unix-like environments.
- `install.ps1`: PowerShell installer for Windows environments.
- `README.md`: Public documentation and usage instructions.
- `AGENTS.md`: Project-level operational constraints and execution protocol.
- `LICENSE`: MIT License.
