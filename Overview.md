# 🏛️ OVERVIEW STRUCTURE

Your site is divided into **4 Realms**, mirroring your own internal architecture:

| Realm                                     | Purpose                                                                             | Access                |
| ----------------------------------------- | ----------------------------------------------------------------------------------- | --------------------- |
| 🌞 **Outer Realm (Public)**               | Visible to all — shows your professional identity, projects, ideas, and philosophy. | Public                |
| 🌙 **Inner Realm (Private/Login)**        | For confidential, deep, or experimental material.                                   | Password / invite     |
| 🜂 **Meta Realm (Self & Systems)**         | Showcases your frameworks, philosophy, and mind-architecture.                       | Semi-public           |
| 🜃 **Foundation Realm (Utility & Growth)** | Legal, contact, system, and operational scaffolding.                                | Public but background |

---

## 🌞 OUTER REALM — _Your Public Professional Universe_

### `/` — **Home / Landing**

**Purpose:** First impression. Quiet strength, calm clarity, elegant summary.

**Sections:**

- **Hero**:
  “Desmond Liew — Applied AI Engineer | Creative Prototyping & Calm Systems Design”
  Short tagline: _Clarity over complexity. Calm delivery. Ethical technology._
- **Identity Summary**: One-paragraph “who you are” statement from your LinkedIn and résumé.
- **Featured Projects**: 2–3 visual cards linking to `/projects/<slug>`.
- **Philosophy Preview**: Quote or short manifesto (Justice + High Priestess essence: “Truth. Balance. Reflection.”).
- **Recent Writing**: 3–5 recent blog posts.
- **Contact CTA**: “Work with me” button → `/contact`.
- **Footer**: Links to socials (LinkedIn, GitHub, YouTube, etc.), résumé PDF, copyright, privacy links.

---

### `/about` — **About / Biography**

**Purpose:** Communicate personality, career journey, and principles.

**Subsections:**

1. **Bio Overview** – from résumé summary and LinkedIn “About”:
   Calm technologist who builds privacy-first AI systems.
2. **Core Principles** – your beliefs (“Clarity before clever”, “People before features”).
3. **Work Philosophy** – async-first, ethical systems, long-term value.
4. **Journey Timeline** – education → AI career → current stage → future direction.
5. **Personality Map** – INTP cognition, Big Five summary, tarot archetypes (Justice, High Priestess), 五行 balance (庚金 + 土).
6. **Gallery / Personal Side** – hobbies, gardening, art, woodworking, qigong, slow living.
7. **Call-to-action** – Download résumé / go to projects.

---

### `/projects` — **Projects / Work Showcase**

**Purpose:** Demonstrate capability and thinking process.

**Sections:**

- **Index Grid** – filters by category:
  `AI Systems | Automation | Tools | Research | Creative`
- **Highlight Badges** – “On-Prem AI”, “Prototype”, “Internal Build”, “Public Tool”.

**Each project → `/projects/<slug>`**
**Template structure:**

1. Overview → Project name, duration, tools, context.
2. Problem → What issue it solved.
3. Solution → Architecture diagram / flow.
4. Your Role → specific tasks, decisions, responsibilities.
5. Tech Stack → code tools, infra, frameworks.
6. Process → how you built & reasoned (clear steps).
7. Results → metrics, benchmarks, feedback.
8. Lessons → reflections, ethics, balance decisions.
9. Next Steps → future direction.
10. Links → GitHub / Live Demo / Docs (if public).

**Examples:**

- `/projects/wood-identification`
- `/projects/idecs-ai-sketch`
- `/projects/judicial-v2t`
- `/projects/hr-screening`
- `/projects/ekyc`
- `/projects/automation-playbooks`

**Additional Views:**

- `/projects/archive` – old or experimental projects.
- `/projects/roadmap` – ongoing/future builds.

---

### `/blog` — **Blog / Writing / Research**

**Purpose:** Your intellectual public space.

**Main index:**

- Categories: `AI / Engineering`, `Ethics / Psychology`, `System Design`, `Philosophy`, `Personal Growth`.
- Sort: by newest / oldest / series.

**Sub-structure:**

```
/blog/post/<slug>
/blog/series/<slug>
/blog/tag/<tag>
```

**Series Examples:**

- **Decision Logs** — trade-offs explained (e.g., “Why I containerized X this way”).
- **System Design Notes** — architecture reflections.
- **Reading Notes** — syntheses from books or courses.
- **Ethics & Fairness** — reflections on AI responsibility.
- **Human–Machine Boundaries** — psychology & calm-tech.
- **TIL (Today I Learned)** — short technical insights.

**Features:**

- Table of contents, estimated reading time, related posts, and a clean comment/contact link.
- Optional audio narration or AI summary.
- RSS feed + newsletter link.

---

### `/services` — **Work With Me / Consulting**

**Purpose:** Open channel for collaboration and freelance opportunities.

**Sections:**

1. Offerings: AI prototyping, automation, on-prem deployment, evaluation audits.
2. Engagement Models: project-based, retainers, consultation calls.
3. Process Overview: how you work — async-first, low-noise.
4. Values: calm delivery, fairness, transparency.
5. Pricing or “Contact for quote.”
6. Case highlights and testimonials (if available).
7. Hire CTA → `/contact`.

---

### `/labs` — **Experiments / Sandbox**

**Purpose:** Playground for creativity, research, and open experiments.

**Subpages:**

- `/labs/prototypes` — mini AI tools or visual demos.
- `/labs/ai-playground` — experimental LLM chains, embeddings, etc.
- `/labs/code-snippets` — public utilities, GitHub gists.
- `/labs/creative` — art/video/game AI prototypes.
- `/labs/automation` — scripts, workflows, templates.

---

