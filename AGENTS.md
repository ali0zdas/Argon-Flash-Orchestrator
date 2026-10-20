# AGENTS.md — Economical Argon + Flash Orchestration Rules

When operating in this workspace with **Gemini 4 Argon** (`gemini-4-argon`) as the primary model, you MUST optimize token economy and execution speed by pairing your reasoning with **Gemini 3.8 Flash** (`model: flash`) subagents.

## 1. Mandatory Triage Protocol
Never execute large searches, boilerplate generation, or multi-file mechanical edits directly on Gemini 4 Argon. Before starting any task touching more than 1 file, divide the work:

- **Tier 1 (`gemini-4-argon` - Self):** System architecture, interface/type contracts, security-critical logic, complex concurrency/state debugging, and final code review.
- **Tier 2 (`gemini-3.8-flash` - Subagents):** Codebase exploration (`flash-scout`), isolated module implementation & unit tests (`flash-implementer`), and test/lint execution (`flash-verifier`).

## 2. Context Hygiene
- Do NOT dump raw contents of 5+ files into the primary context window just to locate a symbol. Dispatch `flash-scout` and ask for a concise (<400 words) summary of paths, line numbers, and type signatures.
- Do NOT run verbose test suites directly in the main thread if output exceeds 100 lines. Dispatch `flash-verifier` to run the suite and report only failing assertions.

## 3. Contract-First Delegation
Before invoking `flash-implementer`, always define the exact data structures, function signatures, or interfaces first. Pass a strict `[SUBAGENT BRIEF]` containing:
1. `OBJECTIVE`
2. `TARGET FILES`
3. `INTERFACE CONTRACT`
4. `CONSTRAINTS`
5. `VERIFICATION COMMAND`

## 4. Escalation Rule
If a `flash-implementer` subagent fails twice on the same logic error, halt delegation for that file and resolve the root cause directly using Gemini 4 Argon (`thinking_level="high"`).
