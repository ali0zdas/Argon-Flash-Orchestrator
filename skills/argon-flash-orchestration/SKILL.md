---
name: argon-flash-orchestration
description: Cost-optimized multi-agent orchestration pattern pairing Gemini 4 Argon (architect/orchestrator) with Gemini 3.8 Flash subagents (parallel workhorses). Activate on any multi-file implementation, refactoring, codebase exploration, test generation, or when the user asks for an economical/fast execution plan.
---

# Argon + Flash Economical Orchestration Skill

You are running on a frontier reasoning model (**Gemini 4 Argon**). Your thinking and output tokens are high-value resources meant for architecture, complex debugging, security analysis, and final verification—**NOT** for grep sweeps, boilerplate generation, or routine leaf-module edits.

Follow the **Plan (Argon) → Delegate (Flash) → Verify (Argon)** protocol strictly.

---

## Phase 1: Architectural Planning & Task Triage (Argon Only)

Before modifying any files, decompose the user's request into an explicit **Execution Matrix**. Classify every atomic task into one of two tiers:

| Tier | Assigned Model | Criteria | Examples |
| :--- | :--- | :--- | :--- |
| **Tier 1: Critical Core** | `gemini-4-argon` (Self) | High ambiguity, cross-cutting architectural state, security/cryptography, complex race conditions, interface/type contract definitions. | Designing data schemas, auth logic, complex algorithm core, reviewing diffs. |
| **Tier 2: Delegated Workhorse** | `gemini-3.8-flash` (Subagent) | Well-scoped, deterministic, parallelizable, low ambiguity once interfaces are defined, or read-only exploration. | Codebase scouting, writing unit/boilerplate tests, CRUD endpoints, UI styling tweaks, docstrings, lint fixing. |

**Gate 1:** Present the Execution Matrix to the user (or lock it in your plan) before writing implementation code. Define strict TypeScript/Python/C# interfaces or function signatures FIRST so Flash subagents have zero ambiguity.

---

## Phase 2: Parallel Subagent Delegation (Flash Workhorses)

Invoke specialized Flash subagents (`invoke_subagent`) concurrently for all **Tier 2** tasks. Never pass vague prompts to a Flash subagent. Always pass a **Strict Subagent Brief**:

```text
[SUBAGENT BRIEF]
1. OBJECTIVE: <Single, measurable goal>
2. TARGET FILES: <Exact file paths to read or modify>
3. INTERFACE CONTRACT: <Exact types, signatures, or schemas defined by Argon>
4. CONSTRAINTS: Do NOT modify files outside TARGET FILES. Do NOT alter public interfaces.
5. VERIFICATION COMMAND: <Command to run before returning, e.g., pytest tests/test_module.py>
```

### Recommended Subagent Roles:

* **`flash-scout`**: Dispatch first when you need to map out imports, find usages, or summarize large directories without polluting Argon's 1M context window.
* **`flash-implementer`**: Dispatch in parallel across independent leaf modules after you have written the core interfaces/types.
* **`flash-verifier`**: Dispatch to run test suites, linters, or build scripts and return only a concise summary of failures.

---

## Phase 3: Synthesis & Verification Gate (Argon Review)

When Flash subagents return their results:

1. **Inspect Diffs:** Review the changes made by Flash subagents against your original Interface Contract.
2. **Handle Edge Cases:** If a Flash subagent fails twice on a complex logic bug, **stop delegating that specific bug** and resolve the root cause yourself using Argon's deep reasoning.
3. **Final Verification:** Ensure all tests and build checks pass before marking the task complete.

---

## Anti-Rationalization Table (No Shortcuts)

Agents frequently invent excuses to skip subagent delegation and do everything inline. Every excuse below is invalid:

| Common Agent Excuse | Why It Fails | Required Action |
| --- | --- | --- |
| *"It's faster if I just write these 4 test files myself right now."* | Sequential generation on Argon costs 5-10x more and is slower than parallel Flash subagents. | Spawn `flash-implementer` subagents in parallel. |
| *"I'll quickly read 15 files to find where this function is used."* | Raw file dumps bloat the primary context window and increase token spend on every subsequent turn. | Dispatch `flash-scout` to search and return only the exact file paths and line numbers. |
| *"The subagent might make a mistake on this component."* | Subagents only fail when given vague instructions. | Write the interface/types first, then hand the implementation to `flash-implementer` with a strict contract. |
| *"This is a small task, no need to classify tiers."* | Small tasks compound across a session. Unless it is a single-block edit under 30 lines, triage it. | Apply the Tier 1 / Tier 2 split. |
