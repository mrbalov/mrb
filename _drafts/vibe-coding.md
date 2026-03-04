# Agentic Development in Practice: From Vibe-Coding to Structured Skills & Hooks

## 1. Context & Motivation (5 min)

### Slides

* Who I am (lead engineer, built TORQ)
* What TORQ is
* What “vibe-coded from scratch” means
* What spec-driven development means
* Why agentic development matters now

### Keys

- This is not a talk about prompts and prompting.
- This is about architecture, feedback loops, and delegation to AI.
- AI is no longer autocomplete.
- AI is becoming a system actor.

## 2. AI Foundations (10 min)

### Slides

* Context is memory
* Prompt = runtime configuration
* Tools = function calling
* System prompts = policy layer
* Models (AI Services) are stateless by default

### Diagram

```
User → Prompt → (Orchestration) Model → Tool Call → Tool Result → (Orchestration) Model → Response
```

### Keys

* When Claude edits code, it's not “thinking”.
* It is pattern completion constrained by context.

## 3. What Is Agentic Development? (10 min)

### Slides

- Code editor inline suggestions.
- Scoped reasoning inside a file.
- Tool-using agent: Call tools, Execute code, Inspect repo, Iterate.
- Orchestrated Agent: agents.md, skills, hooks.

### Keys

- Agentic development = delegating **structured** tasks to an AI system that can act, inspect, and iterate using tools.
- Autonomy (bounded).
- Tool usage.
- Iteration.
- Memory.
- Feedback loops.

## 4. Skills & Hooks Deep Dive (10 min)

### Slides

- Skills: Reusable structured prompts / capabilities.
  - “Refactor to atomic design”
  - “Convert to server component”
  - “Extract hooks”
  - “Improve accessibility”
  - Skills = composable behaviors
  - They reduce prompt entropy
  - They act like internal APIs for the agent
- Hooks: Event-driven triggers.
  - On file change → re-evaluate architecture
  - On new component → enforce naming conventions
  - On PR → run architectural analysis
  - Hooks create: Feedback loops, Guardrails, and Consistency.

## 5. Tooling Comparison (5 min)

### Slides

- CodeMie CLI
- Cursor
- GitHub Copilot

## 6. Practical Things (5 min)

### Slides

- Plan with heavy model, implement with a simple one.
- Divide and conquer: go with small context and a small task.

## 7. Closing Thought

### Slides

The real shift is not AI writing code. It’s engineers designing systems that include AI as an actor.
