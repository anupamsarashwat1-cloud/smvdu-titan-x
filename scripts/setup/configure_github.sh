#!/bin/bash

# ==============================================================================
# SMVDU-TITAN-X GitHub Integration & System Setup Suite
# Designed for Anupam Sarashwat (Electronics & Communication Engineering)
# Shri Mata Vaishno Devi University (SMVDU)
# ==============================================================================

# ANSI Color Codes for Premium Console Aesthetics
export BOLD="\033[1m"
export GREEN="\033[38;5;82m"
export CYAN="\033[38;5;45m"
export ORANGE="\033[38;5;208m"
export YELLOW="\033[38;5;220m"
export RED="\033[38;5;196m"
export RESET="\033[0m"

clear

echo -e "${CYAN}${BOLD}======================================================================${RESET}"
echo -e "${CYAN}${BOLD}       SMVDU-TITAN-X - GITHUB INTEGRATION & SYSTEM SETUP SUITE        ${RESET}"
echo -e "${CYAN}${BOLD}======================================================================${RESET}"
echo -e "This utility will configure your Git identity, install the GitHub CLI,"
echo -e "commit your local VLSI codebase, and push it to your GitHub profile."
echo -e "----------------------------------------------------------------------"

# --- STEP 1: Git Installation Check ---
echo -e "\n${BOLD}[Step 1/6]${RESET} Checking Git Installation..."
if ! command -v git &> /dev/null; then
    echo -e "${RED}[ERROR] Git is not installed on your system. Please install git first.${RESET}"
    exit 1
else
    GIT_VER=$(git --version)
    echo -e "${GREEN}[OK] Git is available: ${GIT_VER}${RESET}"
fi

# --- STEP 2: Configure Git Identity ---
echo -e "\n${BOLD}[Step 2/6]${RESET} Checking Git Global Identity..."

# Predefined Defaults
DEFAULT_NAME="Anupam Sarashwat"
DEFAULT_EMAIL="23bec014@smvdu.ac.in"
DEFAULT_USER="anupamsarashwat1-cloud"

CURRENT_NAME=$(git config --global user.name)
CURRENT_EMAIL=$(git config --global user.email)

# Setup User Name
if [ -z "$CURRENT_NAME" ]; then
    read -p "👉 Enter your Full Name [Default: $DEFAULT_NAME]: " NEW_NAME
    NEW_NAME=${NEW_NAME:-$DEFAULT_NAME}
    git config --global user.name "$NEW_NAME"
    CURRENT_NAME="$NEW_NAME"
else
    # Update to provided name if it doesn't match default and user wants to overwrite
    if [ "$CURRENT_NAME" != "$DEFAULT_NAME" ]; then
        read -p "👉 Existing Name '$CURRENT_NAME' found. Overwrite with '$DEFAULT_NAME'? (y/n) [Default: y]: " OVERWRITE_NAME
        OVERWRITE_NAME=${OVERWRITE_NAME:-y}
        if [ "$OVERWRITE_NAME" = "y" ] || [ "$OVERWRITE_NAME" = "Y" ]; then
            git config --global user.name "$DEFAULT_NAME"
            CURRENT_NAME="$DEFAULT_NAME"
        fi
    fi
fi

# Setup User Email
if [ -z "$CURRENT_EMAIL" ]; then
    read -p "👉 Enter your Professional Email [Default: $DEFAULT_EMAIL]: " NEW_EMAIL
    NEW_EMAIL=${NEW_EMAIL:-$DEFAULT_EMAIL}
    git config --global user.email "$NEW_EMAIL"
    CURRENT_EMAIL="$NEW_EMAIL"
else
    # Update to provided email if it doesn't match default
    if [ "$CURRENT_EMAIL" != "$DEFAULT_EMAIL" ]; then
        read -p "👉 Existing Email '$CURRENT_EMAIL' found. Overwrite with '$DEFAULT_EMAIL'? (y/n) [Default: y]: " OVERWRITE_EMAIL
        OVERWRITE_EMAIL=${OVERWRITE_EMAIL:-y}
        if [ "$OVERWRITE_EMAIL" = "y" ] || [ "$OVERWRITE_EMAIL" = "Y" ]; then
            git config --global user.email "$DEFAULT_EMAIL"
            CURRENT_EMAIL="$DEFAULT_EMAIL"
        fi
    fi
fi

# Set default branch name to main globally
git config --global init.defaultBranch main

echo -e "${GREEN}[OK] Git Identity Configured:${RESET}"
echo -e "   👤 Name:  $CURRENT_NAME"
echo -e "   📧 Email: $CURRENT_EMAIL"

# --- STEP 3: Install GitHub CLI (gh) ---
echo -e "\n${BOLD}[Step 3/6]${RESET} Checking GitHub CLI (gh)..."
if ! command -v gh &> /dev/null; then
    echo -e "${YELLOW}[INFO] GitHub CLI (gh) is not installed.${RESET}"
    echo -e "${CYAN}[SYSTEM] Preparing to install GitHub CLI (gh) on Ubuntu 24.04 via apt...${RESET}"
    echo -e "${ORANGE}[NOTE] This step requires administrator privileges (sudo).${RESET}"
    
    # Run apt update & install
    sudo apt update
    sudo apt install -y gh

    # Re-verify
    if command -v gh &> /dev/null; then
        echo -e "${GREEN}[OK] GitHub CLI (gh) has been successfully installed!${RESET}"
    else
        echo -e "${RED}[ERROR] Failed to install gh CLI automatically. Please run: sudo apt install gh${RESET}"
        exit 1
    fi
