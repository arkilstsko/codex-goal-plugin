# Codex Goal Command

This is a lightweight Codex App plugin that makes `/goal` usable as a skill-based command shim.

It does not patch the Codex App binary or add native UI autocomplete. Instead, it installs a plugin skill that tells Codex how to interpret `/goal` messages and use the built-in goal tools when they are available.

## Install

Clone or download this repository, then run the installer from the repository root.

### Windows

```powershell
.\install.ps1
```

Or run the Codex command directly:

```powershell
codex plugin marketplace add .
```

### macOS / Linux

```bash
bash install.sh
```

Or run the Codex command directly:

```bash
codex plugin marketplace add .
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

## What This Plugin Contains

This plugin is intentionally small. It contains:

- a Codex plugin manifest
- a local marketplace manifest
- one skill: `goal-command`
- install scripts for Windows and macOS/Linux

It does not contain:

- an MCP server
- a native Codex App UI extension
- a patched Codex binary
- a replacement slash-command parser

So yes: the actual behavior is provided by a skill. The plugin is the packaging layer that makes the skill installable and discoverable in Codex.