### `/library` — **Resources / Knowledge Archive**

**Purpose:** Intellectual index of your influences and materials.

**Subpages:**

- `/library/reading-list`
- `/library/research-papers`
- `/library/tools-and-frameworks`
- `/library/influences` – mentors, thinkers, systems that shaped you.
- `/library/media-kit` – headshots, logo, bio.
- `/library/press` – mentions, talks, interviews.

---

### `/contact` — **Get in Touch**

**Purpose:** Entry point for work or collaboration.

**Elements:**

- Intro text (inviting, calm tone).
- Contact form (Name, Email, Message).
- Direct email link (mailto).
- Optional scheduling calendar (Calendly).
- Location/timezone (Kuching, Malaysia / UTC+8).
- Privacy note (“Data not stored beyond necessary reply.”).

---

### `/resume` — **Online CV**

**Purpose:** Web-friendly, ATS-safe version of your résumé.

**Sections:**

- Summary
- Experience timeline (expandable).
- Education
- Skills
- Certifications
- Download PDF button.

---

### `/newsletter` — **Subscribe / Archive**

- `/newsletter/subscribe`
- `/newsletter/archive` (public posts).

---

## 🌙 INNER REALM — _The Hidden Domain (Login Access)_

**Purpose:** Private knowledge, experiments, and NDA-protected work.
Accessible only via password, invite link, or key.

### `/inner` — Dashboard

**Subpages:**

- `/inner/case-studies` – NDA projects in detail (secure PDF or Markdown).
- `/inner/research` – architecture docs, ADRs, experiments.
- `/inner/resources` – templates, frameworks, prompt logs.
- `/inner/journals` – learning journals, reflections, health/energy logs.
- `/inner/metaphysics` – your TCM & metaphysical research (e.g., Bazi patterns, Zi Wei notes).
- `/inner/clients` – private recruiter/company-specific folders.
- `/inner/admin` – site notes, analytics, draft hub.

---

## 🜂 META REALM — _The Self, System & Philosophy_

This realm presents your internal frameworks as part of your identity. It shows the “mind behind the code.”

### `/meta`

**Purpose:** Display your models for thinking, ethics, and pattern recognition.

**Subpages:**

- `/meta/personality` — INTP breakdown, Big Five insights, work implications.
- `/meta/tarot` — Justice + High Priestess archetypes → brand philosophy.
- `/meta/numerology` — Chaldean structure (4–5–8 stability).
- `/meta/bazi` — Metal/Earth interpretation (庚金 + 喜土 balance).
- `/meta/tcm` — 经方 × 养生派 — balance of mind & body through structure.
- `/meta/philosophy-of-work` — Essays on “Calm Technology” and “Ethical AI.”
- `/meta/systems` — Your custom thinking frameworks: “Problem → Pattern → Practice → Proof.”
- `/meta/justice-manifesto` — Your code of fairness in tech.
- `/meta/uses` — Tools, hardware, software you rely on.

---

## 🜃 FOUNDATION REALM — _System, Legal, and Utility Layer_

**Purpose:** Infrastructure pages that keep everything working and compliant.

**Subpages:**

```
/search
/sitemap
/404
/500
/privacy
/terms
/cookies
/accessibility
/changelog
```

---

## 🪐 CREATIVE / SPIRITUAL EXTENSIONS (Optional Layer)

**Purpose:** Integrate your artistic, reflective, and educational identity.

### `/creative`

- `/creative/video` – video storytelling or YouTube links.
- `/creative/writing` – essays or short fiction.
- `/creative/game` – narrative/game design concepts.
- `/creative/art` – digital art, photography, symbolic visuals.

### `/education`

- `/education/teaching` – tutorials, guides, courses.
- `/education/speaking` – talks, slides, workshops.
- `/education/resources` – free downloads, PDFs, templates.

### `/timeline`

Interactive timeline combining:

- Education, projects, jobs.
- Metaphysical/life-phase markers (大运, milestones).
- Achievements and creative evolution.

---

## ⚙️ SYSTEM / INFRASTRUCTURE (Back-End Architecture)

**Purpose:** Quiet, resilient structure supporting calm reliability.

**Suggested Tech Stack**

- **Frontend:** Next.js / Astro / SvelteKit (static-first, markdown + MDX).
- **CMS:** Git-based (Contentlayer, Netlify CMS) or headless (Sanity).
- **Styling:** CSS variables + utility classes (Metal–Earth palette: slate, sand, gold).
- **Backend (Private section):** FastAPI / Flask + small DB (SQLite / Supabase).
- **Deployment:** GitLab CI/CD + Docker Compose + VPS (Ubuntu).
- **Analytics:** Privacy-friendly (Plausible / Umami).
- **Search:** Algolia / Typesense.
- **Auth:** Magic link / password gate for `/inner`.
- **Monitoring:** Uptime + error logs (Sentry).

---

## 📊 GROWTH, COMMUNITY, AND MARKETING

**Add-on pages:**

- `/community` — quiet Q&A or mentorship form.
- `/collaborate` — for creative partnerships.
- `/shop` — digital templates, ebooks, small AI tools.
- `/patron` — support page (for open-source or creative work).
- `/testimonials` — feedback from peers or clients.

---

## 🧭 GLOBAL NAVIGATION STRUCTURE (Condensed Hierarchy)

