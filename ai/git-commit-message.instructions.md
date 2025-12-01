---
applyTo: '**'
---
## Commit Style Guide

We follow the Conventional Commits specification for our commit messages.

**Commit Types:**
*   `feat`: A new feature.
*   `fix`: A bug fix.
*   `docs`: Documentation-only changes.
*   `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc.).
*   `refactor`: A code change that neither fixes a bug nor adds a feature.
*   `test`: Adding missing tests or correcting existing tests.
*   `chore`: Changes to the build process or auxiliary tools.

**Subject Line:**
*   Format: `type(scope): description`
*   Use imperative mood (e.g., "Add new feature").
*   Keep under 50 characters.

**Body (Optional):**
*   Provide a more detailed explanation of the changes.
*   Use bullet points for clarity.
*   Explain the motivation behind the change.

**Files Reference:**
*   Mentions the key files (excluding .gitignore, node_modules, and lockfiles as requested)

**Extra Information (Optional):**
*   Do not be afraid to include emojis as they can help convey the message more effectively.
*   Make sure that your output for the commit message is in a format easily copied.