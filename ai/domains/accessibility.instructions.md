---
description: "Quick reference for accessibility best practices - WCAG 2.2 Level AA compliance"
applyTo: "**"
---

# Accessibility Quick Reference

## Core Principle

Code must conform to [WCAG 2.2 Level AA](https://www.w3.org/TR/WCAG22/). Go beyond minimal conformance for inclusive experiences.

**Disclaimer:** This was built with accessibility in mind, but issues may still exist. Review and test with tools like [Accessibility Insights](https://accessibilityinsights.io/).

---

## Keyboard Navigation

### Essentials

- ✅ All interactive elements must be keyboard navigable
- ✅ Focus must be clearly visible at all times
- ✅ Tab order must follow logical reading order
- ❌ Static elements should NOT be in tab order (no `tabindex` unless `tabindex="-1"` for programmatic focus)
- ❌ Hidden elements must NOT be focusable

### Keyboard Commands

- `Tab` - Navigate to next interactive element
- `Arrow keys` - Navigate within composite components (menus, grids, listboxes)
- `Enter/Space` - Activate controls
- `Escape` - Close dialogs, menus, popups

### Skip Links (Required)

```html
<a href="#maincontent" class="sr-only">Skip to main</a>
<!-- header/nav content -->
<main id="maincontent"></main>
```

```css
.sr-only:not(:focus):not(:active) {
  clip: rect(0 0 0 0);
  clip-path: inset(50%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}
```

---

## Screen Reader Support

### Semantic Structure

- ✅ Use landmarks: `<header>`, `<nav>`, `<main>`, `<footer>`
- ✅ Use headings to introduce sections (`<h1>` - `<h6>`)
- ✅ One `<h1>` per page describing overall topic
- ❌ Don't skip heading levels

### Forms

- ✅ Every input needs a `<label>` with `for` attribute
- ✅ Mark required fields: `aria-required="true"` + visual indicator (asterisk)
- ✅ Error messages: `aria-invalid="true"` + `aria-describedby`
- ✅ Submit buttons should NOT be disabled (show errors on submit instead)

```html
<label for="email">Email *</label>
<input
  id="email"
  type="email"
  aria-required="true"
  aria-invalid="true"
  aria-describedby="email-error"
/>
<span id="email-error">Please enter a valid email</span>
```

### Images

```html
<!-- Informative image -->
<img src="chart.png" alt="Q4 sales increased 25% over Q3" />

<!-- Decorative image -->
<img src="decorative.png" alt="" />

<!-- SVG with role -->
<svg role="img" aria-label="Dashboard icon">...</svg>

<!-- Icon font -->
<span role="img" aria-label="Warning">⚠️</span>
```

---

## Visual & Color Contrast

### Contrast Requirements

- **Normal text:** 4.5:1 minimum
- **Large text (18.5px bold or 24px):** 3:1 minimum
- **UI components/graphics:** 3:1 minimum

### Color Rules

- ❌ Don't use color alone to convey information
- ✅ Use text labels + color for status indicators
- ✅ Use icons + color for alerts

```html
<!-- BAD: Color only -->
<span style="color: red;">Error</span>

<!-- GOOD: Icon + color + text -->
<span style="color: red;">
  <svg aria-hidden="true"><!-- error icon --></svg>
  Error: Invalid input
</span>
```

---

## Interactive Components

### Buttons & Links

- Buttons perform actions (`<button>`)
- Links navigate (`<a href>`)
- Visual label must match accessible name
- If using `aria-label`, it must contain the visual label text

```html
<!-- Voice access: "Click Save" -->
<button aria-label="Save changes">Save</button>
```

### Modals/Dialogs

- Use `role="dialog"` and `aria-modal="true"`
- Focus management: trap focus inside dialog
- Close with `Escape` key
- Return focus to trigger element on close

```html
<div role="dialog" aria-modal="true" aria-labelledby="dialog-title">
  <h2 id="dialog-title">Confirm Action</h2>
  <!-- content -->
  <button>Cancel</button>
  <button>Confirm</button>
</div>
```

### Tables

```html
<table>
  <tr>
    <th>Name</th>
    <th>Email</th>
  </tr>
  <tr>
    <th>John Doe</th>
    <td>john@example.com</td>
  </tr>
</table>
```

---

## Navigation & Menus

### Nav Structure

```html
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li>
      <button aria-expanded="false">Products</button>
      <ul hidden>
        <li><a href="/products/1">Product 1</a></li>
      </ul>
    </li>
  </ul>
</nav>
```

### Roving Tabindex

- Container has `tabindex="0"`
- Active child has `tabindex="0"`
- Other children have `tabindex="-1"`
- Arrow keys move focus and update tabindex

---

## ARIA Best Practices

### Use Semantic HTML First

```html
<!-- GOOD: Native HTML -->
<button>Click me</button>

<!-- BAD: Unnecessary ARIA -->
<div role="button" tabindex="0">Click me</div>
```

### Common ARIA Attributes

- `aria-label` - Accessible name
- `aria-labelledby` - Reference to label element(s)
- `aria-describedby` - Reference to description element(s)
- `aria-hidden="true"` - Hide from screen readers
- `aria-live="polite"` - Announce dynamic updates
- `aria-expanded` - Collapsible state
- `aria-current="page"` - Current item in nav

---

## Testing Checklist

- [ ] All interactive elements keyboard accessible
- [ ] Focus visible at all times
- [ ] Skip link present and functional
- [ ] All images have appropriate alt text
- [ ] Forms have labels and error handling
- [ ] Color contrast meets WCAG AA
- [ ] No color-only information
- [ ] Semantic HTML used throughout
- [ ] ARIA used only when necessary
- [ ] Test with screen reader (VoiceOver, NVDA, JAWS)
- [ ] Test with keyboard only (no mouse)
- [ ] Run automated tools (Lighthouse, axe DevTools)

---

**Full Details:** See `domains/accessibility-detailed.md` for comprehensive WCAG 2.2 compliance guide
