---
description: 'Best practices for Sass (Dart Sass) modules, partials, and migration from @import and global built-ins.'
applyTo: '**/*.scss'
---

# SCSS Modules & Partials — Guidance for Copilot

This instruction file summarizes recommended patterns for working with Dart Sass (`@use`/`@forward`) and for migrating away from deprecated features like `@import` and global built-ins (e.g., `type-of`, `unit`, `unitless`, `map`, and `math`). Apply these rules when generating or refactoring SCSS partials.

## Core principles

- Use the module system (`@use` / `@forward`) instead of `@import`.
- Make dependencies explicit: each partial should `@use` the modules it needs.
- Namespace imports (e.g., `@use "abstracts/index" as abs;`) to avoid collisions.
- Prefer wrapper helpers (mixins/functions) in `abstracts/` to centralize behavior (e.g., `space()`, `to-rem()`).
- Avoid `@use ... as *` unless the file is simple and isolated.

Patterns and examples
- abstracts/_index.scss (forward public API):
  @forward "variables";
  @forward "functions";
  @forward "mixins";

- consumer partial (component or page):
  @use "../abstracts/index" as abs;
  @use "sass:map" as map;

  .card {
    padding: abs.space(3);
    @include abs.responsive-container();
  }

Core module usage
- Always import core modules with `@use`, and alias them briefly:
  - `@use "sass:map" as map;`
  - `@use "sass:math" as math;`
  - `@use "sass:meta" as meta;`
- Replace deprecated global helpers:
  - `type-of()` → `meta.type-of()`
  - `unit()` → `math.unit()`
  - `unitless()` → check `math.unit()` or create an `is-unitless()` wrapper

Placeholders vs Mixins
- Placeholders (`%foo`) and `@extend` still work but are awkward across modules because `@extend` cannot reference namespaced placeholders.
- Recommendation: expose shared patterns as mixins in `abstracts/_mixins.scss`. If you must keep placeholders for selector-merging, provide a mixin wrapper that performs the `@extend` locally and document the pattern.

Migration checklist (automatable)
- Replace `@import` with explicit `@use` / `@forward`.
- Add an `abstracts/_index.scss` that forwards variables/functions/mixins.
- Replace global built-in calls with `sass:` module equivalents.
- Convert cross-module placeholders into mixins or keep placeholders local + expose wrappers.
- Replace raw `map.get(vars.$space-scale, key)` calls with a `space()` helper.

Build-time convenience (optional)
- If your project prefers implicit convenience, inject a per-file `@use` via build config (Vite's `css.preprocessorOptions.scss.additionalData` or webpack `sass-loader` `prependData`) to provide a global shorthand (e.g., `@use "src/styles/abstracts/index" as abs;`).
- Caveat: this hides dependencies from file-level source and can make the dependency graph less explicit. Prefer explicit `@use` for team projects.

## Notes for code generation

- When generating SCSS code, always produce `@use` statements for dependencies at the top of the generated partial.
- Use namespaced calls in generated code (avoid unprefixed `map.get` or `type-of`).

Example — interpolation in CSS fallbacks

When inserting a Sass value into a CSS function fallback (for example `var(--x, FALLBACK)`), interpolate the Sass expression so the compiled CSS receives a proper fallback token. For example:

```scss
@use "../abstracts/index" as abs;

.stack {
  /* interpolation is required when the Sass value is used inside var(..., FALLBACK) */
  gap: var(--stack-gap, /* fallback: abs.space(3) */ );
}
```

References
- Sass documentation — module system: https://sass-lang.com/documentation/at-rules/use
- Migrating from `@import`: https://sass-lang.com/d/import