```
/
├── about
├── projects
│    ├── <slug>
│    ├── archive
│    └── roadmap
├── blog
│    ├── post/<slug>
│    ├── series/<slug>
│    └── tag/<tag>
├── services
├── labs
├── library
├── contact
├── resume
├── newsletter
├── inner (login)
│    ├── case-studies
│    ├── research
│    ├── resources
│    ├── journals
│    ├── metaphysics
│    └── clients
├── meta
│    ├── personality
│    ├── tarot
│    ├── numerology
│    ├── bazi
│    ├── tcm
│    ├── philosophy-of-work
│    ├── systems
│    ├── justice-manifesto
│    └── uses
├── creative
│    ├── video
│    ├── art
│    ├── writing
│    └── game
├── education
│    ├── teaching
│    ├── speaking
│    └── resources
├── foundation
│    ├── search
│    ├── sitemap
│    ├── 404
│    ├── privacy
│    ├── terms
│    └── accessibility
└── timeline
```

---

## 🔮 THEMATIC DESIGN CONCEPTS

- **Light/Dark toggle:** Metal (light) / Earth (dark) themes.
- **Motion:** slow, deliberate transitions.
- **Symbolism:** geometrical lines, balanced symmetry.
- **Tone:** calm, minimalist, truthful.
- **Typography:** modern serif + monospaced hybrid (structure + clarity).

---

## 💡 PURPOSE SYNTHESIS

Your website isn’t just a portfolio — it’s a **living system of your mind and craft**.
It functions simultaneously as:

- **Professional Showcase** — for recruiters and collaborators.
- **Learning Repository** — for students, peers, and readers.
- **Ethical Statement** — showing how calm, privacy, and fairness shape AI work.
- **Spiritual Map** — integrating logic (Metal) and reflection (Earth).
- **Creative Studio** — for your long-term transformation into an independent technologist-educator.

---

# 🌞 Outer Realm (Public)

## `/` Home / Landing

| Field             | Details                                                                                                                                                                                              |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Purpose           | First impression; route users to Projects/Contact; state value clearly.                                                                                                                              |
| Audience          | Recruiters, collaborators, clients, readers.                                                                                                                                                         |
| Must-have content | Name + role; 1–2 sentence value prop (_clarity over complexity; calm delivery; privacy-first_) ; 2–3 featured projects; latest 3 posts; mini-bio; trust bar (skills/logos/testimonial); primary CTA. |
| Components        | Hero (title, tagline, CTA); Featured Projects grid; “How I work” ribbon; Recent Posts; Footer.                                                                                                       |
| Inputs/Assets     | Headshot/logo; 2–3 project screenshots; social links; résumé link. Pull copy from Resume/LinkedIn.                                                                                                   |
| Tone              | Calm, precise, people-first; short lines.                                                                                                                                                            |
| SEO/Schema        | `WebSite`, `Person` (name, headline, sameAs), `BreadcrumbList`.                                                                                                                                      |
| Privacy           | No trackers until consent; defer embeds.                                                                                                                                                             |
| Success metrics   | Clicks to `/projects` & `/contact`; scroll depth; bounce < 45%.                                                                                                                                      |
| Update cadence    | Quarterly refresh; swap featured project when new case study ships.                                                                                                                                  |
| CTA               | **View Work**, **Contact**, **Download Résumé**.                                                                                                                                                     |

## `/about`

| Field             | Details                                                                                                                                                                                              |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Purpose           | Establish identity, principles, journey.                                                                                                                                                             |
| Audience          | Hiring managers, partners, media.                                                                                                                                                                    |
| Must-have content | Bio summary (Applied AI + calm systems) ; **Principles** (“Clear before clever”, “People before features”) ; Timeline (edu → roles); Skills map; Hobbies (woodworking/gardening/qigong, slow life) . |
| Components        | Bio; Values; Timeline; Skills (LangChain/FastAPI/Docker etc.) ; Personal slice; Download CV.                                                                                                         |
| Inputs/Assets     | Résumé facts; photos; badges/certs (curate).                                                                                                                                                         |
| Tone              | Measured, ethical, human.                                                                                                                                                                            |
| SEO/Schema        | `Person`, `AboutPage`.                                                                                                                                                                               |
| Privacy           | Keep personal contact details minimal; obfuscate email in copy.                                                                                                                                      |
| Success metrics   | Time on page > 90s; clicks to Projects/CV.                                                                                                                                                           |
| Update cadence    | When role changes; 2×/year polish.                                                                                                                                                                   |
| CTA               | **View Projects**, **Download CV**.                                                                                                                                                                  |

## `/projects` (index) & `/projects/<slug>` (case studies)

| Field             | Details                                                                                                                   |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Purpose           | Show competence + reasoning; demonstrate outcomes.                                                                        |
| Audience          | Engineers, tech leads, recruiters.                                                                                        |
| Must-have content | Cards with role, stack, result; **Case study template** per project (see next table). Include on-prem/LLMOps/evals focus. |
| Components        | Filters (AI Systems, Automation, Tools, Research, Creative); Sort (Newest/Impact).                                        |
| Inputs/Assets     | Architecture diagrams, metrics (p95, error rates), screenshots, short video/gifs, repo/demo links (if public).            |
| Tone              | Evidence-driven; no hype.                                                                                                 |
| SEO/Schema        | `CollectionPage` + per case `SoftwareSourceCode`/`TechArticle`/`CreativeWork`.                                            |
| Privacy           | Redact internal names; move sensitive metrics to `/inner`.                                                                |
| Success metrics   | Case “expand” rate; clicks to Contact; CV downloads.                                                                      |
| Update cadence    | Ship each new project; maintain 3–6 hero cases.                                                                           |
| CTA               | **Read Case**, **Contact**, **See Code**.                                                                                 |

### Case study template (for each `/projects/<slug>`)

