# skills-vault

![](https://skillicons.dev/icons?i=nodejs,npm,linux,windows,apple,bash,powershell,github)

![](https://img.shields.io/badge/status-active-brightgreen?style=for-the-badge) [![](https://img.shields.io/badge/skills-53%2B-blue?style=for-the-badge)]() [![](https://img.shields.io/badge/license-see%20upstream-lightgrey?style=for-the-badge)]() [![](https://img.shields.io/badge/maintained-yes-success?style=for-the-badge)]() [![](https://img.shields.io/github/last-commit/vizartid/skills-vault?style=for-the-badge)]() [![](https://img.shields.io/github/stars/vizartid/skills-vault?style=for-the-badge)]()

![](https://img.shields.io/badge/Claude%20Code-D97757?style=flat-square&logo=anthropic&logoColor=white) ![](https://img.shields.io/badge/OpenCode-000000?style=flat-square) ![](https://img.shields.io/badge/Antigravity-4285F4?style=flat-square) ![](https://img.shields.io/badge/Cursor-000000?style=flat-square) ![](https://img.shields.io/badge/Codex-412991?style=flat-square&logo=openai&logoColor=white)

> A curated, continuously-updated vault of **Claude Skills** and general agent skills — organized by category, with a single script to install all of them globally in one shot.

**Tags:** `claude-skills` `claude-code` `ai-agents` `agent-skills` `mcp` `productivity` `automation` `opencode` `cursor` `codex` `antigravity` `awesome-list` `dev-tools` `installer`

---

## What is this?

`skills-vault` does **not** vendor skill contents itself. It tracks a hand-picked list of **official upstream GitHub repositories** that publish Claude/agent skills, groups them by category, and ships `install-skills.sh` — one script that installs everything **globally** (user-level) so the skills work across every project and every compatible tool on your machine, not just one.

> This is a living list — new skills get added over time, and categories may be reshuffled as the collection grows.

---

## Requirements

![](https://skillicons.dev/icons?i=nodejs,npm)

- **Node.js** (which ships `npm`/`npx`) — v18 or newer recommended
- An agent/tool that supports Claude Skills: Claude Code, OpenCode, Antigravity, Cursor, Codex, etc.
- Internet access (the script pulls each skill repo via `npx skills add`)

---

## Installation

> ⚠️ **Catatan soal `install-skills.sh` di paket ini:** file ini disusun ulang mengikuti pola `install_repo "owner/repo"` yang dijelaskan di bagian "Adding a new skill" README kamu, karena isi persis file aslinya di repo tidak bisa diambil langsung saat proses ini. **Bandingkan dengan file asli di repo kamu sebelum di-commit**, supaya custom logic/flag yang mungkin sudah kamu tulis di sana tidak tertimpa.

Skills are installed via the [`skills` CLI](https://www.npmjs.com/package/skills), run through `npx` — no global npm install required.

### 🐧 Linux

![](https://skillicons.dev/icons?i=linux,bash)

```
git clone https://github.com/vizartid/skills-vault.git
cd skills-vault
chmod +x install-skills.sh
./install-skills.sh
```

### 🪟 Windows

![](https://skillicons.dev/icons?i=windows,powershell)

Windows doesn't run `.sh` files natively. Use one of these:

**Option A — WSL (recommended)**

```
wsl --install                     # if WSL isn't installed yet, then restart
wsl
git clone https://github.com/vizartid/skills-vault.git
cd skills-vault
chmod +x install-skills.sh
./install-skills.sh
```

**Option B — Git Bash**

```
git clone https://github.com/vizartid/skills-vault.git
cd skills-vault
bash install-skills.sh
```

**Option C — PowerShell (no bash at all)**
Run each install line manually, since `npx` itself works fine on native Windows:

```
npx skills add anthropics/skills -g -y
npx skills add vercel-labs/skills -g -y
# ...repeat for each repo listed in the Categories section below
```

### 🍎 macOS

![](https://skillicons.dev/icons?i=apple,bash)

```
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

```
npx skills list -g
```

---

## Categories

### 1. Core / Official

| Repo | Link |
|---|---|
| anthropics/skills | <https://github.com/anthropics/skills> |

### 2. Agents & Meta / Productivity

| Repo | Link |
|---|---|
| mksglu/context-mode | <https://github.com/mksglu/context-mode> |
| vercel-labs/skills | <https://github.com/vercel-labs/skills> |
| vercel-labs/agent-browser | <https://github.com/vercel-labs/agent-browser> |
| garrytan/gstack | <https://github.com/garrytan/gstack> |
| intellectronica/agent-skills | <https://github.com/intellectronica/agent-skills> |
| juliusbrussee/caveman | <https://github.com/juliusbrussee/caveman> |
| dietrichgebert/ponytail | <https://github.com/dietrichgebert/ponytail> |
| Leonxlnx/taste-skill | <https://github.com/Leonxlnx/taste-skill> |
| obra/superpowers **🆕** | <https://github.com/obra/superpowers> |

### 3. Code & Dev

| Repo | Link |
|---|---|
| addyosmani/agent-skills | <https://github.com/addyosmani/agent-skills> |
| mattpocock/skills | <https://github.com/mattpocock/skills> |
| vercel-labs/agent-skills | <https://github.com/vercel-labs/agent-skills> |
| supabase/agent-skills | <https://github.com/supabase/agent-skills> |
| xixu-me/skills | <https://github.com/xixu-me/skills> |
| vercel-labs/next-skills | <https://github.com/vercel-labs/next-skills> |
| firebase/agent-skills | <https://github.com/firebase/agent-skills> |
| stripe/ai | <https://github.com/stripe/ai> |
| neondatabase/agent-skills | <https://github.com/neondatabase/agent-skills> |
| antfu/skills | <https://github.com/antfu/skills> |
| wshobson/agents **🆕** | <https://github.com/wshobson/agents> |
| yamadashy/repomix **🆕** | <https://github.com/yamadashy/repomix> |
| CloudAI-X/threejs-skills **🆕** | <https://github.com/CloudAI-X/threejs-skills> |

### 4. Science & Research

| Repo | Link |
|---|---|
| K-Dense-AI/scientific-agent-skills | <https://github.com/K-Dense-AI/scientific-agent-skills> |
| lllllllama/ai-paper-reproduction-skill | <https://github.com/lllllllama/ai-paper-reproduction-skill> |

### 5. Design & UI

| Repo | Link |
|---|---|
| nextlevelbuilder/ui-ux-pro-max-skill | <https://github.com/nextlevelbuilder/ui-ux-pro-max-skill> |
| sleekdotdesign/agent-skills | <https://github.com/sleekdotdesign/agent-skills> |
| shadcn/ui *(link diperbaiki → repo aktualnya `shadcn-ui/ui`)* | <https://github.com/shadcn-ui/ui> |
| arvindrk/extract-design-system | <https://github.com/arvindrk/extract-design-system> |
| emilkowalski/skill | <https://github.com/emilkowalski/skill> |
| emilkowalski/skills **🆕** | <https://github.com/emilkowalski/skills> |
| figma/mcp-server-guide **🆕** | <https://github.com/figma/mcp-server-guide> |

### 6. Media & Creative

| Repo | Link |
|---|---|
| nutlope/hallmark | <https://github.com/nutlope/hallmark> |
| pbakaus/impeccable | <https://github.com/pbakaus/impeccable> |
| remotion-dev/skills | <https://github.com/remotion-dev/skills> |
| agentspace-so/runcomfy-agent-skills | <https://github.com/agentspace-so/runcomfy-agent-skills> |
| heygen-com/hyperframes | <https://github.com/heygen-com/hyperframes> |
| google-labs-code/stitch-skills | <https://github.com/google-labs-code/stitch-skills> |
| alchaincyf/huashu-design | <https://github.com/alchaincyf/huashu-design> |
| jimliu/baoyu-skills | <https://github.com/jimliu/baoyu-skills> |
| greensock/gsap-skills | <https://github.com/greensock/gsap-skills> |

### 7. Marketing, SEO & Growth

| Repo | Link |
|---|---|
| scrapegraphai/just-scrape | <https://github.com/scrapegraphai/just-scrape> |
| coreyhaines31/marketingskills | <https://github.com/coreyhaines31/marketingskills> |
| addyosmani/web-quality-skills | <https://github.com/addyosmani/web-quality-skills> |
| aaron-he-zhu/seo-geo-claude-skills | <https://github.com/aaron-he-zhu/seo-geo-claude-skills> |
| tavily-ai/skills | <https://github.com/tavily-ai/skills> |
| charlie947/social-media-skills | <https://github.com/charlie947/social-media-skills> |
| AgriciDaniel/claude-seo **🆕** | <https://github.com/AgriciDaniel/claude-seo> |
| blader/humanizer **🆕** | <https://github.com/blader/humanizer> |

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

---

## 📋 Laporan Validasi — 111 Skill Kandidat (skills.sh)

![Confirmed](https://img.shields.io/badge/confirmed%20%E2%89%A51K%20stars-35-success)
![Approx](https://img.shields.io/badge/approksimasi-9-yellow)
![Below 1K](https://img.shields.io/badge/di%20bawah%201K-7-orange)
![Not Found](https://img.shields.io/badge/repo%20tidak%20ditemukan-61-lightgrey)

> Selain 41 repo kurasi manual di atas, tim melakukan riset validasi terhadap **111 skill tambahan** dari katalog skills.sh untuk memastikan kualitas (target minimal 1.000 ⭐ GitHub). Hasil validasinya didokumentasikan di bawah — **8 repo baru yang lolos validasi sudah ditambahkan ke kategori di atas** (ditandai 🆕). Sisanya didokumentasikan di sini sebagai catatan riset, tidak dihapus dari laporan.

**Legenda status:**
- ✅ **Confirmed** — repo GitHub jelas ditemukan, stars terverifikasi ≥1K
- 🟡 **Approx** — repo representasi terdekat ditemukan (nama skill generik/bagian dari paket besar), stars ≥1K tapi keterkaitan tidak 1:1 sempurna
- 🟠 **Below 1K** — repo ditemukan dengan jelas tapi stars di bawah 1.000
- ⚪ **Not Found** — tidak ditemukan repo GitHub tunggal yang representatif; kebanyakan nama konsep generik dari skills.sh yang tidak mengarah ke satu proyek spesifik

<details>
<summary><b>✅🟡 Skill lolos validasi (≥1K stars) — klik untuk lihat detail per kategori</b></summary>


#### UI/UX, Frontend & Design Systems

| Nama Skill (asli) | Repo GitHub | Stars | Status |
|---|---|---|---|
| frontend-design / frontend-design.skill | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |
| impeccable / impaccable | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | 61.1K | ✅ |
| theme-factory / theme factory | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |
| figma-implement | [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide) | 1.9K | ✅ |
| figma-mcp | [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide) | 1.9K | ✅ |
| hi-fi-mockups | [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide) | 1.9K | 🟡 |
| canvas-design / Canvas Design.skill | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |
| shadcn/ui / shadcn-ui | [shadcn-ui/ui](https://github.com/shadcn-ui/ui) | 120.8K | ✅ |
| uiuxpromax | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | 120.6K | ✅ |
| emil-design-eng | [emilkowalski/skills](https://github.com/emilkowalski/skills) | 216.7K | ✅ |

#### Motion, Animation, 3D & Generative Art

| Nama Skill (asli) | Repo GitHub | Stars | Status |
|---|---|---|---|
| taste-skill / taste | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | 59.4K | ✅ |
| animate | [emilkowalski/skills](https://github.com/emilkowalski/skills) | 216.7K | ✅ |
| hyperframes | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | 34.9K | ✅ |
| emil kowalski animation | [emilkowalski/skills](https://github.com/emilkowalski/skills) | 216.7K | 🟡 |
| threejs-skills / three.js skills | [CloudAI-X/threejs-skills](https://github.com/CloudAI-X/threejs-skills) | 2.4K | ✅ |
| gsap-skills / greensock/gsap-skills | [greensock/gsap-skills](https://github.com/greensock/gsap-skills) | 9.2K | ✅ |
| algorithmic-art / Algorithmic Art.skill / Algortimic ART | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |

#### Full-Stack Development, Backend & DevOps

| Nama Skill (asli) | Repo GitHub | Stars | Status |
|---|---|---|---|
| typescript-advanced-types | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| nodejs-backend-patterns | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| nextjs-app-router-patterns / next.js | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| api-design-principles | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| python-performance-optimization | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| python-testing-patterns | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| golang-code-style | [wshobson/agents](https://github.com/wshobson/agents) | 37K | 🟡 |
| golang-testing | [wshobson/agents](https://github.com/wshobson/agents) | 37K | 🟡 |
| rust-async-patterns | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| mattpacko/improve-codebase-architecture | [mattpocock/skills](https://github.com/mattpocock/skills) | 143K | ✅ |
| Stack Integrations (convex, cleark/clerk, posthog) | [wshobson/agents](https://github.com/wshobson/agents) | 37K | 🟡 |
| better-auth-best-practices | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |
| webapp-testing / systematic debugging | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |
| security-review / codereview | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | 🟡 |
| setup-pre-commit / deploy-to-vercel | [obra/superpowers](https://github.com/obra/superpowers) | 85K | 🟡 |
| SQL Queries | [wshobson/agents](https://github.com/wshobson/agents) | 37K | ✅ |

#### System Architecture, Agentic AI & Prompt Engineering

| Nama Skill (asli) | Repo GitHub | Stars | Status |
|---|---|---|---|
| playwright-mcp / agent-browser / dev browser | [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) | 0 | 🟡 |
| mcp-builder / mcp builder | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |
| superpowers.skill / superpower | [obra/superpowers](https://github.com/obra/superpowers) | 85K | ✅ |
| repomix.skill | [yamadashy/repomix](https://github.com/yamadashy/repomix) | 21K | ✅ |
| skillcreator / skill creator / Skill Seekers.skill / find skill | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |
| no-ai-slop | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | 🟡 |
| webartifact builder / web articfact builder / transition.dev | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |

#### Content, Marketing, Social Media & Branding

| Nama Skill (asli) | Repo GitHub | Stars | Status |
|---|---|---|---|
| brandkit / brandkit-sync / brand guildlide | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |
| SEO Audit / Programmatic SEO / AI SEO / claude-seo / GEO/SEO Claude | [AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo) | 14.2K | ✅ |
| humanizer / huminizer / Humanizer.skill | [blader/humanizer](https://github.com/blader/humanizer) | 11.3K | ✅ |

#### Research, Knowledge Base & Document Processing

| Nama Skill (asli) | Repo GitHub | Stars | Status |
|---|---|---|---|
| XLSX / DOCX / pdfskill / pptx / xlsx pdf docx pptx | [anthropics/skills](https://github.com/anthropics/skills) | 171.4K | ✅ |

</details>

<details>
<summary><b>🟠 Di bawah 1K stars — repo jelas ditemukan, belum banyak dipakai</b></summary>

| Nama Skill (asli) | Repo GitHub | Stars | Catatan |
|---|---|---|---|
| remotion-superpowers / Remotion.skill | [DojoCodingLabs/remotion-superpowers](https://github.com/DojoCodingLabs/remotion-superpowers) | 45 | hanya 45 stars, jauh di bawah 1K |
| GPT Image 2.Skill | — | 0 | GPT Image 2 Skill - terkait ekosistem nano-banana yang terfragmentasi, tidak ketemu repo >=1K |
| nano-banana | — | 0 | nano-banana - sangat terfragmentasi, banyak repo kecil berbeda author, tidak ada yang >=1K |
| AThevon/genjutsu | [AThevon/genjutsu](https://github.com/AThevon/genjutsu) | 270 | 270 stars, jauh di bawah 1K |
| prisma-database-setup | [prisma/skills](https://github.com/prisma/skills) | 53 | prisma-database-setup, repo resmi Prisma tapi hanya 53 stars |
| neon-postgres | [neondatabase/agent-skills](https://github.com/neondatabase/agent-skills) | 82 | neon-postgres, repo resmi Neon tapi hanya 82 stars |
| notebooklm-skill / NotebookLLM.skill | [claude-world/notebooklm-skill](https://github.com/claude-world/notebooklm-skill) | 413 | notebooklm-skill sangat terfragmentasi, repo terbesar cuma 413 stars |

</details>

<details>
<summary><b>⚪ Tidak ditemukan repo representatif — nama konsep generik, bukan proyek spesifik</b></summary>

| Nama Skill (asli) | Kategori Asal |
|---|---|
| typeui | UI/UX, Frontend & Design Systems |
| Nothing Design Skill | UI/UX, Frontend & Design Systems |
| design-auditor / Design Auditor.skill / design review / review | UI/UX, Frontend & Design Systems |
| Awesome Design Skills | UI/UX, Frontend & Design Systems |
| uxdesingner szilu | UI/UX, Frontend & Design Systems |
| designer-skills | UI/UX, Frontend & Design Systems |
| design-motion / motion-design-skill | Motion, Animation, 3D & Generative Art |
| claude-remotion | Motion, Animation, 3D & Generative Art |
| blender-motion | Motion, Animation, 3D & Generative Art |
| ae-motion | Motion, Animation, 3D & Generative Art |
| img2threejs | Motion, Animation, 3D & Generative Art |
| Claudedesignskills | Motion, Animation, 3D & Generative Art |
| Drawn Diagrams | Motion, Animation, 3D & Generative Art |
| banana-claude | Motion, Animation, 3D & Generative Art |
| generative-ui | System Architecture, Agentic AI & Prompt Engineering |
| progressive-reveal | System Architecture, Agentic AI & Prompt Engineering |
| frustration-checks | System Architecture, Agentic AI & Prompt Engineering |
| feedback-loops | System Architecture, Agentic AI & Prompt Engineering |
| system-structure | System Architecture, Agentic AI & Prompt Engineering |
| persona-architecture / tone-calibration | System Architecture, Agentic AI & Prompt Engineering |
| emotional-design | System Architecture, Agentic AI & Prompt Engineering |
| template-design / few-shot-patterns | System Architecture, Agentic AI & Prompt Engineering |
| chain-of-thought | System Architecture, Agentic AI & Prompt Engineering |
| constraint-spec / guardrails | System Architecture, Agentic AI & Prompt Engineering |
| trust-calibration / transparency-patterns | System Architecture, Agentic AI & Prompt Engineering |
| quality-rubrics | System Architecture, Agentic AI & Prompt Engineering |
| task-decomposition / handoff-protocols | System Architecture, Agentic AI & Prompt Engineering |
| token-budgets / turn-repair | System Architecture, Agentic AI & Prompt Engineering |
| Antfu's Skills | System Architecture, Agentic AI & Prompt Engineering |
| gstack | System Architecture, Agentic AI & Prompt Engineering |
| claudemem | System Architecture, Agentic AI & Prompt Engineering |
| slide-decks | Content, Marketing, Social Media & Branding |
| CRO / Marketing Psychology | Content, Marketing, Social Media & Branding |
| Ad Creative / Competitive Ads | Content, Marketing, Social Media & Branding |
| Social Media OS / Tweetclaw.skill / Twitter Optimizer / Social | Content, Marketing, Social Media & Branding |
| Copywriting / Beautiful Prose.skill / Kim Barrett suite.skill | Content, Marketing, Social Media & Branding |
| Content Strategy / Pillar Content | Content, Marketing, Social Media & Branding |
| Video / Reels Scripting.skill / AI Video Toolkit | Content, Marketing, Social Media & Branding |
| Email Sequences / Email Marketing | Content, Marketing, Social Media & Branding |
| YouTube Thumbnail / Hook Generator.skill | Content, Marketing, Social Media & Branding |
| Voice Builder.skill | Content, Marketing, Social Media & Branding |
| Post Scorer.skill | Content, Marketing, Social Media & Branding |
| X Article Publisher | Content, Marketing, Social Media & Branding |
| Color Expert.skill | Content, Marketing, Social Media & Branding |
| Wondelai.Skills / Marketing Module / Marketing.Skills / marketingskills | Content, Marketing, Social Media & Branding |
| ai-second-brain | Research, Knowledge Base & Document Processing |
| autoresearch / Autoresearch.skill | Research, Knowledge Base & Document Processing |
| Deep Research / SM Research.skill / Academic Research | Research, Knowledge Base & Document Processing |
| Evidence dialogue | Research, Knowledge Base & Document Processing |
| Vexor Search / file search | Research, Knowledge Base & Document Processing |
| Web Scraper.skill / hyperbrowser | Research, Knowledge Base & Document Processing |
| Daydream.skill / brainstorming / doc-coauthoring | Research, Knowledge Base & Document Processing |
| DCF Model / 3-Statements / LBO Model / Comps Analysis | Finance, Product Management, Legal & Operations |
| Pricing / Pitch Deck / Business Case | Finance, Product Management, Legal & Operations |
| SOP Builder / Incident Postmortem / Launch Runbook | Finance, Product Management, Legal & Operations |
| Internal Comms | Finance, Product Management, Legal & Operations |
| Contract Review / NDA Triage / Legal Risk / Compliance | Finance, Product Management, Legal & Operations |
| PM Skills / JTBD Interview Tool | Finance, Product Management, Legal & Operations |
| AI Transformation | Finance, Product Management, Legal & Operations |
| Generative Media / AI Music Album | Finance, Product Management, Legal & Operations |
| aps store / Task Observer / ponytail / scroll-world / EST | Finance, Product Management, Legal & Operations |

</details>

<sub>Riset per Agustus 2026. Angka stars bisa berubah seiring waktu karena repo aktif terus bertambah bintangnya.</sub>