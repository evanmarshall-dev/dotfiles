---
description: "Core code quality standards: security, performance principles, commenting, and error handling for all languages and frameworks"
applyTo: "**"
priority: 1
---

# Global Code Standards

## Core Principle

**Write secure, performant, self-documenting code by default.** These standards apply to all projects regardless of language or framework.

---

## Security First (OWASP-Based)

Your primary directive is to ensure all code is secure by default. When in doubt, choose the more secure option.

### Input Validation & Injection Prevention

- **No Raw SQL Queries:** Always use parameterized queries (prepared statements)
- **Prevent XSS:** Use context-aware output encoding (`.textContent` over `.innerHTML`)
- **Sanitize Command Input:** Use built-in argument escaping functions
- **Validate URLs:** Treat user-provided URLs as untrusted; use allowlist validation

### Access Control

- **Principle of Least Privilege:** Default to most restrictive permissions
- **Deny by Default:** Grant access only with explicit rules
- **Prevent Path Traversal:** Sanitize file paths (e.g., block `../../`)

### Cryptography & Secrets

- **Strong Algorithms:** Use Argon2/bcrypt for passwords, AES-256 for data
- **HTTPS Only:** Default to encrypted transport
- **No Hardcoded Secrets:** Read from environment variables or secret stores

  ```javascript
  // GOOD: Environment variable
  const apiKey = process.env.API_KEY;

  // BAD: Hardcoded secret
  const apiKey = "sk_live_12345";
  ```

### Session & Authentication

- **Secure Sessions:** Use `HttpOnly`, `Secure`, `SameSite=Strict` cookies
- **Rate Limiting:** Protect against brute force attacks
- **Session Regeneration:** Generate new session ID on login

### Configuration

- **Disable Debug in Production:** No verbose error messages
- **Set Security Headers:** CSP, HSTS, X-Content-Type-Options
- **Update Dependencies:** Use latest stable versions, scan for vulnerabilities

**Reference:** See `domains/security-detailed.md` for full OWASP Top 10 guidance

---

## Performance Principles

### Measure Before Optimizing

- Profile and measure first; identify real bottlenecks
- Use tools: Chrome DevTools, Lighthouse, language-specific profilers
- Set performance budgets and enforce them

### Optimization Hierarchy

1. **Optimize for common case:** Focus on frequently executed code paths
2. **Minimize resource usage:** CPU, memory, network, disk
3. **Prefer simplicity:** Simple algorithms are easier to optimize
4. **Document assumptions:** Comment performance-critical code

### Quick Wins

- **Cache expensive computations:** Use in-memory or distributed caches
- **Batch operations:** Reduce network/database round trips
- **Lazy load:** Defer non-critical resources
- **Compress assets:** Minify, bundle, use modern formats (WebP, AVIF)
- **Database indexes:** Index frequently queried columns
- **Connection pooling:** Reuse database/HTTP connections

### Frontend Specifics

- Minimize DOM manipulations (batch updates)
- Use virtual DOM frameworks efficiently
- Lazy load images (`loading="lazy"`)
- Defer/async non-critical scripts
- Use CDNs for static assets

### Backend Specifics

- Use async I/O (avoid blocking)
- Implement backpressure in queues
- Use streaming for large datasets
- Monitor latency and throughput

**Reference:** See `domains/performance-detailed.md` for comprehensive guide

---

## Self-Explanatory Code & Commenting

### Core Principle

**Write code that speaks for itself. Comment only to explain WHY, not WHAT.**

### When to Comment

✅ **Write comments for:**

- Complex business logic ("Why this calculation?")
- Non-obvious algorithms ("Using Floyd-Warshall because...")
- Regex patterns ("Matches email format: user@domain.ext")
- API constraints ("GitHub rate limit: 5000 req/hour")
- Configuration reasoning ("MAX_RETRIES = 3 based on...")

❌ **Avoid comments that:**

- State the obvious (`counter++; // Increment counter`)
- Repeat the code (`return user.name; // Return user's name`)
- Become outdated (`// Calculate at 5%` but code uses 8%)

### Decision Framework

Before writing a comment, ask:

1. Is the code self-explanatory? → No comment needed
2. Would a better name eliminate the need? → Refactor instead
3. Does this explain WHY, not WHAT? → Good comment
4. Will this help future maintainers? → Good comment

### Annotation Standards

```javascript
// TODO: Task to complete (with context)
// FIXME: Known bug that needs fixing
// HACK: Temporary workaround (explain why, add removal plan)
// NOTE: Important context or assumption
// WARNING: Side effect or danger (e.g., mutates original array)
// PERF: Performance consideration or optimization opportunity
// SECURITY: Security-related concern or validation
// DEPRECATED: Mark old APIs (provide alternative)
```

### Anti-Patterns

- Don't comment out code (use version control)
- Don't maintain history in comments
- Don't use decorative dividers

### Public APIs

Use JSDoc/docstrings for public functions:

```javascript
/**
 * Calculate compound interest using standard formula.
 *
 * @param {number} principal - Initial amount invested
 * @param {number} rate - Annual rate (decimal, e.g., 0.05 for 5%)
 * @param {number} time - Time period in years
 * @returns {number} Final amount after interest
 */
```

**Reference:** See `self-explanatory-code-commenting.instructions.md` for examples

---

## Error Handling

### General Principles

- **Fail Fast:** Validate input early, throw errors for invalid state
- **Be Specific:** Use specific error types, provide context
- **Handle Gracefully:** Catch expected errors, log unexpected ones
- **Clean Up:** Release resources in finally blocks or defer statements

### Patterns by Language

**JavaScript/TypeScript:**

```javascript
// Async error handling
try {
  const result = await riskyOperation();
} catch (error) {
  if (error instanceof ValidationError) {
    // Handle expected error
  } else {
    // Log unexpected error
    logger.error("Unexpected error:", error);
    throw error;
  }
}

// Promise chains
fetchData().then(process).catch(handleError).finally(cleanup);
```

**Python:**

```python
# Specific exception handling
try:
    result = risky_operation()
except ValueError as e:
    # Handle expected error
    logger.warning(f"Invalid value: {e}")
except Exception as e:
    # Log unexpected error
    logger.error(f"Unexpected error: {e}")
    raise
finally:
    cleanup()
```

### API Error Responses

Return consistent error format:

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required",
    "details": { "field": "email" }
  }
}
```

### Logging Best Practices

- Use structured logging (JSON key-value pairs)
- Include correlation IDs for request tracing
- Log at appropriate levels (DEBUG, INFO, WARN, ERROR)
- Don't log sensitive data (passwords, tokens, PII)
- Minimize logging in hot paths

---

## Code Quality Checklist

Before committing code, verify:

- [ ] No hardcoded secrets or credentials
- [ ] Input validation for all user-provided data
- [ ] Parameterized queries for database operations
- [ ] Proper error handling with specific error types
- [ ] Resources cleaned up (connections, files, timers)
- [ ] Performance-critical code is measured
- [ ] Comments explain WHY, not WHAT
- [ ] Security headers set for web responses
- [ ] Dependencies are up-to-date and scanned
- [ ] Code is accessible (WCAG AA for UI)

---

## References

- **Security:** `domains/security-detailed.md` (OWASP Top 10)
- **Performance:** `domains/performance-detailed.md` (Frontend, Backend, Database)
- **Accessibility:** `domains/accessibility.instructions.md` (WCAG 2.2)
- **Framework-Specific:** See `frameworks/` directory
- **Language-Specific:** See `languages/` directory
