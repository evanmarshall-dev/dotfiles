# AI Instructions & Prompts

**Comprehensive guidance for code generation, reviews, and development workflows using AI assistants.**

## 📁 Directory Structure

```
ai/
├── README.md                           # This file
│
├── global/                             # Universal standards (all projects)
│   ├── code-standards.instructions.md  # Security, performance, commenting, errors
│   └── self-explanatory-code-commenting.instructions.md  # Detailed commenting guide
│
├── frameworks/                         # Framework-specific best practices
│   ├── nextjs.instructions.md          # Next.js App Router, Server Components
│   ├── reactjs.instructions.md         # React hooks, patterns, composition
│   └── nodejs-javascript-vitest.instructions.md  # Node.js + Vitest testing
│
├── languages/                          # Language/syntax-specific guides
│   ├── css-modules-mobile-first.instructions.md  # Mobile-first CSS Modules
│   ├── scss-modules.instructions.md    # Sass modules and partials
│   └── markdown.instructions.md        # Documentation standards
│
├── domains/                            # Cross-cutting concerns (detailed references)
│   ├── accessibility.instructions.md   # Quick WCAG 2.2 AA reference
│   ├── accessibility-detailed.md       # Full accessibility guide (350 lines)
│   ├── performance-detailed.md         # Comprehensive performance guide (420 lines)
│   └── security-detailed.md            # Full OWASP Top 10 guide
│
├── workflows/                          # Development workflows and processes
│   ├── git-commit-message.instructions.md  # Conventional Commits spec
│   └── github-actions-ci-cd-best-practices.instructions.md  # CI/CD patterns
│
├── prompts/                            # One-shot generation templates
│   ├── architecture-blueprint-generator.prompt.md
│   └── folder-structure-blueprint-generator.prompt.md
│
└── templates/                          # Reusable code templates
    └── (empty - add component, API route templates as needed)
```

---

## 🎯 How It Works

### File Types

1. **`.instructions.md`** - Active rules that AI applies during code generation/review
2. **`.prompt.md`** - Templates for one-shot generation tasks (architecture, scaffolding)
3. **`-detailed.md`** - Reference documentation (not always loaded, consulted as needed)

### Frontmatter Format

Each instruction file has YAML frontmatter:

```yaml
---
description: "Brief description of what this file provides"
applyTo: "**/*.js" # Glob pattern for when to apply
priority: 1 # Optional: Higher = applied first (default: 100)
---
```

### Apply Patterns

| Pattern         | Applies To          | Example                          |
| --------------- | ------------------- | -------------------------------- |
| `**` or `'**'`  | All files globally  | Security, performance principles |
| `**/*.jsx`      | Specific file types | React components                 |
| `next.config.*` | Config files        | Next.js settings                 |
| `**/app/**`     | Directory contents  | Next.js App Router               |

---

## 📚 Quick Reference

### By Scenario

| I'm working on...     | Check these files                                                          |
| --------------------- | -------------------------------------------------------------------------- |
| **Any code**          | `global/code-standards.instructions.md`                                    |
| **React component**   | `frameworks/reactjs.instructions.md`                                       |
| **Next.js app**       | `frameworks/nextjs.instructions.md` + `frameworks/reactjs.instructions.md` |
| **Accessible UI**     | `domains/accessibility.instructions.md` (quick) or `-detailed.md` (full)   |
| **Performance issue** | `domains/performance-detailed.md`                                          |
| **Security review**   | `domains/security-detailed.md`                                             |
| **Git commit**        | `workflows/git-commit-message.instructions.md`                             |
| **CI/CD pipeline**    | `workflows/github-actions-ci-cd-best-practices.instructions.md`            |
| **Styles (CSS)**      | `languages/css-modules-mobile-first.instructions.md`                       |
| **Styles (Sass)**     | `languages/scss-modules.instructions.md`                                   |
| **Documentation**     | `languages/markdown.instructions.md`                                       |

### Priority Order (when conflicts arise)

1. **Security** always wins (OWASP principles from `global/code-standards.instructions.md`)
2. **Accessibility** is non-negotiable (WCAG 2.2 AA from `domains/accessibility.instructions.md`)
3. **Framework-specific** overrides general patterns (e.g., Next.js over React for routing)
4. **Language-specific** overrides generic (e.g., TypeScript strict types)
5. **Performance** optimizations applied after correctness and security

---

## ✅ Core Principles (Always Active)

