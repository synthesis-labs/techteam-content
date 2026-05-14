---
theme: default
title: Notes on Working with Agents
info: |
  Code Connect Summit 2026 — Tom Wells
class: text-center
highlighter: shiki
lineNumbers: false
drawings:
  persist: false
mdc: true
fonts:
  sans: Inter
  mono: JetBrains Mono
layout: cover
subtitle: Some things worth rethinking
author: "Tom Wells"
date: "TBD"
eyebrow: "CODE CONNECT SUMMIT · 2026"
organisation: "Synthesis"
logo: /synthesis-logo.png
---

<style>
:root {
  --deck-navy: #0D1120;
  --deck-navy-deep: #162440;
  --deck-blue-accent: #4D7EF7;
  --deck-blue-pale: #A5B4FC;
  --deck-body-ink: #1A1F2E;
  --deck-muted: #6B7280;
  --deck-border-cool: #E2E8F0;
  --deck-tip-bg: #EEF2FF;
  --deck-tip-border: #4D7EF7;
  --deck-tip-title: #1D3476;
  --deck-warn-bg: #FFF5F0;
  --deck-warn-border: #C2400C;
}

.slidev-layout {
  font-family: Inter, "Helvetica Neue", system-ui, sans-serif;
  color: var(--deck-body-ink);
}

.slidev-layout h1 {
  color: var(--deck-navy);
  font-weight: 600;
  letter-spacing: -0.01em;
}

.slidev-layout h2 {
  color: var(--deck-navy);
  font-weight: 600;
}

.slidev-layout.default h1::after {
  content: "";
  display: block;
  width: 56px;
  height: 3px;
  background: var(--deck-blue-accent);
  margin-top: 0.4em;
  margin-bottom: 0.2em;
}

.slidev-layout code {
  font-family: "JetBrains Mono", "Fira Code", monospace;
}

.slidev-layout pre {
  font-size: 0.85em;
  border-radius: 6px;
}

.slidev-layout table {
  font-size: 0.95em;
}

.slidev-layout th {
  color: var(--deck-navy);
  font-weight: 600;
  text-align: left;
  border-bottom: 2px solid var(--deck-border-cool);
  padding: 0.5em 0.8em;
}

.slidev-layout td {
  border-bottom: 1px solid var(--deck-border-cool);
  padding: 0.5em 0.8em;
}

.text-accent { color: var(--deck-blue-accent); }
.text-muted  { color: var(--deck-muted); }
.text-navy   { color: var(--deck-navy); }
</style>

---
layout: section
number: "01"
title: Rethink the OS
subtitle: The runtime environment wasn't built for this
---

---

# Tuesday's workload

<div class="grid grid-cols-2 gap-12 mt-4">
<div>

**Running in parallel, right now:**
- Building this presentation
- Writing a strategy document
- Simulating a new architecture
- Writing the architecture review
- Distilling it into a deck
- Building a reference implementation
- 1:1s, meetings, coffee

</div>
<div>

**What we actually need:**
- Keyboard-driven workspace switching
- True concurrent workspace isolation
- Tiling layout for multi-context work
- A compositor built for this workflow

<div class="mt-4 text-accent font-semibold">Omarchy + Wayland + Hyprland</div>

</div>
</div>

<div class="mt-6 text-muted text-sm italic">
That's not a hypothetical workload. That's Tuesday.
</div>

---
layout: section
number: "02"
title: Everything is a Pipeline
subtitle: Source control isn't just for code
---

---

# Documents are software

<BeforeAfter>
<template #before>

Draft in Word  
→ Save to SharePoint  
→ Attach to email  
→ Send for review  
→ 14 conflicting versions  
→ Agents can't read any of it

</template>
<template #after>

Source text (Typst / Markdown)  
→ Build pipeline  
→ Committed to git  
→ Published to GitHub Pages  
→ Agents can read, diff, and collaborate

</template>
</BeforeAfter>

<Principle class="mt-4">
Every artifact has source, a build, and a release. Treat it like software.
</Principle>

---
layout: section
number: "03"
title: Make Knowledge Work Transparent
subtitle: The BA pipeline shouldn't be a black box
---

---

# From black box to audit trail

<div class="pipeline mt-6 mb-6">
  <span class="step">Source docs</span>
  <span class="arrow">→</span>
  <span class="step">Analysis</span>
  <span class="arrow">→</span>
  <span class="step">Findings</span>
  <span class="arrow">→</span>
  <span class="step">Recommendations</span>
  <span class="arrow">→</span>
  <span class="step final">Published</span>
</div>

Each stage is a committed artifact. The reasoning doesn't disappear when the document is emailed.

<Principle>
"Why did we recommend X?" should have a traceable answer in git history.
</Principle>

<style scoped>
.pipeline { display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap; }
.step { background: var(--deck-tip-bg); border: 1px solid var(--deck-tip-border); padding: 0.35rem 0.75rem; border-radius: 4px; font-size: 0.85rem; font-weight: 500; color: var(--deck-navy); }
.step.final { background: var(--deck-navy); color: white; border-color: var(--deck-navy); }
.arrow { color: var(--deck-blue-accent); font-weight: bold; }
</style>

---
layout: center
class: text-center
---

# Now: the code itself.

---
layout: section
number: "04"
title: Encode Architecture in Types
subtitle: Effect systems as structural guardrails
---

---

# Effects don't lie

```haskell
processOrder
  :: (PaymentGateway :> es, EmailNotification :> es, OrderRepo :> es)
  => Order -> Eff es Result
```

The type is a complete description of what this function does. Agents can't sneak a database write into a function that wasn't supposed to touch the database — the compiler rejects it.

<Principle class="mt-6">
Types are a compression format for architectural intent. You write the architecture once; every agent is constrained by it forever.
</Principle>

---
layout: section
number: "05"
title: Agents Build the Hard Abstractions
subtitle: Keep the agentic surface small and clean
---

---

# Tiny surface. Huge infrastructure underneath.

```kotlin
object InvoiceAggregate : Aggregate<
    InvoiceCommand.Create, InvoiceCommand.Mutate,
    InvoiceEvent.ForCreate, InvoiceEvent.ForMutate,
    InvoiceEvent, Invoice, InvoiceDeps> {

    override fun processCreate(cmd: InvoiceCommand.Create, deps: InvoiceDeps): InvoiceEvent.ForCreate = ...
    override fun processMutate(cmd: InvoiceCommand.Mutate, entity: Versioned<Invoice>, deps: InvoiceDeps): InvoiceEvent.ForMutate = ...
    override fun evolveCreate(event: InvoiceEvent.ForCreate): Versioned<Invoice> = ...
    override fun evolveMutate(entity: Versioned<Invoice>, event: InvoiceEvent.ForMutate): Versioned<Invoice>? = ...
}
```

<div class="mt-3 text-muted text-sm">Hidden underneath: Kafka Streams topology · vector clock dep tracking · OCC version checks · deferred retry queues</div>

<Principle class="mt-3">
Agents design the framework. Agents and humans alike use it.
</Principle>

---
layout: end
title: Thank you
eyebrow: QUESTIONS WELCOME
speaker: "Tom Wells"
organisation: "Synthesis"
email: "tom@synthesis.co.za"
footer: "Code Connect Summit · TBD"
---
