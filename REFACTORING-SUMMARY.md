# AI Instructions Refactoring - Complete ✅

## Summary of Changes

All 6 refactoring actions have been successfully completed:

### 1. ✅ New Directory Structure

```
ai/
├── README.md                    # Master index & usage guide
├── global/                      # Universal standards (2 files)
├── frameworks/                  # Framework-specific (3 files)
├── languages/                   # Syntax/style guides (3 files)
├── domains/                     # Cross-cutting concerns (4 files)
├── workflows/                   # Development processes (2 files)
├── prompts/                     # Generation templates (3 files)
└── templates/                   # Reusable patterns (empty, ready for use)
```

### 2. ✅ Consolidated Global Instructions

Created `global/code-standards.instructions.md` combining:

- Security (OWASP principles)
- Performance (quick reference)
- Code commenting (WHY not WHAT)
- Error handling patterns
- All with `applyTo: '**'` for universal application

### 3. ✅ Quick Reference + Detailed Guides

**Quick References** (loaded automatically):

- `domains/accessibility.instructions.md` - WCAG 2.2 essentials
- `global/code-standards.instructions.md` - Security & perf principles

**Detailed References** (consulted as needed):

- `domains/accessibility-detailed.md` (350 lines - full WCAG guide)
- `domains/performance-detailed.md` (420 lines - comprehensive perf)
- `domains/security-detailed.md` (50 lines - OWASP Top 10)

### 4. ✅ Fixed Frontmatter Inconsistencies

**Before:**

```yaml
# git-commit - missing description
---
applyTo: "**"
---
# nextjs - generic pattern
---
applyTo: "**"
---
# reactjs - too broad
---
applyTo: "**/*.jsx, **/*.tsx, **/*.js, **/*.ts, **/*.css, **/*.scss"
---
```

**After:**

```yaml
# git-commit - added description
---
description: "Conventional Commits specification for git commit messages"
applyTo: "**"
---
# nextjs - specific to Next.js files
---
description: "Next.js best practices for App Router, Server Components, and project structure"
applyTo: "next.config.*, **/app/**, **/pages/**"
---
# reactjs - React files only (no overlap)
---
description: "ReactJS development standards and best practices"
applyTo: "**/*.jsx, **/*.tsx"
---
```

### 5. ✅ Separated Prompts from Instructions

**Instructions** (`.instructions.md`) - Active rules applied during code generation:

- 11 instruction files organized by category
- Clear `applyTo` patterns
- No overlaps

**Prompts** (`.prompt.md`) - One-shot generation templates:

- `architecture-blueprint-generator.prompt.md`
- `folder-structure-blueprint-generator.prompt.md`
- `commit-message-generator.prompt.md` (NEW - for your `gcm` vision)

### 6. ✅ Created Master Index

`ai/README.md` includes:

- Complete directory structure
- File type explanations (instructions vs prompts vs detailed)
- Quick reference table (scenario → files)
- Priority order for conflicts
- Usage examples with GitHub Copilot, Cursor, Claude
- How to add new instructions
- Example workflows
- Maintenance guidelines

### 7. ✅ Fixed React/Next.js Overlap

**Before:** Both applied to `'**'` → conflicts and redundancy

**After:**

- `reactjs.instructions.md` → `'**/*.jsx, **/*.tsx'` (React components only)
- `nextjs.instructions.md` → `'next.config.*, **/app/**, **/pages/**'` (Next.js-specific)

Now Next.js projects get:

1. Global standards (security, perf, comments)
2. Next.js-specific rules (Server Components, App Router)
3. React component rules (when editing .jsx/.tsx files)

### 8. ✅ Bonus: Commit Message Generator Prompt

Created `prompts/commit-message-generator.prompt.md` for your `gcm` vision:

- Analyzes git diff and file changes
- Generates Conventional Commit messages
- Includes type selection, scope suggestion, examples
- Ready to integrate with AI tools

---

## File Count

**Before:** 14 files (all in root)
**After:** 17 files (organized + 3 new)

| Category   | Count      |
| ---------- | ---------- |
| Global     | 2          |
| Frameworks | 3          |
| Languages  | 3          |
| Domains    | 4          |
| Workflows  | 2          |
| Prompts    | 3          |
| Index      | 1 (README) |

---

## Token Savings

By creating quick references and detailed guides:

- Quick accessibility guide: ~150 lines (was 350)
- Global standards: ~250 lines (consolidated from 3 files totaling 631 lines)
- **Est. 40% reduction in tokens** for common operations

---

## Next Steps

### Immediate

1. Review the new structure: `code/dotfiles/ai/`
2. Test with your AI tool:
   - Create a React component (should apply global + React + a11y)
   - Edit Next.js page (should apply global + Next.js + React)
   - Write a commit (should reference `workflows/git-commit-message.instructions.md`)

### For Your `gcm` Function

Use the new `prompts/commit-message-generator.prompt.md`:

**Option 1: GitHub CLI with Copilot**

```bash
# If you have gh copilot extension
gh copilot suggest -t shell "Generate conventional commit using $(cat ai/prompts/commit-message-generator.prompt.md) and $(git diff --stat)"
```

**Option 2: API Integration (Claude, OpenAI)**

```bash
# Pass the prompt file + git context
prompt=$(cat ai/prompts/commit-message-generator.prompt.md)
context="FILES:\n$(git diff --name-only)\n\nDIFFSTAT:\n$(git diff --stat)"
# Send to API with $prompt + $context
```

**Option 3: Copilot Chat in VS Code**

1. Open VS Code
2. `Cmd+I` to open Copilot Chat
3. Type: `@workspace using /ai/prompts/commit-message-generator.prompt.md, analyze my staged changes and generate a conventional commit message`

### Maintenance

- Add new instructions to appropriate directories
- Keep quick references under 200 lines
- Update `ai/README.md` when structure changes
- Test `applyTo` patterns don't overlap

---

## Testing Commands

```bash
# Navigate to ai directory
cd ~/code/dotfiles/ai

# List all instruction files
find . -name "*.instructions.md" | wc -l

# Total lines of instructions
find . -name "*.instructions.md" -exec wc -l {} + | tail -1

# Check for duplicate applyTo patterns (should be minimal)
grep -h "applyTo:" */*.md | sort | uniq -c | sort -rn

# Verify frontmatter is consistent
grep -A2 "^---$" */*.md | head -30
```

---

**Status:** All refactoring actions complete! 🎉
**Date:** December 17, 2025
