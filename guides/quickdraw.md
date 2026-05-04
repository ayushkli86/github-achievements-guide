# Quickdraw Achievement Guide

The Quickdraw achievement requires closing issues or pull requests within 5 minutes of opening them.

## Achievement Levels

- **Bronze**: 1 quick close
- **Silver**: 5 quick closes  
- **Gold**: 25 quick closes
- **Platinum**: 125 quick closes

## Strategy Overview

The most efficient approach combines three methods:

1. **Own Repository Method** - Full control over timing
2. **Documentation Fixes** - Quick, valuable contributions
3. **Duplicate Issue Closing** - Immediate resolution

## Method 1: Own Repository Strategy

Create a practice repository specifically for achievement farming:

### Setup
```bash
gh repo create quickdraw-practice --public
cd quickdraw-practice
echo "# Quickdraw Practice" > README.md
git add . && git commit -m "initial commit"
git push -u origin main
```

### Execution Loop
1. Create an issue for a simple task
2. Immediately implement the fix
3. Commit and push changes
4. Close the issue with reference to commit

### Example Tasks
- Add .gitignore file
- Create LICENSE
- Add CONTRIBUTING.md
- Fix typos in documentation
- Add code examples
- Create issue templates

## Method 2: Documentation Contributions

Target repositories with active maintenance and clear documentation needs:

### Finding Targets
- Search for "good first issue" labels
- Look for typos in README files
- Find broken links in documentation
- Identify missing code examples

### Quick Fix Process
1. Fork the repository
2. Make minimal, focused changes
3. Create pull request immediately
4. Engage with maintainers promptly

## Method 3: Issue Management

Help maintain repositories by managing duplicate or invalid issues:

### Identification
- Duplicate bug reports
- Questions that belong in discussions
- Issues missing required information
- Spam or off-topic submissions

### Response Templates
Save time with prepared responses for common scenarios.

## Automation Script

Use the provided automation script for rapid achievement progress:

```bash
./scripts/quickdraw-automation.sh [target-count]
```

This script will:
- Create a practice repository
- Generate realistic issues
- Implement fixes automatically
- Track progress toward your goal

## Time Estimates

- **Bronze (1)**: 5 minutes
- **Silver (5)**: 30 minutes  
- **Gold (25)**: 2-3 hours
- **Platinum (125)**: 8-12 hours over multiple sessions

## Best Practices

### Do
- Create genuine value with each contribution
- Follow repository guidelines
- Write clear commit messages
- Engage respectfully with maintainers

### Don't
- Spam repositories with low-quality issues
- Close issues without proper resolution
- Ignore community guidelines
- Rush without reading existing discussions

## Tracking Progress

Monitor your achievement progress at:
`https://github.com/[username]?tab=achievements`

The Quickdraw badge will appear once you reach each tier threshold.

## Common Pitfalls

1. **Timing Issues** - Ensure you close within the 5-minute window
2. **Invalid Closures** - Make sure issues are properly resolved
3. **Repository Permissions** - Verify you can close issues in target repos
4. **Rate Limiting** - Pace your activities to avoid API limits

## Advanced Techniques

### Batch Processing
Process multiple simple issues in sequence for efficiency.

### Template Reuse
Develop templates for common issue types and fixes.

### Community Building
Engage with repositories where you can provide ongoing value.

## Troubleshooting

**Issue not counting toward achievement:**
- Verify the issue was closed within 5 minutes
- Check that you have proper permissions
- Ensure the repository is public

**Progress not updating:**
- GitHub achievements update with some delay
- Try refreshing your profile page
- Wait up to 24 hours for updates

## Next Steps

Once you achieve Quickdraw Platinum, consider:
- Contributing to the Pull Shark achievement
- Building toward Galaxy Brain through discussions
- Helping others achieve their GitHub goals
