---
theme: default
title: "(Notes on)<br>Working with Agents"
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
author: "Tom Wells"
date: "5 June 2026"
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
layout: center
class: text-center
---

# First: The boring stuff.

---
layout: section
number: "01"
title: Rethink the OS
subtitle: The desktop environment wasn't built for this
---

---

# Tuesday's workload

<div class="grid grid-cols-2 gap-12 mt-4">
<div>

**Running in parallel:**
- Building this presentation
- Writing a strategy document
- Simulating a new architecture
- Writing the architecture review
- Distilling it into a deck
- Building a reference implementation
- 1:1s, meetings, coffee, food

</div>
<div>

**What we actually need:**
- Higher information density — see more at once
- Fast, low-friction context switching
- Isolated workspaces per project or task
- No hunting for windows, files, or applications
- No cognitive overhead between switches

<div class="mt-4 text-muted text-sm">(Omarchy + Hyprland — seems like a great option!)</div>

</div>
</div>

---

<img src="/mac_agents_1.png" class="absolute inset-0 w-full h-full object-contain" />

---

<img src="/omarchy_agents_1.png" class="absolute inset-0 w-full h-full object-contain" />

---

<img src="/omarchy_agents_2.png" class="absolute inset-0 w-full h-full object-contain" />

---
layout: section
number: "02"
title: Everything is now a Pipeline
subtitle: Source control & DevOps isn't just for code
---

---

# Documents are software

<BeforeAfter>
<template #before>

→ Draft in Word  
→ Save to SharePoint  
→ Attach to email  
→ Send for review  
→ Receive updates  
→ Merge 14 conflicting versions (really fun!)  
→ Agents can't really help for any of this  

</template>
<template #after>

→ Source text (Typst / Markdown)  
→ Build pipeline (text -> pdf / html / whatever)  
→ Committed to git  
→ Automatically published to GitHub Pages  
→ Agents can read, diff, and collaborate - conflict-free  

</template>
</BeforeAfter>

<Principle class="mt-4">
Recognising that every artifact has a source, a build, and a release. Treat it like software.
</Principle>

---

# Business analysis is software

<BeforeAfter>
<template #before>

→ Analyst reads source docs privately  
→ Distils findings on their laptop  
→ Produces a report or deck  
→ Emails it out  
→ Reasoning is gone. Only the output survives.

</template>
<template #after>

→ Source docs committed to git  
→ Analysis as committed artifacts  
→ Findings → Recommendations → Published  
→ Every step traceable, diffable, reviewable

</template>
</BeforeAfter>

<Principle class="mt-4">
"Why did we recommend X?" or "What information did we consider when we decided to do Y?"
</Principle>

---

# Operations is software

<div class="grid grid-cols-2 gap-12 mt-4">
<div>

**Every role has a pipeline:**
- Finance — budgets, forecasts, approvals
- Resourcing — allocations, capacity, hiring
- Sales — proposals, pipeline, orders
- Operations — invoices, contracts, compliance

</div>
<div>

**We should be acting like engineering managers & process engineers of our own work:**
- Source-controlled inputs and outputs
- Repeatable, reviewable processes
- Agents as team members, not tools
- Humans in the loop (maybe thru PRs, quality gates, etc)

</div>
</div>

<div class="mt-6 px-4 py-3 rounded" style="background:#EEF2FF;border-left:3px solid #4D7EF7;font-style:italic;font-size:0.9rem;color:#0D1120;">
"Morning Claude, please update this proposal with the new ZAR/EUR rates, and add a 30 day acceptance window to protect for forex movement."
<div class="mt-2" style="font-style:normal;font-size:0.8rem;color:#6B7280;">(Agent restores state from git, finds the proposal, queries the new rate, updates the document and commits + publishes it)</div>
</div>

<Principle class="mt-4">
If your day job produces or updates documents, presentations and reports resulting in decisions, you already have a codebase. You just haven't treated it like one yet!
</Principle>

---

# Skills are the unit of work

Committing a human process to an agentic one needs an encoding — somewhere the steps, tools, and acceptable outputs are written down so the agent can run it. Everyone should be capable of building one. *A modern day spreadsheet formula!*

<div class="grid grid-cols-2 gap-8 mt-6">
<div>

**What a skill captures:**
- The steps of a process
- The tools and conventions to use
- The shape of acceptable outputs
- Where to find context
- How to resolve conflicts in process

</div>
<div>

**Benefits:**
- The single, runnable unit of work
- Shareable and distributable across teams
- Versioned, reviewable, improvable

</div>
</div>

<Principle class="mt-6">
The skill is the encoding. Once it exists, the process becomes portable and extendable. Not possible for previously human only processes!
</Principle>

---
layout: center
class: text-center
---

# Now: The interesting stuff.

---

# TLDR; Ye goode olde software design principles!

<div class="grid grid-cols-2 gap-x-10 gap-y-2 mt-6 text-sm">
<div>

**DRY** — a duplicated pattern used to be copy-paste fatigue; now it multiplies at the rate the agent can generate.

**Impossible states unrepresentable** — the compiler rejects what code review might miss. Encode invariants once.

