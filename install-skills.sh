#!/usr/bin/env bash
# ==============================================================================
# install-skills.sh
#
# Install ALL Claude Skills listed in this repository, GLOBALLY (user-level),
# so they can be used across multiple tools/projects (not just OpenCode /
# Antigravity).
#
# IMPORTANT NOTES BEFORE RUNNING:
# 1. "Global" here means the -g flag on `npx skills add`, which installs
#    skills at the user level (typically ~/.skills or ~/.agents/skills,
#    depending on CLI version), NOT inside a project folder. This is what
#    makes them usable across projects/tools.
# 2. Skills are NOT automatically "always on" after install. Your AI tool
#    will invoke them one of two ways:
#      a) Automatically (model-invoked) — triggered when the skill's
#         description matches your prompt.
#      b) Manually (user-invoked) — you type it directly, e.g. /caveman-review,
#         /grill-me, etc. (depends on the skill & tool used).
# 3. The -a/--agent flag is left EMPTY by default below so the CLI can
#    detect/ask which agent is installed on your system interactively.
#    If you know exactly which target agent you want (e.g. claude-code,
#    cursor, codex), add it yourself, example:
#        npx skills add <repo> -g -a claude-code cursor codex
#    Check supported agents with: npx skills --help
# 4. Run WITHOUT sudo. Skills install into your regular user home directory.
# 5. Some repos below are LARGE repos containing DOZENS of skills at once
#    (no @skill-name) — this is intentional, installing everything in bulk.
#
# Source list: see README.md in this repository for the full category
# breakdown and official GitHub links for every repo referenced here.
# ==============================================================================

set -euo pipefail

# Change this line if you want to target a specific agent, e.g.:
# AGENT_FLAGS=(-a claude-code cursor codex)
AGENT_FLAGS=()

GLOBAL_FLAG=(-g)

install_repo() {
  local repo="$1"
  echo ""
  echo "=================================================================="
  echo "Installing ALL skills from: $repo"
  echo "=================================================================="
  npx skills add "$repo" "${GLOBAL_FLAG[@]}" "${AGENT_FLAGS[@]}" -y || {
    echo "!! Failed / skipped: $repo (continuing to next)"
  }
}

install_skill() {
  local repo="$1"
  local skill="$2"
  echo ""
  echo "------------------------------------------------------------------"
  echo "Installing skill '$skill' from: $repo"
  echo "------------------------------------------------------------------"
  npx skills add "$repo" --skill "$skill" "${GLOBAL_FLAG[@]}" "${AGENT_FLAGS[@]}" -y || {
    echo "!! Failed / skipped: $repo -> $skill (continuing to next)"
  }
}

# ------------------------------------------------------------------------
# 1. Core / Official
# ------------------------------------------------------------------------
echo "############################################################"
echo "# 1. Core / Official"
echo "############################################################"
install_repo "anthropics/skills"

# ------------------------------------------------------------------------
# 2. Agents & Meta / Productivity
# ------------------------------------------------------------------------
echo "############################################################"
echo "# 2. Agents & Meta / Productivity"
echo "############################################################"
install_repo "mksglu/context-mode"
install_repo "vercel-labs/skills"                 # includes find-skills
install_repo "vercel-labs/agent-browser"
install_repo "garrytan/gstack"
install_repo "intellectronica/agent-skills"
install_repo "juliusbrussee/caveman"
install_repo "dietrichgebert/ponytail"
install_repo "Leonxlnx/taste-skill"

# ------------------------------------------------------------------------
# 3. Code & Dev
# ------------------------------------------------------------------------
echo "############################################################"
echo "# 3. Code & Dev"
echo "############################################################"
install_repo "addyosmani/agent-skills"
install_repo "mattpocock/skills"
install_repo "vercel-labs/agent-skills"           # react-best-practices, web-design-guidelines, etc.
install_repo "supabase/agent-skills"
install_repo "xixu-me/skills"
install_repo "vercel-labs/next-skills"
install_repo "firebase/agent-skills"
install_repo "stripe/ai"
install_repo "neondatabase/agent-skills"
install_repo "antfu/skills"

# ------------------------------------------------------------------------
# 4. Science & Research
# ------------------------------------------------------------------------
echo "############################################################"
echo "# 4. Science & Research"
echo "############################################################"
install_repo "K-Dense-AI/scientific-agent-skills"
install_repo "lllllllama/ai-paper-reproduction-skill"

# ------------------------------------------------------------------------
# 5. Design & UI
# ------------------------------------------------------------------------
echo "############################################################"
echo "# 5. Design & UI"
echo "############################################################"
install_repo "nextlevelbuilder/ui-ux-pro-max-skill"
install_repo "sleekdotdesign/agent-skills"
install_repo "shadcn/ui"
install_repo "arvindrk/extract-design-system"
install_repo "emilkowalski/skill"

# ------------------------------------------------------------------------
# 6. Media & Creative
# ------------------------------------------------------------------------
echo "############################################################"
echo "# 6. Media & Creative"
echo "############################################################"
install_repo "nutlope/hallmark"
install_repo "pbakaus/impeccable"
install_repo "remotion-dev/skills"
install_repo "agentspace-so/runcomfy-agent-skills"
install_repo "heygen-com/hyperframes"             # website-to-hyperframes, css-animations, waapi
install_repo "google-labs-code/stitch-skills"
install_repo "alchaincyf/huashu-design"
install_repo "jimliu/baoyu-skills"
install_repo "greensock/gsap-skills"

# ------------------------------------------------------------------------
# 7. Marketing, SEO & Growth
# ------------------------------------------------------------------------
echo "############################################################"
echo "# 7. Marketing, SEO & Growth"
echo "############################################################"
install_repo "scrapegraphai/just-scrape"
install_repo "coreyhaines31/marketingskills"
install_repo "addyosmani/web-quality-skills"      # accessibility, performance audit
install_repo "aaron-he-zhu/seo-geo-claude-skills"
install_repo "tavily-ai/skills"
install_repo "charlie947/social-media-skills"

echo ""
echo "############################################################"
echo "# Done. Check what was installed with:"
echo "#   npx skills list -g"
echo "############################################################"
