#!/usr/bin/env bash

# ============================================================
# skills-vault :: Global Skills Installer
# ============================================================
#
# Windows / Git Bash compatible
#
# - Uses the DEFAULT global directory of `skills`
# - Does NOT create a custom C:\skills-vault directory
# - Does NOT install into the current project
# - Does NOT use --agent "*"
# - Installs globally to supported agents
# - Automatically skips agents that reject global installs
#
# Usage:
#
#   chmod +x install-skills.sh
#   ./install-skills.sh
#
# Verify:
#
#   npx skills ls -g
#
# ============================================================

set -uo pipefail

# ============================================================
# Configuration
# ============================================================

# Agents we want to try.
#
# PromptScript is intentionally NOT included because it reports:
#
#   PromptScript does not support global skill installation
#
# Add/remove agents here if your `skills` CLI supports others.
AGENTS=(
    "claude-code"
    "codex"
    "cursor"
    "gemini-cli"
    "opencode"
)

# ============================================================
# Counters
# ============================================================

TOTAL_REPOS=0
SUCCESS_REPOS=0
FAILED_REPOS=0
SKIPPED_REPOS=0

# ============================================================
# Colors
# ============================================================

if [[ -t 1 ]]; then
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    RED='\033[0;31m'
    BLUE='\033[0;34m'
    CYAN='\033[0;36m'
    RESET='\033[0m'
else
    GREEN=''
    YELLOW=''
    RED=''
    BLUE=''
    CYAN=''
    RESET=''
fi

# ============================================================
# Logging
# ============================================================

info() {
    echo -e "${BLUE}[INFO]${RESET} $*"
}

success() {
    echo -e "${GREEN}[OK]${RESET} $*"
}

warning() {
    echo -e "${YELLOW}[SKIP]${RESET} $*"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $*"
}

section() {
    echo
    echo -e "${CYAN}============================================================${RESET}"
    echo -e "${CYAN}$*${RESET}"
    echo -e "${CYAN}============================================================${RESET}"
    echo
}

# ============================================================
# Preflight
# ============================================================

section "skills-vault :: GLOBAL INSTALLER"

if ! command -v npx >/dev/null 2>&1; then
    error "npx was not found."
    echo
    echo "Please install Node.js/npm first."
    exit 1
fi

info "Node.js:"
node --version 2>/dev/null || true

info "npm:"
npm --version 2>/dev/null || true

info "skills CLI:"
npx skills --version 2>/dev/null || true

echo

info "Installation scope: GLOBAL"
info "Global directory: DEFAULT skills CLI directory"
info "Custom directory: NONE"
info "Project installation: DISABLED"
info "PromptScript: SKIPPED"

echo

# ============================================================
# Agent check
# ============================================================

section "Checking supported agents"

for agent in "${AGENTS[@]}"; do
    echo "  - ${agent}"
done

echo

# ============================================================
# Install functions
# ============================================================

install_repo() {
    local repo="$1"

    TOTAL_REPOS=$((TOTAL_REPOS + 1))

    echo
    echo -e "${CYAN}------------------------------------------------------------${RESET}"
    echo -e "Repository: ${repo}"
    echo -e "${CYAN}------------------------------------------------------------${RESET}"

    local installed=false

    for agent in "${AGENTS[@]}"; do

        echo
        info "Trying global install → ${agent}"

        if npx skills add "${repo}" \
            --global \
            --agent "${agent}" \
            --yes; then

            success "${repo} → ${agent}"

            installed=true
            SUCCESS_REPOS=$((SUCCESS_REPOS + 1))

            # One successful agent is enough.
            break

        else
            warning "${repo} → ${agent} rejected/failed"

            # Continue to the next supported agent.
            continue
        fi

    done

    if [[ "$installed" == false ]]; then
        error "Could not globally install ${repo} on any configured agent."
        FAILED_REPOS=$((FAILED_REPOS + 1))
    fi
}

install_skill() {
    local repo="$1"
    local skill="$2"

    TOTAL_REPOS=$((TOTAL_REPOS + 1))

    echo
    echo -e "${CYAN}------------------------------------------------------------${RESET}"
    echo -e "Skill: ${skill}"
    echo -e "Repository: ${repo}"
    echo -e "${CYAN}------------------------------------------------------------${RESET}"

    local installed=false

    for agent in "${AGENTS[@]}"; do

        echo
        info "Trying ${skill} → ${agent}"

        if npx skills add "${repo}" \
            --skill "${skill}" \
            --global \
            --agent "${agent}" \
            --yes; then

            success "${skill} → ${agent}"

            installed=true
            SUCCESS_REPOS=$((SUCCESS_REPOS + 1))

            break

        else
            warning "${skill} → ${agent} rejected/failed"
            continue
        fi

    done

    if [[ "$installed" == false ]]; then
        error "Could not globally install ${skill}."
        FAILED_REPOS=$((FAILED_REPOS + 1))
    fi
}

