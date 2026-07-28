# skills-vault

<p align="center">
  <img src="https://skillicons.dev/icons?i=nodejs,npm,linux,windows,apple,bash,powershell,github" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-active-brightgreen?style=for-the-badge" />
  <img src="https://img.shields.io/badge/skills-53%2B-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/license-see%20upstream-lightgrey?style=for-the-badge" />
  <img src="https://img.shields.io/badge/maintained-yes-success?style=for-the-badge" />
  <img src="https://img.shields.io/github/last-commit/vizartid/skills-vault?style=for-the-badge" />
  <img src="https://img.shields.io/github/stars/vizartid/skills-vault?style=for-the-badge" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude%20Code-D97757?style=flat-square&logo=anthropic&logoColor=white" />
  <img src="https://img.shields.io/badge/OpenCode-000000?style=flat-square" />
  <img src="https://img.shields.io/badge/Antigravity-4285F4?style=flat-square" />
  <img src="https://img.shields.io/badge/Cursor-000000?style=flat-square" />
  <img src="https://img.shields.io/badge/Codex-412991?style=flat-square&logo=openai&logoColor=white" />
</p>

> A curated, continuously-updated vault of **Claude Skills** and general agent skills — organized by category, with a single script to install all of them globally in one shot.

**Tags:** `claude-skills` `claude-code` `ai-agents` `agent-skills` `mcp` `productivity` `automation` `opencode` `cursor` `codex` `antigravity` `awesome-list` `dev-tools` `installer`

---

## What is this?

`skills-vault` does **not** vendor skill contents itself. It tracks a hand-picked list of **official upstream GitHub repositories** that publish Claude/agent skills, groups them by category, and ships `install-skills.sh` — one script that installs everything **globally** (user-level) so the skills work across every project and every compatible tool on your machine, not just one.

> This is a living list — new skills get added over time, and categories may be reshuffled as the collection grows.

---

## Requirements

<p>
  <img src="https://skillicons.dev/icons?i=nodejs,npm" />
</p>

- **Node.js** (which ships `npm`/`npx`) — v18 or newer recommended
- An agent/tool that supports Claude Skills: Claude Code, OpenCode, Antigravity, Cursor, Codex, etc.
- Internet access (the script pulls each skill repo via `npx skills add`)

---

## Installation