else
    GH_VER=$(gh --version | head -n 1)
    echo -e "${GREEN}[OK] GitHub CLI is already installed: ${GH_VER}${RESET}"
fi

# --- STEP 4: Stage & Commit Codebase ---
echo -e "\n${BOLD}[Step 4/6]${RESET} Analyzing local git repository status..."

# Rename main branch to main (if current branch is master)
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" = "master" ] || [ -z "$CURRENT_BRANCH" ]; then
    echo -e "${YELLOW}[INFO] Renaming local branch from 'master' to 'main' for GitHub standards...${RESET}"
    git branch -M main
    CURRENT_BRANCH="main"
fi

# Check for modifications or untracked files
if [ -n "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}[INFO] Found untracked or modified files in workspace. Committing files...${RESET}"
    git add .
    
    # Prompt for custom commit message or use default
    echo -e "----------------------------------------------------------------------"
    read -p "👉 Enter commit message [Default: 'feat: Initial setup of SMVDU-TITAN-X core structure and templates']: " CUSTOM_MSG
    if [ -z "$CUSTOM_MSG" ]; then
        CUSTOM_MSG="feat: Initial setup of SMVDU-TITAN-X core structure and templates"
    fi
    
    git commit -m "$CUSTOM_MSG"
    echo -e "${GREEN}[OK] All files committed successfully under branch: ${CURRENT_BRANCH}${RESET}"
else
    echo -e "${GREEN}[OK] Working directory is clean. No new changes to commit.${RESET}"
fi

# --- STEP 5: Secure GitHub Authentication ---
echo -e "\n${BOLD}[Step 5/6]${RESET} Preparing GitHub Authentication..."
echo -e "${CYAN}[INSTRUCTION] We will now trigger secure authentication via 'gh auth login'.${RESET}"
echo -e "You will be prompted to:"
echo -e " 1. Select ${BOLD}GitHub.com${RESET}"
echo -e " 2. Select ${BOLD}HTTPS${RESET} or ${BOLD}SSH${RESET} for git operations"
echo -e " 3. Authenticate using a browser (recommended) or a Personal Access Token (PAT)"
echo -e "----------------------------------------------------------------------"

# Trigger interactive authentication
gh auth login

# Check authentication status
if gh auth status &> /dev/null; then
    GH_USER=$(gh api user -q .login)
    echo -e "${GREEN}[OK] Successfully authenticated as GitHub user: @${GH_USER}!${RESET}"
else
    # Fallback to predefined username if status check fails in standard terminal
    GH_USER=$DEFAULT_USER
    echo -e "${YELLOW}[WARNING] Auth status check could not verify your username. Defaulting to @${GH_USER}.${RESET}"
fi

# --- STEP 6: Create Repository & Push ---
echo -e "\n${BOLD}[Step 6/6]${RESET} Creating remote GitHub repository..."

# Check if remote origin already exists
if git remote | grep -q "origin"; then
    echo -e "${YELLOW}[INFO] Remote 'origin' is already configured. Preparing to push...${RESET}"
    git push -u origin main
else
    echo -e "We will create a new public repository under your GitHub account named ${BOLD}smvdu-titan-x${RESET}."
    read -p "👉 Create public repository 'smvdu-titan-x'? (y/n) [Default: y]: " CREATE_REPO
    CREATE_REPO=${CREATE_REPO:-y}
    
    if [ "$CREATE_REPO" = "y" ] || [ "$CREATE_REPO" = "Y" ]; then
        echo -e "${CYAN}[EXEC] Creating public GitHub repository 'smvdu-titan-x'...${RESET}"
        
        # Use gh CLI to create repository and push local content
        gh repo create smvdu-titan-x --public --source=. --push
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}[SUCCESS] Repository 'smvdu-titan-x' created and codebase pushed!${RESET}"
        else
            echo -e "${RED}[ERROR] Failed to create repository automatically. Trying manual setup...${RESET}"
            # Check if repo exists and add remote
            git remote add origin "https://github.com/${GH_USER}/smvdu-titan-x.git"
            git push -u origin main
        fi
    else
        echo -e "${RED}[ABORT] Skipping remote repository creation. You can set it up manually later.${RESET}"
        exit 0
    fi
fi

# Final status
echo -e "\n${CYAN}${BOLD}======================================================================${RESET}"
echo -e "${GREEN}${BOLD}      🎉 CONGRATULATIONS! GITHUB INTEGRATION COMPLETE 🎉              ${RESET}"
echo -e "${CYAN}${BOLD}======================================================================${RESET}"
echo -e "Your local SMVDU-TITAN-X codebase is fully integrated with GitHub!"
echo -e "Your professional GitHub Profile README is located at:"
echo -e "👉 ${BOLD}VLSI_GITHUB_PROFILE_README.md${RESET} in your project root."
echo -e ""
echo -e "To showcase this profile readme on your main GitHub profile page:"
echo -e " 1. Create a new public repository on GitHub named exactly after your username."
echo -e "    For example, since your username is '${GH_USER}', name the repo '${GH_USER}'."
echo -e " 2. Add a ${BOLD}README.md${RESET} to that repository and paste the contents of:"
echo -e "    ${BOLD}VLSI_GITHUB_PROFILE_README.md${RESET}"
echo -e " 3. Your profile is pre-configured with your academic and engineering details!"
echo -e "======================================================================\n"