| Field             | Details                                                                                                                                                                                                                                                                                        |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Purpose           | Reveal thinking, trade-offs, results.                                                                                                                                                                                                                                                          |
| Must-have content | **Overview** (goal, constraints) → **Options considered & criteria** → **Decision** → **Architecture** → **Build notes** → **Observability/Evals** (golden sets, tracing, guardrails) → **Results** (latency, error rates, stability) → **Risks/Ethics** → **Next steps** → **Links/credits**. |
| Components        | Problem card; Criteria table; Diagrams; Before/After metrics; Gallery; Downloads.                                                                                                                                                                                                              |
| Inputs/Assets     | Draw.io/Mermaid diagrams; perf charts; code snippets; runbooks.                                                                                                                                                                                                                                |
| SEO               | `TechArticle`, `HowTo` (if stepwise).                                                                                                                                                                                                                                                          |
| Privacy           | Scrub PII; change org identifiers; keep raw logs private.                                                                                                                                                                                                                                      |
| Metrics           | Time on page; diagram expands; contact clicks.                                                                                                                                                                                                                                                 |
| Cadence           | Publish when polished; revise when architecture evolves.                                                                                                                                                                                                                                       |
| CTA               | **Contact to discuss**, **View similar projects**.                                                                                                                                                                                                                                             |

## `/blog`

| Field             | Details                                                                                                                                                                            |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Purpose           | Thought leadership; teaching.                                                                                                                                                      |
| Audience          | Engineers, students, ethics-minded readers.                                                                                                                                        |
| Must-have content | Series: **Decision Logs**, **System Design Notes**, **Ethics & Fairness**, **Reading Notes**, **TILs**. Seed topics from your Resume/LinkedIn (LLMOps, Whisper, CI/CD, calm tech). |
| Components        | Index with filters, tags; Series pages; TOC; Related posts; RSS/JSON feed; Newsletter box.                                                                                         |
| Inputs/Assets     | Post cover images; code blocks; diagrams.                                                                                                                                          |
| Tone              | Clear, respectful, test-and-learn.                                                                                                                                                 |
| SEO/Schema        | `Blog`, `BlogPosting`; OpenGraph images.                                                                                                                                           |
| Privacy           | No third-party comments by default; email reply link instead.                                                                                                                      |
| Metrics           | Subs; read time; return visitors.                                                                                                                                                  |
| Cadence           | 2 posts/month (mix long + short).                                                                                                                                                  |
| CTA               | **Subscribe**, **Read series**, **Contact**.                                                                                                                                       |

## `/services`

| Field             | Details                                                                                                                                   |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Purpose           | Convert interest to engagements.                                                                                                          |
| Audience          | SMEs, teams with internal/on-prem needs.                                                                                                  |
| Must-have content | Offerings: LLMOps deployment, eval audits, FastAPI+Docker on-prem, rollback playbooks; Engagement models; Process; Light portfolio; FAQs. |
| Components        | Packages; Process diagram; Inquiry form; Testimonials (when available).                                                                   |
| Inputs/Assets     | One-pager PDFs; rate guidance (optional).                                                                                                 |
| Tone              | Calm, professional, outcome-oriented.                                                                                                     |
| SEO/Schema        | `Service`, `Organization`.                                                                                                                |
| Privacy           | Minimal form fields; spam protection.                                                                                                     |
| Metrics           | Inquiry conversion; call bookings.                                                                                                        |
| Cadence           | Refresh quarterly.                                                                                                                        |
| CTA               | **Book intro call**, **Request quote**.                                                                                                   |

## `/labs`

| Field             | Details                                                                         |
| ----------------- | ------------------------------------------------------------------------------- |
| Purpose           | Showcase experiments & micro-tools.                                             |
| Audience          | Peers, future collaborators.                                                    |
| Must-have content | Prototypes (LLM chains, eval gadgets), code snippets, interactive demos (safe). |
| Components        | Gallery; “Try it” (if sandboxed); Readme links.                                 |
| Inputs/Assets     | Gists/repos; demo videos.                                                       |
| Tone              | Exploratory, honest about limits.                                               |
| SEO               | `CollectionPage`, per tool `SoftwareSourceCode`.                                |
| Privacy           | Rate-limit; no user data capture.                                               |
| Metrics           | Demo launches; repo stars.                                                      |
| Cadence           | Ship small monthly.                                                             |
| CTA               | **View code**, **Comment via email**.                                           |

## `/library`

| Field             | Details                                                                                        |
| ----------------- | ---------------------------------------------------------------------------------------------- |
| Purpose           | Living knowledge index.                                                                        |
| Audience          | Learners, journalists, recruiters.                                                             |
| Must-have content | Reading list; research notes; tools/frameworks; media kit (bio/headshot/logo); press mentions. |
| Components        | Filterable lists; downloadables.                                                               |
| Inputs/Assets     | Annotations; PDFs; headshots.                                                                  |
| Tone              | Curatorial, neutral.                                                                           |
| SEO               | `ItemList`, `CreativeWork`, `ImageObject` (media kit).                                         |
| Privacy           | License notes on assets.                                                                       |
| Metrics           | Downloads; outbound clicks.                                                                    |
| Cadence           | Monthly updates.                                                                               |
| CTA               | **Use media kit**, **Read notes**.                                                             |

## `/contact`

| Field             | Details                                                                                                                                |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| Purpose           | Make reaching you easy and low-friction.                                                                                               |
| Audience          | Hiring, clients, media.                                                                                                                |
| Must-have content | Short invite text (async-first, low-meeting) ; Form (Name/Email/Message); mailto; optional scheduling link; timezone (Kuching, UTC+8). |
| Components        | Form; alt channels; small FAQ (“response window”, “how to prepare”).                                                                   |
| Inputs/Assets     | Contact email; calendar link.                                                                                                          |
| Tone              | Warm, succinct.                                                                                                                        |
| SEO               | `ContactPage`.                                                                                                                         |
| Privacy           | State retention (reply-only); hCaptcha/Turnstile.                                                                                      |
| Metrics           | Form submissions; time to first response.                                                                                              |
| Cadence           | Static.                                                                                                                                |
| CTA               | **Send message**, **Book a call**.                                                                                                     |