**The right abstraction** — a wrong one spreads like a virus through a codebase in minutes! 

**Developer experience** — the agent IS the developer, and lets respect them!

**Least surprise** — the agent infers behaviour from names and conventions. Consistency is important.

**Locality of behaviour** — agents read in windows; code that changes together should live together.

**Parse, don't validate** — push invariants into the type at the boundary, not deep inside the function.

</div>
<div>

**YAGNI** — agents over-engineer by default; the constraint pulls them back to the actual requirement.

**Single source of truth** — duplication causes split-brain. No two definitions of "user".

**Encapsulation** — smaller public surface area means fewer ways for the agent to misunderstand it.

**Separation of concerns** — smaller congnitive overhead and less spaghetti 

**Tests as executable specifications** — agents can read and run them. Specs as executables means less disconnect between documentation and code.

**Total functions** — partial cases bleeds into call graph, and usually means the design is not tight enough.

</div>
</div>

---
layout: section
number: "03"
title: Encode Architecture in Types
subtitle: Effect systems can keep agents on track (aka "enforce architecture")
---

---

# Effects don't lie

```haskell
processOrder :: (PaymentGateway :> es, EmailNotification :> es, OrderRepo :> es) => Order -> Eff es Result
```

The type is a complete description of what this function does. Nobody can't sneak a database write into a function that wasn't supposed to touch the database — the compiler rejects it.

<Principle class="mt-6">
Types are a compression format for architectural intent. You write the architecture once; every agent is constrained by it forever.
</Principle>

The beauty comes when you abstract the specifics out:

```haskell
For every domain object X:
processX :: (XGateway :> es, EmailNotification :> es, XRepo :> es) => X -> Eff es XResult
 --   ^^ hand wavey
```

---
layout: section
number: "04"
title: Build the Hard Abstractions
subtitle: Which would previously require rockstar programmers
---

---

# Tiny surface. Huge infrastructure underneath.

```kotlin
object InvoiceAggregate : Aggregate<
    InvoiceCommand.Create, InvoiceCommand.Mutate,
    InvoiceEvent.ForCreate, InvoiceEvent.ForMutate,
    InvoiceEvent, Invoice, InvoiceDeps> {

    // Write side - Command -> Event
    override fun processCreate(cmd: InvoiceCommand.Create, deps: InvoiceDeps): InvoiceEvent.ForCreate = ...
    override fun processMutate(cmd: InvoiceCommand.Mutate, entity: Versioned<Invoice>, deps: InvoiceDeps): InvoiceEvent.ForMutate = ...
    
    // Read side - Event -> State Update
    override fun evolveCreate(event: InvoiceEvent.ForCreate): Versioned<Invoice> = ...
    override fun evolveMutate(entity: Versioned<Invoice>, event: InvoiceEvent.ForMutate): Versioned<Invoice>? = ...
}
```

<Principle class="mt-3">
So dense. 7 type parameters. Creation vs Mutation. Command vs Event. Dependencies specified. Mutation of existing entity must be versioned.
</Principle>

<Principle class="mt-3">
4 pure functions describe a full CQRS write & read abstraction for a single domain object.
</Principle>

---

# What the framework handles for you

<div class="grid grid-cols-2 gap-8 mt-4 text-sm">
<div>

- Requests arrive as HTTP `GET` or `POST`
- Entity residency lookup — it may live on another partition, forward accordingly
- `GET` → hit the materialised state store, return current state
- `POST` → encode as a `Create` or `Mutate` command, write to Kafka topic
- Command Processor reads from Kafka and checks vector clock deps (If-Fence)
- Deps not yet satisfied → park command in the deferred queue

</div>
<div>

- Deps satisfied → check OCC version (If-Match)
- Version conflict → send conflict reply to caller
- <span style="color:#22c55e">Both checks pass → run aggregate domain logic *</span>
- Write resulting event to the events topic
- <span style="color:#22c55e">Calculate update to state store *</span>
- Update the state store
- Send success reply to caller
- Periodically retry deferred queue as new events arrive

</div>
</div>

<div class="mt-4 text-muted text-sm">You never touch any of this. The framework owns it.</div>
<div class="text-sm" style="color:#22c55e">* your code runs here</div>

---

# Everyone is an architect & process engineer

The tools and languages we used to love are less important than we think - because we don't really need to use them as much as we did before.

<div class="grid grid-cols-3 gap-6 mt-8">
<Principle title="Engineering process">
Source control, pipelines, review, and release — applied to everything we produce, not just code.
</Principle>
<Principle title="Domain knowledge">
Understanding the problem deeply enough to know when the output is right, and when it isn't, and then being able to design constraints.
</Principle>
<Principle title="Accountability">
Owning the decisions, the architecture, and the consequences — regardless of who wrote the code.
</Principle>
</div>

---
layout: end
title: Thank you
eyebrow: QUESTIONS WELCOME
speaker: "Tom Wells"
organisation: "Synthesis"
email: "tom@synthesis.co.za"
footer: "Code Connect Summit · 5 June 2026"
---