From `global/code-standards.instructions.md`:

1. **Security First** - No hardcoded secrets, parameterized queries, input validation
2. **Performance Measured** - Profile before optimizing, set budgets
3. **Self-Documenting Code** - Comment WHY not WHAT
4. **Accessibility Built-In** - WCAG 2.2 AA compliance
5. **Error Handling** - Fail fast, specific errors, clean up resources

---

## 🔧 How to Use These Files

### With GitHub Copilot

1. **Workspace-wide:** Place in your VS Code settings or workspace `.vscode/settings.json`
2. **Chat prompts:** Reference files with `@workspace /ai/domains/accessibility.instructions.md`
3. **File context:** Copilot automatically applies matching `applyTo` patterns

### With Cursor/Claude

1. Add to `.cursorrules` or `.claude/` config
2. Reference in chat: "Follow the instructions in ai/frameworks/nextjs.instructions.md"

### With Custom Scripts

Parse frontmatter to dynamically load instructions based on file being edited:

```javascript
const matter = require("gray-matter");
const instruction = matter.read("ai/global/code-standards.instructions.md");
console.log(instruction.data.applyTo); // '**'
console.log(instruction.content); // Instruction text
```

---

## 📝 Adding New Instructions

### 1. Choose the Right Directory

- **Global** - Applies to all code (security, errors, general patterns)
- **Frameworks** - Specific to React, Next.js, Express, etc.
- **Languages** - Syntax, style guides (TypeScript, Python, CSS)
- **Domains** - Cross-cutting concerns (a11y, perf, testing)
- **Workflows** - Process guides (git, CI/CD, code review)
- **Prompts** - One-shot generation templates

### 2. Create the File

```markdown
---
description: "Brief description (shows in indexes)"
applyTo: "**/*.ts" # Glob pattern
priority: 100 # Optional: default is 100, lower = later
---

# Title

## Section

Guidelines and examples...
```

### 3. Test It

- Generate code matching the `applyTo` pattern
- Verify AI applies the instructions
- Check for conflicts with existing rules

---

## 🔄 Maintenance

### Refactoring Checklist

When updating instructions:

- [ ] Update description in frontmatter
- [ ] Verify `applyTo` pattern is specific enough
- [ ] Check for duplicates/conflicts with other files
- [ ] Test with actual code generation
- [ ] Update this README if structure changes

### File Size Guidelines

- **Quick reference** (<200 lines): Keep as `.instructions.md`
- **Detailed guide** (>200 lines): Create `-detailed.md` reference file
- **Comprehensive** (>400 lines): Consider splitting into focused files

---

## 🚀 Example Workflows

### Creating a New React Component

**AI will apply (in order):**

1. `global/code-standards.instructions.md` - Security, errors, comments
2. `frameworks/reactjs.instructions.md` - Hooks, composition, TypeScript
3. `domains/accessibility.instructions.md` - WCAG compliance
4. `languages/css-modules-mobile-first.instructions.md` - Styling (if CSS file)

### Writing a Git Commit

**AI will apply:**

1. `workflows/git-commit-message.instructions.md` - Conventional Commits format

### Building a Next.js API Route

**AI will apply:**

1. `global/code-standards.instructions.md` - Security, errors
2. `frameworks/nextjs.instructions.md` - Route handlers, validation
3. `domains/security-detailed.md` - Input validation, rate limiting (if referenced)

---

## 🎓 Learning Resources

### Official Docs Referenced

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [React Docs](https://react.dev/)
- [Next.js Docs](https://nextjs.org/docs)

### Tools Mentioned

- [Accessibility Insights](https://accessibilityinsights.io/)
- [Lighthouse](https://developers.google.com/web/tools/lighthouse)
- [Chrome DevTools](https://developer.chrome.com/docs/devtools/)

---

## 📞 Contributing

To propose changes to instructions:

1. Test the change in a real project
2. Document the motivation (what problem does it solve?)
3. Check for conflicts with existing rules
4. Update examples to show before/after
5. Add to the appropriate directory

---

## 📊 Statistics

```bash
# Count total instruction files
find ai -name "*.instructions.md" | wc -l

# Total lines of instructions
find ai -name "*.instructions.md" -exec wc -l {} + | tail -1

# List files by size
find ai -name "*.instructions.md" -exec wc -l {} + | sort -rn
```

---

**Last Updated:** December 17, 2025
**Maintained by:** Evan Marshall
