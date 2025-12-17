---
description: 'Best practices for writing CSS Modules in a mobile-first, modular way.'
applyTo: '**'
---

# Modern Mobile-First CSS Module Instructions

- **Mobile-first**: Write all default styles for the smallest screens at the top, outside any media queries.

- **Modern nesting**: Use modern CSS nesting syntax. Place media queries and child selectors inside the main selector block.

- **Progressive enhancement**: Use @media (width >= ...) for larger breakpoints, nested inside the selector.

- **DRY**: Only override or add properties that change at each breakpoint.

- **Modular**: Scope all styles to the component/module. Avoid global selectors.

**Example**:

```css
.myClass {
  /* mobile defaults */
  padding: 1rem;
  font-size: 1rem;

  @media (width >= 600px) {
    /* tablet overrides */
    font-size: 1.25rem;
  }

  @media (width >= 1024px) {
    /* desktop overrides */
    font-size: 1.5rem;
    padding: 2rem;
  }

  .child {
    /* nested child styles */
    color: var(--color-primary);
  }
}
```

- **Best practices**:

  - Use CSS custom properties for colors, spacing, etc.
  - Prefer logical properties (e.g., margin-inline, padding-block) for better internationalization.
  - Keep selectors flat and avoid unnecessary specificity.