# ============================================================
# 1. Core / Official
# ============================================================

section "1. CORE / OFFICIAL"

install_repo "anthropics/skills"

# ============================================================
# 2. Agents &  / Productivity
# ============================================================

section "2. AGENTS & META / PRODUCTIVITY"

install_repo "mksglu/context-mode"
install_repo "vercel-labs/skills"
install_repo "vercel-labs/agent-browser"
install_repo "garrytan/gstack"
install_repo "intellectronica/agent-skills"
install_repo "juliusbrussee/caveman"
install_repo "dietrichgebert/ponytail"
install_repo "Leonxlnx/taste-skill"
install_repo "obra/superpowers"

# ============================================================
# 3. Code & Development
# ============================================================

section "3. CODE & DEVELOPMENT"

install_repo "addyosmani/agent-skills"
install_repo "mattpocock/skills"
install_repo "vercel-labs/agent-skills"
install_repo "supabase/agent-skills"
install_repo "xixu-me/skills"
install_repo "vercel-labs/next-skills"
install_repo "firebase/agent-skills"
install_repo "stripe/ai"
install_repo "neondatabase/agent-skills"
install_repo "antfu/skills"
install_repo "wshobson/agents"
install_repo "yamadashy/repomix"
install_repo "CloudAI-X/threejs-skills"

# ============================================================
# 4. Science & Research
# ============================================================

section "4. SCIENCE & RESEARCH"

install_repo "K-Dense-AI/scientific-agent-skills"
install_repo "lllllllama/ai-paper-reproduction-skill"

# ============================================================
# 5. Design & UI
# ============================================================

section "5. DESIGN & UI"

install_repo "nextlevelbuilder/ui-ux-pro-max-skill"
install_repo "sleekdotdesign/agent-skills"
install_repo "shadcn-ui/ui"
install_repo "arvindrk/extract-design-system"
install_repo "emilkowalski/skill"
install_repo "emilkowalski/skills"
install_repo "figma/mcp-server-guide"

# ============================================================
# 6. Media & Creative
# ============================================================

section "6. MEDIA & CREATIVE"

install_repo "nutlope/hallmark"
install_repo "pbakaus/impeccable"
install_repo "remotion-dev/skills"
install_repo "agentspace-so/runcomfy-agent-skills"
install_repo "heygen-com/hyperframes"
install_repo "google-labs-code/stitch-skills"
install_repo "alchaincyf/huashu-design"
install_repo "jimliu/baoyu-skills"
install_repo "greensock/gsap-skills"

# ============================================================
# 7. Marketing, SEO & Growth
# ============================================================

section "7. MARKETING / SEO / GROWTH"

install_repo "scrapegraphai/just-scrape"
install_repo "coreyhaines31/marketingskills"
install_repo "addyosmani/web-quality-skills"
install_repo "aaron-he-zhu/seo-geo-claude-skills"
install_repo "tavily-ai/skills"
install_repo "charlie947/social-media-skills"
install_repo "AgriciDaniel/claude-seo"
install_repo "blader/humanizer"

# ============================================================
# Summary
# ============================================================

section "INSTALLATION SUMMARY"

echo "Total repositories attempted : ${TOTAL_REPOS}"
echo "Successfully installed       : ${SUCCESS_REPOS}"
echo "Failed                       : ${FAILED_REPOS}"
echo

if [[ "$FAILED_REPOS" -gt 0 ]]; then
    warning "Some repositories could not be installed globally."
    echo
    echo "This usually means the repository/skill is incompatible"
    echo "with the configured agent or global installation."
fi

echo
echo "Verify global skills:"
echo
echo "  npx skills ls -g"
echo

echo "Filter by agent:"
echo
echo "  npx skills ls -g -a claude-code"
echo "  npx skills ls -g -a codex"
echo "  npx skills ls -g -a cursor"
echo

echo -e "${GREEN}============================================================${RESET}"
echo -e "${GREEN} skills-vault :: DONE${RESET}"
echo -e "${GREEN}============================================================${RESET}"
echo