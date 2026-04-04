# homebrew-tap

Homebrew tap for macOS apps by [Albert Garcia Diaz](https://github.com/albertgd).

## Install

```bash
brew tap albertgd/tap
```

---

## Apps

### fcc — Free Claude Code

An AI coding assistant for the terminal. Works like Claude Code but uses **Groq** (free), **OpenAI**, or **Gemini** as the AI backend.

**Source:** [albertgd/free-claude-code](https://github.com/albertgd/free-claude-code)

```bash
brew install fcc
fcc --setup   # configure your API key (Groq is free at console.groq.com)
fcc           # start coding
```

| Provider | Model | Cost |
|----------|-------|------|
| Groq (default) | Llama 3.3 70B | Free |
| OpenAI | GPT-4o | Paid |
| Gemini | Gemini 2.0 Flash | Free tier |

---

### EnergyHUD

A floating HUD for macOS that shows which apps and browser tabs are draining your battery in real time. Filters out background daemons and reads active browser tab titles via AppleScript.

**Source:** [albertgd/EnergyHUD](https://github.com/albertgd/EnergyHUD)

```bash
brew install --cask energyhud
```

---

### Markdown for Mac

A clean, native markdown viewer for macOS — syntax highlighting, table of contents sidebar, dark mode, and Finder integration.

**Source:** [albertgd/markdown-for-mac](https://github.com/albertgd/markdown-for-mac)

```bash
brew install --cask markdown-for-mac
```