## `/resume`

| Field             | Details                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------ |
| Purpose           | ATS-friendly web CV + PDF download.                                                              |
| Audience          | Recruiters/HR.                                                                                   |
| Must-have content | Summary; Experience; Skills; Education; Certs; Download button. Pull facts from Résumé/LinkedIn. |
| Components        | Expandable roles; skill tags; printable CSS.                                                     |
| Inputs/Assets     | PDF export; logos optional.                                                                      |
| Tone              | Factual, concise.                                                                                |
| SEO               | `Person`, `Resume`.                                                                              |
| Privacy           | Redact phone if needed.                                                                          |
| Metrics           | PDF downloads; clicks to Projects.                                                               |
| Cadence           | Update with each role change.                                                                    |
| CTA               | **Download PDF**, **Contact**.                                                                   |

## `/newsletter`

| Field             | Details                                                                      |
| ----------------- | ---------------------------------------------------------------------------- |
| Purpose           | Build a low-noise, opt-in audience.                                          |
| Audience          | Readers who want updates.                                                    |
| Must-have content | Subscribe page (promise of calm, useful updates); Archive (public optional). |
| Components        | Form; confirmation; archive list.                                            |
| Inputs/Assets     | Email provider; branding.                                                    |
| Tone              | Gentle, value-dense.                                                         |
| SEO               | `CollectionPage` for archive, `EmailMessage` metadata.                       |
| Privacy           | Clear consent, easy unsubscribe.                                             |
| Metrics           | Sub growth; open rates.                                                      |
| Cadence           | Monthly.                                                                     |
| CTA               | **Subscribe**.                                                               |

---

# 🌙 Inner Realm (Login)

## `/inner` (dashboard) + subpages

| Page                  | Purpose             | Must-have content                                    | Privacy & Access                | Metrics                  | Cadence        | CTA                 |
| --------------------- | ------------------- | ---------------------------------------------------- | ------------------------------- | ------------------------ | -------------- | ------------------- |
| `/inner`              | Hub after login     | Greeting; quick links to NDA, research, resources    | Password/magic link; rate-limit | Visits; file downloads   | As needed      | —                   |
| `/inner/case-studies` | NDA work            | Deep metrics; redacted screenshots; partner notes    | Watermark; no external links    | Page views; time on page | Per engagement | **Request call**    |
| `/inner/research`     | Architecture & ADRs | Diagrams; ADR log; perf traces; incident retros      | Internal only                   | Doc opens                | Ongoing        | **Download pack**   |
| `/inner/resources`    | Templates/toolkits  | Runbooks; checklists; prompt libs                    | License note                    | Downloads                | Quarterly      | **Use template**    |
| `/inner/journals`     | Learning & rituals  | Weeknotes; seasonal routines                         | Private                         | —                        | Weekly         | —                   |
| `/inner/metaphysics`  | Private research    | Bazi/TCM synthesis; pattern studies (non-predictive) | Private; disclaimer             | —                        | Ad hoc         | —                   |
| `/inner/clients`      | Per-company folders | Intro video; tailored playlist; proposal PDF         | Invite-only links               | Proposal opens           | Per client     | **Schedule review** |
| `/inner/admin`        | Your ops            | Content planner, analytics summaries                 | Self-only                       | —                        | Ongoing        | —                   |

---

# 🜂 Meta Realm (Self & Systems)

## `/meta` + key subpages

| Page                       | Purpose                        | Must-have content                                                                 | Tone               | SEO/Schema     | Notes                                |
| -------------------------- | ------------------------------ | --------------------------------------------------------------------------------- | ------------------ | -------------- | ------------------------------------ |
| `/meta/personality`        | Show how cognition shapes work | INTP functions; Big Five snapshot → work modes & collaboration tips (async-first) | Reflective         | `Article`      | Avoid psycho-jargon; keep practical. |
| `/meta/tarot`              | Brand archetypes               | Justice/High Priestess → ethics & depth; how this informs design decisions        | Symbolic, grounded | `Article`      | No mysticism claims; metaphors only. |
| `/meta/numerology`         | Structural motifs              | 4–5–8 = structure/curiosity/presence → grid rhythm, typography                    | Light              | `Article`      | Visual examples.                     |
| `/meta/bazi`               | Elemental balance              | Metal/Earth themes → structure & stability in ops; **no predictions**             | Explanatory        | `Article`      | Respectful disclaimer.               |
| `/meta/tcm`                | Calm-tech hygiene              | 经方 × 养生 → sustainable work rituals; seasonality → content cadence             | Practical          | `Article`      | Not medical advice.                  |
| `/meta/philosophy-of-work` | Ethical stance                 | “Clear before clever”; “People before features”; privacy & fairness               | Firm, kind         | `TechArticle`  | Link to Services and Blog.           |
| `/meta/systems`            | Your frameworks                | Problem → Pattern → Practice → Proof; decision matrices                           | Technical          | `TechArticle`  | Include downloadable templates.      |
| `/meta/justice-manifesto`  | Code of conduct                | Transparency, consent, inclusion, rollback ethics                                 | Declarative        | `CreativeWork` | Good to link in footer.              |
| `/meta/uses`               | Setup                          | Hardware/software/tools you actually use                                          | Straight           | `Product` list | Update quarterly.                    |

---

# 🪐 Creative & Education

## `/creative` (video, art, writing, game)

