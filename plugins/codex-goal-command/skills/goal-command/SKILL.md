---
name: goal-command
description: Use when the user's message starts with /goal, goal:, or asks to create, show, resume, continue, or complete a durable Codex goal in Codex App.
---

# Goal Command

This skill provides a lightweight command shim for Codex App.

## Trigger

When the user's message starts with `/goal` or `goal:`, interpret it as a goal command instead of an ordinary chat message.

Supported forms:

- `/goal <objective>` or `goal: <objective>`: create a durable active goal for the current thread.
- `/goal status`: show the current goal, status, progress, and remaining budget when available.
- `/goal complete`: mark the current goal complete only when the objective is genuinely achieved and no required work remains.
- `/goal help`: briefly show the supported forms.

## Rules

- For a new objective, call the available goal creation tool with the objective text.
- If a goal already exists, show the current goal and ask the user whether to complete it before replacing it.
- Treat references to `ROADMAP.md`, a roadmap, or a Definition of Done as the stop condition.
- Continue working toward an active goal until the roadmap or Definition of Done is complete, unless the user pauses, redirects, or a real blocker is reached.
- Do not mark a goal complete because token budget is low, context was compacted, work paused, or partial progress was made.
- Before marking complete, verify the claimed Definition of Done with the strongest available evidence for the task.
- If goal tools are unavailable in the current environment, explain that the plugin can only provide the command intent and needs Codex App goal tooling enabled.

## Behavior

For `/goal status`:

1. Call the available goal read/status tool.
2. Report whether there is an active goal.
3. If a goal exists, include its objective, status, token/time usage when available, and the next concrete step.

For `/goal complete`:

1. Check the current goal.
2. Verify that all required work is actually complete.
3. Only then call the available goal completion tool.
4. If verification is missing or failing, report the gap and continue working instead of completing.

For `/goal <objective>`:

1. Use the text after `/goal` as the objective.
2. Create the goal with the available goal creation tool.
3. Begin or continue work toward the goal immediately when the request implies execution.

## Help Text

If the user asks for `/goal help`, respond with:

```text
/goal <objective>  Create a durable goal for this thread
/goal status       Show the current goal and progress
/goal complete     Mark the goal complete after verification
```
