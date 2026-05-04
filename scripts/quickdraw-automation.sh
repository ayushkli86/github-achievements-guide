#!/bin/bash

# GitHub Quickdraw Achievement Automation Script
# Creates and closes issues rapidly for achievement progress

set -e

# Configuration
REPO_NAME="quickdraw-practice-$(date +%s)"
TARGET_COUNT=${1:-25}  # Default to Gold tier
BATCH_SIZE=10

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[$(date +'%H:%M:%S')]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Check prerequisites
check_prerequisites() {
    log "Checking prerequisites..."
    
    if ! command -v gh &> /dev/null; then
        error "GitHub CLI (gh) is not installed. Please install it first."
    fi
    
    if ! gh auth status &> /dev/null; then
        error "Not authenticated with GitHub CLI. Run 'gh auth login' first."
    fi
    
    log "Prerequisites check passed"
}

# Create practice repository
create_repository() {
    log "Creating practice repository: $REPO_NAME"
    
    gh repo create "$REPO_NAME" --public --description "Practice repository for GitHub Quickdraw achievement" --clone
    cd "$REPO_NAME"
    
    # Initial setup
    cat > README.md << EOF
# Quickdraw Practice Repository

This repository is used for practicing the GitHub Quickdraw achievement.

## Purpose
- Create and close issues quickly
- Practice efficient development workflows
- Learn GitHub automation

## Progress
Target: $TARGET_COUNT quick closes
EOF
    
    git add README.md
    git commit -m "Initial repository setup"
    git push -u origin main
    
    log "Repository created successfully"
}

# Generate issue data
generate_issues() {
    local count=$1
    local issues=()
    
    # Common development tasks that make sense to create and fix quickly
    local base_issues=(
        "Add .gitignore file:chore: add comprehensive .gitignore"
        "Create LICENSE file:license: add MIT license"
        "Add CONTRIBUTING.md:docs: add contribution guidelines"
        "Create CODE_OF_CONDUCT.md:docs: add code of conduct"
        "Add SECURITY.md:security: add security policy"
        "Create issue templates:feat: add GitHub issue templates"
        "Add pull request template:feat: add PR template"
        "Create CHANGELOG.md:docs: add changelog file"
        "Add .editorconfig:config: add editor configuration"
        "Create package.json:feat: add package.json for Node.js"
        "Add TypeScript config:config: add tsconfig.json"
        "Create ESLint config:config: add ESLint configuration"
        "Add Prettier config:config: add Prettier formatting"
        "Create GitHub Actions workflow:ci: add CI workflow"
        "Add Dependabot config:ci: add dependabot configuration"
        "Create Docker support:feat: add Dockerfile"
        "Add VS Code settings:config: add .vscode settings"
        "Create API documentation:docs: add API documentation"
        "Add deployment guide:docs: add deployment instructions"
        "Create troubleshooting guide:docs: add troubleshooting guide"
    )
    
    # Generate additional issues if needed
    for i in $(seq 1 $count); do
        if [ $i -le ${#base_issues[@]} ]; then
            issues+=("${base_issues[$((i-1))]}")
        else
            # Generate additional documentation issues
            local doc_num=$((i - ${#base_issues[@]}))
            issues+=("Add documentation section $doc_num:docs: add documentation section $doc_num")
        fi
    done
    
    printf '%s\n' "${issues[@]}"
}

# Process a single issue
process_issue() {
    local issue_data="$1"
    local issue_num="$2"
    
    IFS=':' read -r title commit_msg <<< "$issue_data"
    
    log "Processing issue $issue_num: $title"
    
    # Create the issue
    local issue_url
    issue_url=$(gh issue create --title "$title" --body "This task needs to be completed for project improvement.")
    local issue_number
    issue_number=$(echo "$issue_url" | grep -o '[0-9]*$')
    
    # Create appropriate file or make change based on issue type
    case "$title" in
        *".gitignore"*)
            create_gitignore_file
            ;;
        *"LICENSE"*)
            create_license_file
            ;;
        *"CONTRIBUTING"*)
            create_contributing_file
            ;;
        *"CODE_OF_CONDUCT"*)
            create_code_of_conduct_file
            ;;
        *"package.json"*)
            create_package_json
            ;;
        *)
            # Create a generic documentation file
            local filename
            filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/_/g' | sed 's/__*/_/g' | sed 's/^_\|_$//g').md
            echo "# $title" > "docs_$filename"
            echo "" >> "docs_$filename"
            echo "Documentation for: $title" >> "docs_$filename"
            echo "Created: $(date)" >> "docs_$filename"
            ;;
    esac
    
    # Commit the changes
    git add .
    git commit -m "$commit_msg

Closes #$issue_number"
    
    log "Completed issue $issue_num successfully"
}

# File creation functions
create_gitignore_file() {
    cat > .gitignore << 'EOF'
# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo

# Logs
*.log
npm-debug.log*

# Dependencies
node_modules/
.npm

# Temporary files
*.tmp
*.temp
.cache/
EOF
}

create_license_file() {
    cat > LICENSE << EOF
MIT License

Copyright (c) $(date +%Y) $(git config user.name)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}

create_contributing_file() {
    cat > CONTRIBUTING.md << 'EOF'
# Contributing Guidelines

Thank you for your interest in contributing to this project.

## How to Contribute

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test your changes
5. Submit a pull request

## Guidelines

- Write clear commit messages
- Follow existing code style
- Add tests for new features
- Update documentation as needed

## Questions

Feel free to open an issue for any questions or suggestions.
EOF
}

create_code_of_conduct_file() {
    cat > CODE_OF_CONDUCT.md << 'EOF'
# Code of Conduct

## Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone.

## Our Standards

Examples of behavior that contributes to creating a positive environment include:

- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community

## Enforcement

Project maintainers are responsible for clarifying standards and taking appropriate action.

## Contact

Report any issues to the project maintainers through GitHub issues.
EOF
}

create_package_json() {
    cat > package.json << EOF
{
  "name": "$REPO_NAME",
  "version": "1.0.0",
  "description": "Practice repository for GitHub Quickdraw achievement",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/$(gh api user --jq .login)/$REPO_NAME.git"
  },
  "license": "MIT"
}
EOF
}

# Main execution function
main() {
    log "Starting GitHub Quickdraw automation"
    log "Target: $TARGET_COUNT quick closes"
    
    check_prerequisites
    create_repository
    
    # Generate issues to process
    local issues
    mapfile -t issues < <(generate_issues "$TARGET_COUNT")
    
    local count=0
    for issue_data in "${issues[@]}"; do
        if [ $count -ge "$TARGET_COUNT" ]; then
            break
        fi
        
        count=$((count + 1))
        process_issue "$issue_data" "$count"
        
        # Push in batches to avoid overwhelming GitHub
        if [ $((count % BATCH_SIZE)) -eq 0 ]; then
            log "Pushing batch of $BATCH_SIZE commits..."
            git push
            sleep 2  # Brief pause to be respectful
        fi
    done
    
    # Final push
    git push
    
    log "Quickdraw automation completed successfully"
    log "Total issues processed: $count"
    log "Check your achievements at: https://github.com/$(gh api user --jq .login)?tab=achievements"
    
    # Clean up
    cd ..
    warn "Practice repository created at: https://github.com/$(gh api user --jq .login)/$REPO_NAME"
    warn "You may want to delete it after confirming your achievement progress"
}

# Script entry point
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
