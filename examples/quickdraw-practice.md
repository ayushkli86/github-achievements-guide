# Example: Quickdraw Practice Repository

This is an example of a repository structure optimized for the Quickdraw achievement.

## Repository Setup

```bash
# Create the repository
gh repo create quickdraw-example --public --description "Example repository for Quickdraw achievement practice"
cd quickdraw-example

# Initial commit
echo "# Quickdraw Example" > README.md
git add README.md
git commit -m "Initial commit"
git push -u origin main
```

## Issue Creation Strategy

### 1. Documentation Issues
Create issues for standard project documentation:

- Add .gitignore file
- Create LICENSE
- Add CONTRIBUTING.md
- Create CODE_OF_CONDUCT.md
- Add SECURITY.md

### 2. Configuration Issues
Set up project configuration files:

- Add .editorconfig
- Create package.json
- Add TypeScript config
- Set up ESLint
- Configure Prettier

### 3. CI/CD Issues
Implement automation:

- Add GitHub Actions workflow
- Create Dependabot config
- Set up issue templates
- Add PR template

## Sample Issue Workflow

### Step 1: Create Issue
```bash
gh issue create --title "Add .gitignore file" --body "Repository needs a comprehensive .gitignore to exclude common files and directories."
```

### Step 2: Implement Fix
Create the .gitignore file with appropriate content.

### Step 3: Commit and Close
```bash
git add .gitignore
git commit -m "chore: add comprehensive .gitignore

- Added OS-specific exclusions
- Added IDE and editor files  
- Added common temporary files
- Closes #1"
git push
```

The issue will be automatically closed due to the "Closes #1" in the commit message.

## Timing Considerations

- Create issue
- Implement fix within 5 minutes
- Commit with closing reference
- Push to trigger closure

## File Templates

### .gitignore Template
```
# OS generated files
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/

# Dependencies
node_modules/
.npm

# Logs
*.log
```

### package.json Template
```json
{
  "name": "quickdraw-example",
  "version": "1.0.0",
  "description": "Example repository for Quickdraw achievement",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "license": "MIT"
}
```

## Automation Script Usage

```bash
# Run the automation script for 25 issues (Gold tier)
./scripts/quickdraw-automation.sh 25

# Run for Platinum tier
./scripts/quickdraw-automation.sh 125
```

## Best Practices Demonstrated

1. **Meaningful Issues** - Each issue represents a genuine improvement
2. **Clear Commits** - Descriptive commit messages with issue references
3. **Proper Structure** - Organized repository with standard files
4. **Documentation** - Comprehensive README and guides
5. **Automation** - Scripts to streamline the process

## Results Tracking

Monitor your progress:
```bash
# Check closed issues
gh issue list --state closed

# View achievement progress
open "https://github.com/$(gh api user --jq .login)?tab=achievements"
```

This example demonstrates how to efficiently earn the Quickdraw achievement while creating genuine value and maintaining professional standards.