Skills are installed via the [`skills` CLI](https://www.npmjs.com/package/skills), run through `npx` — no global npm install required.

### 🐧 Linux

<img src="https://skillicons.dev/icons?i=linux,bash" height="28" />

```bash
git clone https://github.com/vizartid/skills-vault.git
cd skills-vault
chmod +x install-skills.sh
./install-skills.sh
```

### 🪟 Windows

<img src="https://skillicons.dev/icons?i=windows,powershell" height="28" />

Windows doesn't run `.sh` files natively. Use one of these:

**Option A — WSL (recommended)**
```powershell
wsl --install                     # if WSL isn't installed yet, then restart
wsl
git clone https://github.com/vizartid/skills-vault.git
cd skills-vault
chmod +x install-skills.sh
./install-skills.sh
```

**Option B — Git Bash**
```bash
git clone https://github.com/vizartid/skills-vault.git
cd skills-vault
bash install-skills.sh
```

**Option C — PowerShell (no bash at all)**
Run each install line manually, since `npx` itself works fine on native Windows:
```powershell
npx skills add anthropics/skills -g -y
npx skills add vercel-labs/skills -g -y
# ...repeat for each repo listed in the Categories section below
```

### 🍎 macOS

<img src="https://skillicons.dev/icons?i=apple,bash" height="28" />

```bash
git clone https://github.com/vizartid/skills-vault.git
cd skills-vault
chmod +x install-skills.sh
./install-skills.sh
```

> If `npx` isn't found, install Node.js first via `brew install node` (or from [nodejs.org](https://nodejs.org)).

---

## How it works

- **Global install (`-g`)**: skills install at the **user level** (typically `~/.skills` or `~/.agents/skills`, depending on CLI version), not inside one project — so they're available everywhere.
- **Skills aren't "always on"**: once installed, your tool invokes them either:
  - **Automatically (model-invoked)** — triggered when the skill's description matches your prompt, or
  - **Manually (user-invoked)** — typed directly, e.g. `/caveman-review`, `/grill-me` (depends on the skill and tool).
- **Agent targeting**: `-a/--agent` is left empty by default so the CLI detects/asks interactively which agent is installed. Edit `AGENT_FLAGS` in the script to target one directly, e.g. `-a claude-code cursor codex`.
- **No sudo needed** — everything installs into your regular user home directory.
- Check what's installed anytime:
  ```bash
  npx skills list -g
  ```

---

## Categories

### 1. Core / Official
| Repo | Link |
|---|---|
| anthropics/skills | https://github.com/anthropics/skills |

### 2. Agents & Meta / Productivity
| Repo | Link |
|---|---|
| mksglu/context-mode | https://github.com/mksglu/context-mode |
| vercel-labs/skills | https://github.com/vercel-labs/skills |
| vercel-labs/agent-browser | https://github.com/vercel-labs/agent-browser |
| garrytan/gstack | https://github.com/garrytan/gstack |
| intellectronica/agent-skills | https://github.com/intellectronica/agent-skills |
| juliusbrussee/caveman | https://github.com/juliusbrussee/caveman |
| dietrichgebert/ponytail | https://github.com/dietrichgebert/ponytail |
| Leonxlnx/taste-skill | https://github.com/Leonxlnx/taste-skill |

### 3. Code & Dev
| Repo | Link |
|---|---|
| addyosmani/agent-skills | https://github.com/addyosmani/agent-skills |
| mattpocock/skills | https://github.com/mattpocock/skills |
| vercel-labs/agent-skills | https://github.com/vercel-labs/agent-skills |
| supabase/agent-skills | https://github.com/supabase/agent-skills |
| xixu-me/skills | https://github.com/xixu-me/skills |
| vercel-labs/next-skills | https://github.com/vercel-labs/next-skills |
| firebase/agent-skills | https://github.com/firebase/agent-skills |
| stripe/ai | https://github.com/stripe/ai |
| neondatabase/agent-skills | https://github.com/neondatabase/agent-skills |
| antfu/skills | https://github.com/antfu/skills |

### 4. Science & Research
| Repo | Link |
|---|---|
| K-Dense-AI/scientific-agent-skills | https://github.com/K-Dense-AI/scientific-agent-skills |
| lllllllama/ai-paper-reproduction-skill | https://github.com/lllllllama/ai-paper-reproduction-skill |

### 5. Design & UI
| Repo | Link |
|---|---|
| nextlevelbuilder/ui-ux-pro-max-skill | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill |
| sleekdotdesign/agent-skills | https://github.com/sleekdotdesign/agent-skills |
| shadcn/ui | https://github.com/shadcn/ui |
| arvindrk/extract-design-system | https://github.com/arvindrk/extract-design-system |
| emilkowalski/skill | https://github.com/emilkowalski/skill |

### 6. Media & Creative
| Repo | Link |
|---|---|
| nutlope/hallmark | https://github.com/nutlope/hallmark |
| pbakaus/impeccable | https://github.com/pbakaus/impeccable |
| remotion-dev/skills | https://github.com/remotion-dev/skills |
| agentspace-so/runcomfy-agent-skills | https://github.com/agentspace-so/runcomfy-agent-skills |
| heygen-com/hyperframes | https://github.com/heygen-com/hyperframes |
| google-labs-code/stitch-skills | https://github.com/google-labs-code/stitch-skills |
| alchaincyf/huashu-design | https://github.com/alchaincyf/huashu-design |
| jimliu/baoyu-skills | https://github.com/jimliu/baoyu-skills |
| greensock/gsap-skills | https://github.com/greensock/gsap-skills |

### 7. Marketing, SEO & Growth
| Repo | Link |
|---|---|
| scrapegraphai/just-scrape | https://github.com/scrapegraphai/just-scrape |
| coreyhaines31/marketingskills | https://github.com/coreyhaines31/marketingskills |
| addyosmani/web-quality-skills | https://github.com/addyosmani/web-quality-skills |
| aaron-he-zhu/seo-geo-claude-skills | https://github.com/aaron-he-zhu/seo-geo-claude-skills |
| tavily-ai/skills | https://github.com/tavily-ai/skills |
| charlie947/social-media-skills | https://github.com/charlie947/social-media-skills |

---

## Adding a new skill

When adding a new repo to `install-skills.sh`:

1. Pick the closest matching category above (or propose a new one if none fit).
2. Add an `install_repo "owner/repo"` line under that category's section in the script.
3. Add a corresponding row to the matching table in this README with the official GitHub link.
4. If you only want a single skill from a large repo instead of all of them, use `install_skill "owner/repo" "skill-name"` instead of `install_repo`.

---

## License

This repository only aggregates references and an install script; each linked repository is governed by its own upstream license. Check the respective repo before redistributing its skill contents.