| Field             | Details                                                              |
| ----------------- | -------------------------------------------------------------------- |
| Purpose           | Showcase non-work creativity; fuels human brand.                     |
| Must-have content | Video storytelling; music/art snippets; game/narrative design notes. |
| Tone              | Playful, modest.                                                     |
| SEO               | `CreativeWork`, `VideoObject`.                                       |
| Privacy           | Avoid personal faces if preferred; use pseudonymous art if needed.   |
| Cadence           | Ad hoc.                                                              |
| CTA               | **See process**, **Read making-of**.                                 |

## `/education` (teaching, speaking, resources)

| Field             | Details                                                                 |
| ----------------- | ----------------------------------------------------------------------- |
| Purpose           | Build educator track & productize knowledge.                            |
| Must-have content | Workshop offers; syllabi; slides; course landing pages; free resources. |
| SEO               | `Course`, `Event`, `EducationalOccupationalProgram`.                    |
| Metrics           | Enquiries; resource downloads.                                          |
| Cadence           | Per cohort/offer.                                                       |
| CTA               | **Book workshop**, **Get resources**.                                   |

## `/timeline`

| Field             | Details                                                                                |
| ----------------- | -------------------------------------------------------------------------------------- |
| Purpose           | Unified life/work timeline (jobs, projects, milestones).                               |
| Must-have content | Roles (with dates), flagship projects, releases, awards; optional life-phase overlays. |
| Components        | Interactive scroller; filters (work/learning/creative).                                |
| SEO               | `ItemList`.                                                                            |
| Cadence           | Update when milestones happen.                                                         |
| CTA               | **Jump to project**.                                                                   |

---

# 🜃 Foundation / System & Legal

## Utility & Legal

| Page                             | Purpose               | Notes                                  |
| -------------------------------- | --------------------- | -------------------------------------- |
| `/search`                        | Global search / Cmd-K | Index posts, projects, docs.           |
| `/sitemap`                       | SEO discovery         | Auto-generated.                        |
| `/404`, `/500`                   | Error UX              | Helpful links + search box.            |
| `/privacy`, `/terms`, `/cookies` | Compliance            | Plain-language, short; link in footer. |
| `/accessibility`                 | A11y statement        | Contact for issues; WCAG intent.       |
| `/changelog`                     | Site updates          | Ship notes; dates & diffs.             |

---

# 🧩 Global Components & Content Governance

## Reusable blocks

- **Principles ribbon** (appears on About/Services): _Clear before clever; People before features; Calm delivery_
- **Metrics strip** (on case studies): p95 latency, error rate, uptime trend.
- **Decision matrix** (table component): criteria weights + chosen option.
- **Ethics callout**: privacy, rollback, consent notes.
- **Newsletter strip**: quiet, opt-in promise.

## Content workflows

| Layer    | Checklist                                                            |
| -------- | -------------------------------------------------------------------- |
| Drafting | Define audience & outcome; gather assets; outline; write; diagram.   |
| Review   | Tech accuracy; ethics/privacy; a11y (alt text/contrast); link check. |
| Ship     | SEO (title/desc, OG image), `schema.org` type, sitemap, RSS.         |
| Measure  | Define page goal; add event tracking (view, click, submit).          |
| Maintain | Add to content calendar; quarterly prune/update.                     |

---

# 🔧 Tech & Data (content-facing)

- **MDX content** (posts/cases/notes) with frontmatter fields: `title`, `summary`, `date`, `type`, `tags`, `hero`, `schemaType`, `private` flag.
- **Image handling**: responsive `<picture>`; captions + alt.
- **Search**: index title, headings, tags, excerpt.
- **Auth** (Inner Realm): magic-link or password; audit last access; watermark on PDFs.
- **Analytics**: privacy-friendly (events for case study expand, CV download, contact submit).

---

# 🧠 Copy Prompts (fast drafting)

- **Home hero (1–2 lines):** “I build quiet, privacy-first AI systems that reduce chaos and help people get real work done.”
- **About principles:** “Clarity over complexity. People before features. Long-term over hype.”
- **Services pitch:** “On-prem LLM services with tracing, evaluation, and 1-click rollback—designed for calm launches.”
- **Case ‘Results’ sentence:** “Reduced p95 by \_\_%, cut incident risk via rollbacks and golden-set checks, shipped on schedule.”
- **Blog series lead-ins:** “Why X over Y: a decision log”; “How we instrumented evals without slowing delivery.”

---

# 🗺️ COMPREHENSIVE SITEMAP CHART

