---
name: plan-economical
description: Decompose a task into a cost-optimized Tier 1 (Gemini 4 Argon) and Tier 2 (Gemini 3.8 Flash Subagents) execution plan before writing code.
---

Analyze the user's request using the `argon-flash-orchestration` skill and follow these steps strictly:

1. **Reconnaissance (Optional):** If you need codebase context before planning, dispatch `flash-scout` (`model: flash`) to gather file paths and signatures. Do not read more than 3 files directly in the main thread.
2. **Execution Matrix:** Present a Markdown table dividing the work into:
   - **Tier 1 (Argon - Architect):** Core interfaces, complex logic, security, and final review.
   - **Tier 2 (Flash - Workhorses):** Parallelizable leaf modules, boilerplate, migrations, and unit tests.
3. **Interface Contracts:** Draft the exact interfaces, types, or function signatures that Tier 2 subagents will depend on.
4. **Confirmation Gate:** Ask the user to approve the plan (or proceed automatically if autonomous execution was requested) before spawning `flash-implementer` subagents.
