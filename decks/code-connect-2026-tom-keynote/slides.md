---
theme: default
title: "Field notes from<br>working with agents"
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
- Fast, low-friction switching across isolated workspaces
- Fast restoration of agentic state — no long-running chat windows
- Trust that agents build within constraints
- Using agents as human memory swapfiles (spill your brain to disk)

</div>
</div>

---
layout: center
class: text-center
---

# 3½ ideas

---
layout: section-image
number: "01"
title: Everything is a Pipeline
subtitle: Not just for code
image: /everything-pipelines-meme.jpg
imageAlt: "Always has been: wait, it's all DevOps?"
---

---

# Documents are pipelines

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

# Knowledge work

<div class="flex justify-center mt-2">
<img src="/document-pipeline.svg" class="w-full max-w-4xl" alt="A document as a pipeline: agents and a human collaborate on a single source in git, then once approved it renders, publishes, and distributes" />
</div>

---

# Business analysis is pipeline

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

# Operations is pipeline

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

# Even my fishtank is a pipeline

<div class="grid grid-cols-[auto_1fr] gap-10 mt-2 items-start">
<div class="flex justify-center">
<img src="/fishtank-tank-overview.jpg" class="rounded-lg shadow-lg max-h-95" alt="Planted shrimp tank" />
</div>
<div>

<div class="text-base leading-tight space-y-2">
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 16</span><span>Brood 1 born — ~20 shrimplets; mum re-berried</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 17</span><span>Tank baselined — Nano Cube, Amazonia, CO₂</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 19</span><span>Filter clogs → canister upgrade decided</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 21</span><span>Haze ruled benign; gentle water change</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 22</span><span>O₂ near-miss; first baby spotted; air pump</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 23</span><span>Airstone too coarse → add flow valve</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 24</span><span>Dead corner fixed; dual-airstone; 3 babies</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 25</span><span>Critters = harmless ostracods; trip planned</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 26</span><span>Canister live; heatwave → fan, 23°C</span></div>
<div class="flex gap-3"><span class="text-accent font-mono font-semibold w-16 flex-shrink-0">May 27</span><span>"Clog" was under-squeezing, not bioload</span></div>
</div>

<div class="mt-5 text-sm">
<a href="https://github.com/drshade/fishtank" class="text-accent font-mono">github.com/drshade/fishtank</a>
</div>

</div>
</div>

---

# Even my fishtank is a pipeline

<div class="grid grid-cols-2 gap-12 mt-4">
<div class="flex items-center justify-center">

<img src="/fishtank-repo-tree.png" class="rounded shadow-md max-h-90" alt="~/dev/fishtank git repo directory tree" />

</div>
<div>

**User interface is claude code:**
- *"shrimp babies hatched today"* → journal entry + `livestock.md` updated
- *"TDS reading 180"* → row appended to `parameters.md`
- *"Filter arrived"* → `pending.md` ticked + install plan started
- *"When is my next water change?"* → contextual answer based on whats happening (e.g. baby shrimps)

</div>
</div>

<Principle class="mt-4">
    Anything you track or do repeatedly is a pipeline!
</Principle>

---

<div class="grid grid-cols-2 gap-12 items-center mt-4">
<div>

<div class="text-3xl font-medium text-navy">Claude briefed my wife before my trip</div>

</div>
<div class="flex justify-center">
<img src="/whatsapp-fishtank.png" class="max-h-[460px] rounded-xl shadow-lg" alt="WhatsApp handover note Claude wrote for the shrimp tank, signed 'love from Claude'" />
</div>
</div>

---
layout: center
class: text-center
---

# But how?

<div class="mt-6 text-6xl text-accent font-medium">
Claude Code + Git + Skills
</div>

<div class="mt-6 text-sm text-muted italic">
(and yes you can learn these)
</div>

---
layout: center
---

<div class="grid grid-cols-3 gap-6 stack-cards">
<Principle title="Claude Code">
Computation Layer — runtime, compute, intelligence.
</Principle>
<Principle title="Git">
Storage Layer — memory, audit trail, searchable, indexable.
</Principle>
<Principle title="Skills">
Programmable Layer — repeatable workflows, patterns and processes.
</Principle>
</div>

<style>
.stack-cards :deep(.principle-title) {
  font-size: 2.0rem;
}
</style>

---
layout: section
number: "02"
title: Rethink the OS
subtitle: Our desktops should support concurrency!
---

<img src="/distracted-boyfriend-os.jpg" class="absolute right-16 top-1/2 -translate-y-1/2 w-90 rounded-lg shadow-2xl" alt="Distracted boyfriend: eyeing Omarchy + Hyprland over Mac" />

<style>
.section-title,
.section-subtitle { max-width: 26rem; }
</style>

---

<img src="/mac_agents_1.png" class="absolute inset-0 w-full h-full object-contain" />

---

<img src="/omarchy_agents_1.png" class="absolute inset-0 w-full h-full object-contain" />

---
layout: section-image
number: "03"
title: Build the Hard Abstractions
subtitle: No rockstar required
image: /iceberg-abstractions-meme.jpg
imageAlt: "Iceberg: 7 lines of code on top, a mountain of event-sourcing/CQRS infrastructure underneath"
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
layout: section-image
number: "03b"
title: Encode Architecture in Types
subtitle: Effect systems can keep agents on track (aka "enforce architecture")
image: /gandalf-types-meme.jpg
imageAlt: "The type system as Gandalf blocking db.write() — thou shall not compile!"
---

---
layout: center
---

<div class="flex flex-col items-center text-center">

<div class="text-lg text-muted italic mb-5">muuuuch more detail here:</div>

<a href="https://www.youtube.com/watch?v=JaLAvoyjwoQ" target="_blank">
<img src="/youtube-architecture-thumb.png" class="max-h-[400px] rounded-lg shadow-xl" alt="YouTube — Agents Are Architecturally Blind" />
</a>

<a href="https://www.youtube.com/watch?v=JaLAvoyjwoQ" target="_blank" class="mt-5 text-accent font-mono text-lg">▶ youtu.be/JaLAvoyjwoQ</a>

</div>

---

# Everyone is an architect & process engineer

The tools and languages we used to love are less important than we think - because we don't really need to use them as much as we did before.

<div class="grid grid-cols-3 gap-6 mt-8">
<Principle title="Engineer the process">
Source control, pipelines, review, and release — applied to everything we produce, not just code.
</Principle>
<Principle title="Design for constraints">
Understanding the problem deeply enough to know the constraints are as tight as possible — so the agent can only produce the right output.
</Principle>
<Principle title="Take accountability">
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