```
/
├── Home
│
├── About
│   ├── Philosophy & Principles
│   ├── Journey & Timeline
│   ├── Skills & Tools
│   ├── Work Style & Ethics
│   └── Personal Side (Hobbies / Balance)
│
├── Projects
│   ├── Featured
│   ├── Archive
│   ├── Roadmap (Future / Ongoing)
│   └── [Project Slugs]
│        ├── Overview
│        ├── Problem → Solution
│        ├── Architecture / Process
│        ├── Results & Metrics
│        ├── Reflections / Ethics
│        └── Links (Live / Repo / Demo)
│
├── Blog
│   ├── All Posts
│   ├── Series
│   │    ├── Decision Logs
│   │    ├── System Design Notes
│   │    ├── Ethics & Fairness
│   │    ├── Reading Notes
│   │    └── TIL (Today I Learned)
│   ├── Tags / Categories
│   ├── Changelog
│   └── Now (Current Focus)
│
├── Services
│   ├── Offerings
│   │    ├── AI System Design
│   │    ├── LLMOps / Deployment
│   │    ├── Automation Audits
│   │    └── Evaluation Frameworks
│   ├── Process & Workflow
│   ├── Pricing / Packages (optional)
│   ├── Testimonials
│   └── Hire / Inquiry CTA
│
├── Labs
│   ├── AI Prototypes
│   ├── Code Snippets / Tools
│   ├── Creative Experiments
│   └── Automation / Utilities
│
├── Library
│   ├── Reading List
│   ├── Research Notes
│   ├── Tools & Frameworks
│   ├── Influences
│   ├── Media Kit
│   └── Press / Mentions
│
├── Contact
│   ├── Contact Form
│   ├── Direct Email
│   ├── Booking Calendar
│   └── Location / Timezone
│
├── Resume
│   ├── Online Version
│   └── Download PDF
│
├── Newsletter
│   ├── Subscribe
│   └── Archive
│
├── Creative
│   ├── Video / Storytelling
│   ├── Art / Visual Works
│   ├── Writing / Essays
│   └── Game / Narrative Design
│
├── Education
│   ├── Teaching (Courses, Workshops)
│   ├── Speaking (Talks, Slides)
│   └── Resources (Free / Paid)
│
├── Timeline
│   ├── Work / Education / Creative Filter
│   └── Life Phases (Optional Metaphysical Overlay)
│
├── Meta
│   ├── Personality (INTP / Big Five)
│   ├── Tarot (Justice + High Priestess)
│   ├── Numerology (4–5–8)
│   ├── Bazi (庚金日主, 喜土金)
│   ├── TCM / Lifestyle (经方 × 养生)
│   ├── Philosophy of Work
│   ├── Systems & Frameworks
│   ├── Justice Manifesto (Ethics Code)
│   └── Uses (Tools & Setup)
│
├── Inner (Login / Private Realm)
│   ├── Dashboard
│   ├── Case Studies (NDA Projects)
│   ├── Research (Architecture Docs / ADRs)
│   ├── Resources (Templates / Prompts / Frameworks)
│   ├── Journals (Learning / Reflection / Energy Logs)
│   ├── Metaphysics (Private Charts & Data)
│   ├── Clients (Per-Partner Folders / Proposals)
│   └── Admin (Analytics / Notes / Drafts)
│
├── Foundation (System / Legal)
│   ├── Search
│   ├── Sitemap
│   ├── 404 / 500 Pages
│   ├── Privacy Policy
│   ├── Terms of Use
│   ├── Cookie Policy
│   ├── Accessibility Statement
│   └── Changelog
│
├── Community (optional)
│   ├── Q&A
│   ├── Mentorship
│   └── Office Hours
│
├── Collaborate
│   ├── Partnerships
│   └── Open Calls / Requests
│
├── Shop (optional future)
│   ├── Templates
│   ├── Digital Products
│   └── Workshops / Guides
│
└── Patron (Support / Donation)
     ├── Sponsorship (Open Source)
     ├── Buy Me a Coffee / Ko-fi
     └── Thank-You Wall
```

---

# 🧭 EXPANDED HIERARCHICAL TABLE

