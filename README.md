# Codex Goal Command

This is a lightweight Codex App plugin that makes `/goal` usable as a skill-based command shim.

It does not patch the Codex App binary or add native UI autocomplete. Instead, it installs a plugin skill that tells Codex how to interpret `/goal` messages and use the built-in goal tools when they are available.

## Install

From PowerShell:

```powershell
codex plugin marketplace add "goal-plugin-marketplace"
```

Restart Codex App after adding the marketplace.

Enable in Plugins - Dropdown menu - Goal Command codex-goal

## Usage

```text
/goal Implement ROADMAP.md until every Definition of Done item passes
/goal status
/goal complete
```

If Codex App blocks unknown slash commands before they reach the agent, use the fallback form:

```text
goal: Implement ROADMAP.md until every Definition of Done item passes
```

## What It Can And Cannot Do

Can:

- Package the `/goal` behavior as an installable Codex plugin.
- Trigger through a plugin skill.
- Use Codex App's internal goal tools when exposed to the agent.
- Keep work aligned to a roadmap or Definition of Done.

Cannot:

- Add native slash-command autocomplete to the closed Codex App UI.
- Patch `app.asar` safely.
- Force goal support if the current Codex build does not expose goal tools.