| Level | Path                         | Section Name              | Purpose / Description                                                     |
| ----- | ---------------------------- | ------------------------- | ------------------------------------------------------------------------- |
| 1     | `/`                          | **Home**                  | Landing page; clear intro, featured projects, mini bio, CTA to contact.   |
| 1     | `/about`                     | **About**                 | Detailed story: bio, philosophy, journey, skills, ethics, personal slice. |
| 2     | `/about/philosophy`          | Philosophy                | Core principles of calm tech & ethical systems.                           |
| 2     | `/about/journey`             | Journey                   | Life/career timeline.                                                     |
| 2     | `/about/skills`              | Skills                    | Tech stack (AI, FastAPI, Docker, etc.).                                   |
| 1     | `/projects`                  | **Projects**              | Showcase of all works with filters.                                       |
| 2     | `/projects/featured`         | Featured Projects         | Top 3–5 portfolio highlights.                                             |
| 2     | `/projects/archive`          | Archive                   | Past or deprecated works.                                                 |
| 2     | `/projects/roadmap`          | Roadmap                   | Future/ongoing projects.                                                  |
| 2     | `/projects/<slug>`           | Project Details           | Full case study with architecture diagrams & lessons.                     |
| 1     | `/blog`                      | **Blog / Writing**        | Knowledge hub for essays, tutorials, notes.                               |
| 2     | `/blog/series`               | Blog Series               | Organized categories.                                                     |
| 3     | `/blog/series/decision-logs` | Decision Logs             | Technical reasoning series.                                               |
| 3     | `/blog/series/system-design` | System Design Notes       | Deep engineering write-ups.                                               |
| 3     | `/blog/series/ethics`        | Ethics & Fairness         | Ethical reflections.                                                      |
| 3     | `/blog/series/reading-notes` | Reading Notes             | Book & paper takeaways.                                                   |
| 3     | `/blog/series/til`           | Today I Learned           | Short tips or fixes.                                                      |
| 2     | `/blog/changelog`            | Changelog                 | Project & learning log.                                                   |
| 2     | `/blog/now`                  | Now Page                  | Current focus & active research topics.                                   |
| 1     | `/services`                  | **Services**              | Consulting & freelance offers.                                            |
| 2     | `/services/offerings`        | Offerings                 | Detailed list of available services.                                      |
| 2     | `/services/process`          | Process                   | Step-by-step engagement flow.                                             |
| 2     | `/services/pricing`          | Pricing                   | Packages / hourly / project models.                                       |
| 1     | `/labs`                      | **Labs / Experiments**    | Experimental AI projects & code.                                          |
| 2     | `/labs/prototypes`           | AI Prototypes             | LLM, Whisper, CV demos.                                                   |
| 2     | `/labs/creative`             | Creative Tech             | Artistic / narrative experiments.                                         |
| 2     | `/labs/code-snippets`        | Code Snippets             | Utilities / scripts.                                                      |
| 1     | `/library`                   | **Library / Resources**   | Reading, research, media kit.                                             |
| 2     | `/library/reading-list`      | Reading List              | Books, papers, notes.                                                     |
| 2     | `/library/research-notes`    | Research Notes            | Summaries & findings.                                                     |
| 2     | `/library/tools`             | Tools & Frameworks        | Curated resources.                                                        |
| 2     | `/library/influences`        | Influences                | Mentors & systems.                                                        |
| 2     | `/library/media-kit`         | Media Kit                 | Bio, headshot, logo.                                                      |
| 2     | `/library/press`             | Press                     | Interviews / mentions.                                                    |
| 1     | `/contact`                   | **Contact**               | Form, email, schedule.                                                    |
| 1     | `/resume`                    | **Resume**                | Online CV + download link.                                                |
| 1     | `/newsletter`                | **Newsletter**            | Subscription & archive.                                                   |
| 1     | `/creative`                  | **Creative Works**        | Art, writing, video, games.                                               |
| 2     | `/creative/video`            | Video                     | AI + storytelling.                                                        |
| 2     | `/creative/art`              | Art                       | Visual explorations.                                                      |
| 2     | `/creative/writing`          | Writing                   | Non-technical essays.                                                     |
| 2     | `/creative/game`             | Game Design               | Interactive ideas.                                                        |
| 1     | `/education`                 | **Education**             | Teaching & speaking.                                                      |
| 2     | `/education/teaching`        | Teaching                  | Courses, tutorials.                                                       |
| 2     | `/education/speaking`        | Speaking                  | Talks & slides.                                                           |
| 2     | `/education/resources`       | Resources                 | Free / paid downloads.                                                    |
| 1     | `/timeline`                  | **Timeline**              | Visual career & life map.                                                 |
| 1     | `/meta`                      | **Meta Realm**            | Inner philosophy & frameworks.                                            |
| 2     | `/meta/personality`          | Personality               | INTP & Big Five work modes.                                               |
| 2     | `/meta/tarot`                | Tarot                     | Justice & High Priestess archetypes.                                      |
| 2     | `/meta/numerology`           | Numerology                | Structural vibration 4-5-8.                                               |
| 2     | `/meta/bazi`                 | Bazi                      | Metal–Earth interpretation.                                               |
| 2     | `/meta/tcm`                  | TCM / Lifestyle           | Calm-tech health principles.                                              |
| 2     | `/meta/philosophy-of-work`   | Philosophy of Work        | Ethical framework.                                                        |
| 2     | `/meta/systems`              | Systems & Frameworks      | Problem → Pattern → Proof models.                                         |
| 2     | `/meta/justice-manifesto`    | Justice Manifesto         | Personal ethics code.                                                     |
| 2     | `/meta/uses`                 | Uses                      | Tools, hardware, software.                                                |
| 1     | `/inner`                     | **Private Realm (Login)** | NDA & personal research.                                                  |
| 2     | `/inner/dashboard`           | Dashboard                 | Overview & links.                                                         |
| 2     | `/inner/case-studies`        | NDA Case Studies          | Confidential projects.                                                    |
| 2     | `/inner/research`            | Research Docs             | ADRs, diagrams, logs.                                                     |
| 2     | `/inner/resources`           | Templates & Prompts       | Frameworks / runbooks.                                                    |
| 2     | `/inner/journals`            | Journals                  | Reflection & learning.                                                    |
| 2     | `/inner/metaphysics`         | Metaphysics               | Private charts & analyses.                                                |
| 2     | `/inner/clients`             | Clients                   | Company-specific materials.                                               |
| 2     | `/inner/admin`               | Admin                     | Drafts & analytics.                                                       |
| 1     | `/foundation`                | **System / Legal**        | Technical utilities & policies.                                           |
| 2     | `/foundation/search`         | Search                    | Global search.                                                            |
| 2     | `/foundation/sitemap`        | Sitemap                   | Auto-generated XML + page list.                                           |
| 2     | `/foundation/404`            | 404                       | Friendly error page.                                                      |
| 2     | `/foundation/privacy`        | Privacy Policy            | Compliance.                                                               |
| 2     | `/foundation/terms`          | Terms                     | Site usage terms.                                                         |
| 2     | `/foundation/cookies`        | Cookies                   | Policy.                                                                   |
| 2     | `/foundation/accessibility`  | Accessibility Statement   | WCAG commitment.                                                          |
| 2     | `/foundation/changelog`      | Changelog                 | Updates log.                                                              |
| 1     | `/community`                 | Community                 | Q&A / mentorship.                                                         |
| 1     | `/collaborate`               | Collaborate               | Partner with you.                                                         |
| 1     | `/shop`                      | Shop                      | Templates, courses, digital tools.                                        |
| 1     | `/patron`                    | Patron                    | Donation & support page.                                                  |

---

# 🎨 VISUAL GROUPING SUMMARY

| Realm                   | Representative Color         | Core Purpose                  |
| ----------------------- | ---------------------------- | ----------------------------- |
| 🌞 Outer                | **Gold / Light Slate**       | Professional, public showcase |
| 🌙 Inner                | **Dark Slate / Gray**        | Confidential, deep research   |
| 🜂 Meta                  | **Sand / Neutral**           | Self, philosophy, structure   |
| 🜃 Foundation            | **Graphite / Low Contrast**  | Legal, technical base         |
| 🪐 Creative / Education | **Soft Earth / Warm Accent** | Art, teaching, creative work  |

---

# 🧠 Quick Navigation Concept

```
Top Nav:
[Home] [About] [Projects] [Blog] [Labs] [Services] [Library] [Contact]

Footer Nav:
[Resume] [Newsletter] [Meta] [Creative] [Education] [Timeline] [Privacy] [Sitemap]

Hidden Nav (Login):
[Inner Dashboard] [Case Studies] [Research] [Journals] [Resources]
```
