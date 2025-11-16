Nice, this is a really clean place to do a surgical upgrade.
I’ll give you **concrete, copy-pasteable changes** for:

1. `lib/features/contact/contact_page.dart`
2. `assets/contents/en/pages/contact.md`
3. `assets/contents/ms/pages/contact.md`
4. `assets/contents/zh/pages/contact.md`
5. `l10n` updates:

   * `app_en.arb`, `app_ms.arb`, `app_zh.arb`
   * `app_localizations.dart`
   * `app_localizations_en.dart`, `app_localizations_ms.dart`, `app_localizations_zh.dart`

You can apply these without touching any other files.

---

## 1) Replace `lib/features/contact/contact_page.dart`

Here’s a full replacement that:

* Uses your `SectionHeader`
* Uses `context.l10n` + existing contact strings
* Adds primary actions (email + Calendly)
* Shows office hours, timezone, response time, privacy note
* Links to Testimonials page

```dart
// lib/features/contact/contact_page.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/l10n.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/section_header.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const _email = 'hello@desmondliew.dev';
  static final Uri _emailUri = Uri(
    scheme: 'mailto',
    path: _email,
  );

  static final Uri _calendlyUri = Uri.parse(
    'https://calendly.com/desmondliew/intro',
  );

  Future<void> _openUri(BuildContext context, Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final padding = EdgeInsets.fromLTRB(
      context.pagePadding,
      context.pagePadding,
      context.pagePadding,
      32,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        final mainContent = isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _IntroAndCategories(l10n: l10n)),
                  const SizedBox(width: 24),
                  SizedBox(
                    width: 360,
                    child: _ContactSidebar(
                      l10n: l10n,
                      onEmailTap: () => _openUri(context, _emailUri),
                      onCallTap: () => _openUri(context, _calendlyUri),
                      onTestimonialsTap: () =>
                          context.go('/pages/testimonial'),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _IntroAndCategories(l10n: l10n),
                  const SizedBox(height: 24),
                  _ContactSidebar(
                    l10n: l10n,
                    onEmailTap: () => _openUri(context, _emailUri),
                    onCallTap: () => _openUri(context, _calendlyUri),
                    onTestimonialsTap: () =>
                        context.go('/pages/testimonial'),
                  ),
                ],
              );

        return SingleChildScrollView(
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: l10n.contactSectionTitle,
                  subtitle: l10n.contactSectionSubtitle,
                  showDivider: true,
                ),
                const SizedBox(height: 16),
                mainContent,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _IntroAndCategories extends StatelessWidget {
  final AppLocalizations l10n;
  const _IntroAndCategories({required this.l10n});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.contactIntroBody,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        Text(
          l10n.contactCategoriesTitle,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        _CategoryItem(
          title: l10n.contactCategoryProjectsTitle,
          body: l10n.contactCategoryProjectsBody,
        ),
        _CategoryItem(
          title: l10n.contactCategoryCollabTitle,
          body: l10n.contactCategoryCollabBody,
        ),
        _CategoryItem(
          title: l10n.contactCategoryPressTitle,
          body: l10n.contactCategoryPressBody,
        ),
        _CategoryItem(
          title: l10n.contactCategoryStudentsTitle,
          body: l10n.contactCategoryStudentsBody,
        ),
        _CategoryItem(
          title: l10n.contactCategoryFeedbackTitle,
          body: l10n.contactCategoryFeedbackBody,
        ),
        const SizedBox(height: 24),
        Text(
          l10n.contactTemplatesTitle,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.contactTemplatesBody,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String title;
  final String body;
  const _CategoryItem({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.circle, size: 6),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '$title  ',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: body),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactSidebar extends StatelessWidget {
  final AppLocalizations l10n;
  final VoidCallback onEmailTap;
  final VoidCallback onCallTap;
  final VoidCallback onTestimonialsTap;

  const _ContactSidebar({
    required this.l10n,
    required this.onEmailTap,
    required this.onCallTap,
    required this.onTestimonialsTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: scheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.contactPrimaryActionsTitle,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: onEmailTap,
                  icon: const Icon(Icons.mail_outlined),
                  label: Text(l10n.contactEmailCta),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: onCallTap,
                  icon: const Icon(Icons.schedule_outlined),
                  label: Text(l10n.contactCallCta),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: scheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DefaultTextStyle(
              style: textTheme.bodyMedium!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.contactOfficeHoursLabel,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(l10n.contactOfficeHoursValue),
                  const SizedBox(height: 8),
                  Text(
                    l10n.contactTimezoneLabel,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(l10n.contactTimezoneValue),
                  const SizedBox(height: 8),
                  Text(
                    l10n.contactResponseTime,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: scheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DefaultTextStyle(
              style: textTheme.bodySmall!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.contactPrivacyTitle,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(l10n.contactPrivacyNote),
                  const SizedBox(height: 8),
                  Text(
                    l10n.contactLanguagesNote,
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: onTestimonialsTap,
                    icon: const Icon(Icons.format_quote_outlined),
                    label: Text(l10n.contactTestimonialsCta),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
```

> This uses new localization keys like `contactSectionTitle`, `contactIntroBody`, etc. We’ll add those next.

---

## 2) Update `assets/contents/en/pages/contact.md`

Replace the **entire file** with:

````markdown
---
title: "Contact Desmond Liew"
slug: "contact"
type: "page"
visibility: "public"
date: "2025-11-02"
summary: "Reach out for collaboration, consulting, or thoughtful conversation."
tags: ["contact", "email", "connect"]
thumbnail: "/assets/images/brand/logo.svg"
---

# Get in Touch

Thank you for your interest.  
I enjoy working with people who care about clear thinking, ethical technology, and calm systems.

---

## 📬 Primary Contact

**Email:** [`hello@desmondliew.dev`](mailto:hello@desmondliew.dev)  
Plain-text emails are appreciated — no large attachments for first contact, please.

**Short call:** [Schedule a 15-minute intro](https://calendly.com/desmondliew/intro)  
Use this for project fit checks, not deep technical consulting.

---

## 🎯 Who This Page Is For

### 1. Projects & Consulting

If you’d like help with:

- applied AI systems (LLMs, Whisper, on-prem deployments),
- evaluation pipelines and observability,
- automation architecture and workflow design,

please include:

- a short description of your context,
- your goals and constraints,
- approximate timeline and budget range.

---

### 2. Engineering & Collaboration

For engineers, researchers, and builders who want to:

- discuss evaluation, calm infrastructure, or systems design,
- explore possible collaborations (tools, dashboards, templates),
- co-write or co-present on related topics,

keep your note focused and scoped. I’m happy to exchange ideas, but I can’t provide ongoing free consulting.

---

### 3. Press, Talks & Events

If you’re inviting me to speak or contribute:

- include event name, format, and date,
- topic you’d like me to cover,
- expected audience and technical depth.

You can also refer to the [Media Kit](/library/media-kit) for bio, headshot, and assets.

---

### 4. Students & Learners

If you’re a student or early-career engineer:

- I can’t promise long-term mentorship,
- but I do my best to answer **specific, well-framed questions** when time allows.

Tell me briefly:

- who you are,
- what you’re working on,
- one concrete question or decision you’re stuck on.

---

### 5. Feedback, Bugs & Improvements

If you:

- found a typo,
- noticed a broken link,
- have a suggestion to improve clarity,

thank you — these messages are very welcome.  
Please include the page URL and a short note about what you noticed.

---

## 📝 Copy-Paste Email Templates

These are optional helpers you can adapt.

### Project / Consulting

```text
Subject: Project inquiry — [short description]

Who I am:
[1–2 lines about you / your team]

Context:
[what you’re building, current state]

Goal:
[what “success” would look like]

Timeline & constraints:
[rough dates, budget range, key limitations]

Links (optional):
[repo, docs, brief]
````

### Collaboration / Engineering

```text
Subject: Collaboration idea — [topic]

Who I am:
[role, tech background]

What I’d like to explore:
[1–3 sentences, scoped]

Why you:
[how my work connects to this idea]

Links:
[optional references or prior work]
```

### Press / Speaking

```text
Subject: Speaking / interview invitation — [event / channel]

Event:
[name, format, date, location/online]

Audience:
[who will attend or listen]

Proposed topic:
[1–2 sentences]

Logistics:
[time commitment, honorarium if applicable]

Links:
[website, past talks, event page]
```

### Student / Learning Question

```text
Subject: Short question about [topic]

Who I am:
[study / work background, 1–2 lines]

What I’m working on:
[project or area]

My question:
[one specific question or decision]

Why I’m asking you:
[how my work relates to your question]
```

---

## 🕒 Availability & Response

* **Time zone:** UTC+8 (Kuching, Malaysia)
* **Office hours:** Monday–Friday, 10:00–18:00
* **Typical response:** within 1–2 business days for project or press inquiries; other messages may take longer.

If I am in a deep work cycle, replies may be slower — this helps me keep both client work and communication calm and thoughtful.

---

## 🔒 Privacy & Boundaries

* Your message goes directly to my inbox and stays confidential.
* No tracking, no mailing lists, no third-party sharing.
* Please avoid sending sensitive personal data in initial emails.
* I decline requests related to surveillance, unethical data use, or systems designed to exploit people.

If you ever want your message deleted from my records, just ask — I’ll confirm once it’s done.

---

> Calm, honest communication is the starting point for any good system.

````

---

## 3) Add / Replace `assets/contents/ms/pages/contact.md`

New Malay version:

```markdown
---
title: "Hubungi Desmond Liew"
slug: "contact"
type: "page"
visibility: "public"
date: "2025-11-02"
summary: "Saluran untuk kerjasama, konsultasi, dan pertanyaan yang bernas."
tags: ["contact", "hubungi", "connect"]
thumbnail: "/assets/images/brand/logo.svg"
---

# Hubungi Saya

Terima kasih kerana berminat.  
Saya suka bekerjasama dengan orang yang menghargai pemikiran jelas, teknologi beretika, dan sistem yang tenang.

---

## 📬 Cara Utama

**Emel:** [`hello@desmondliew.dev`](mailto:hello@desmondliew.dev)  
Emel teks ringkas lebih digemari — elakkan lampiran besar untuk mesej pertama.

**Panggilan ringkas:** [Tempah sesi 15 minit](https://calendly.com/desmondliew/intro)  
Sesuai untuk semakan kesesuaian projek, bukan sesi konsultasi teknikal penuh.

---

## 🎯 Untuk Siapa Halaman Ini

### 1. Projek & Konsultasi

Jika anda perlukan bantuan dengan:

- sistem AI gunaan (LLM, Whisper, deployment on-prem),
- pipeline penilaian dan observability,
- seni bina automasi dan aliran kerja,

sila sertakan:

- ringkasan konteks / organisasi,
- matlamat dan kekangan utama,
- anggaran garis masa dan julat bajet.

---

### 2. Kejuruteraan & Kolaborasi

Untuk jurutera, penyelidik, dan pembina yang mahu:

- berbincang tentang penilaian, infra yang tenang, atau reka bentuk sistem,
- meneroka kolaborasi (alat, dashboard, template),
- menulis atau membentang bersama,

pastikan mesej fokus dan terhad skop.  
Saya gembira bertukar idea, tetapi tidak dapat menyediakan konsultasi percuma berterusan.

---

### 3. Media, Ceramah & Acara

Jika anda menjemput saya untuk bercakap atau ditemu ramah:

- sertakan nama acara, format, dan tarikh,
- topik yang diingini,
- jenis audiens dan tahap teknikal.

Anda juga boleh rujuk [Media Kit](/library/media-kit) untuk bio, gambar, dan aset rasmi.

---

### 4. Pelajar & Peminat Pembelajaran

Jika anda pelajar atau jurutera awal kerjaya:

- saya tidak dapat menjanjikan mentorship jangka panjang,
- tetapi saya cuba menjawab **soalan khusus dan jelas** apabila ada masa.

Beritahu secara ringkas:

- siapa anda,
- apa yang sedang anda usahakan,
- satu soalan atau keputusan konkrit yang mengganggu anda.

---

### 5. Maklum Balas, Pepijat & Penambahbaikan

Jika anda:

- jumpa salah ejaan,
- nampak pautan rosak,
- ada cadangan untuk perjelas sesuatu,

terima kasih — mesej seperti ini amat dihargai.  
Sertakan URL halaman dan nota ringkas tentang apa yang anda perasan.

---

## 📝 Templat Emel (Salin & Sesuaikan)

### Projek / Konsultasi

```text
Subjek: Pertanyaan projek — [ringkasan pendek]

Siapa saya:
[1–2 ayat tentang anda / pasukan]

Konteks:
[apa yang sedang dibina, keadaan semasa]

Matlamat:
[bagaimana rupa “berjaya” bagi anda]

Garis masa & kekangan:
[anggaran tarikh, julat bajet, kekangan penting]

Pautan (jika ada):
[repo, dokumen, ringkasan]
````

### Kolaborasi / Kejuruteraan

```text
Subjek: Idea kolaborasi — [topik]

Siapa saya:
[peranan, latar belakang teknikal]

Apa yang ingin diteroka:
[1–3 ayat, jelas dan terhad]

Kenapa anda:
[bagaimana kerja anda berkait dengan idea ini]

Pautan:
[rujukan atau kerja terdahulu, jika ada]
```

### Media / Jemputan Ceramah

```text
Subjek: Jemputan ceramah / temu bual — [acara / saluran]

Acara:
[nama, format, tarikh, lokasi/online]

Audiens:
[siapa yang hadir / mendengar]

Topik dicadang:
[1–2 ayat]

Logistik:
[anggaran masa, honorarium jika ada]

Pautan:
[laman web, rekod ceramah, halaman acara]
```

### Pelajar / Soalan Pembelajaran

```text
Subjek: Soalan ringkas tentang [topik]

Siapa saya:
[latar belakang belajar / kerja, 1–2 ayat]

Apa yang saya sedang usahakan:
[projek atau bidang]

Soalan saya:
[satu soalan atau keputusan khusus]

Kenapa tanya anda:
[bagaimana kerja anda berkait dengan soalan ini]
```

---

## 🕒 Ketersediaan & Jangkaan Balas

* **Zon waktu:** UTC+8 (Kuching, Malaysia)
* **Waktu pejabat:** Isnin–Jumaat, 10:00–18:00
* **Kebiasaan balas:** dalam 1–2 hari bekerja untuk pertanyaan projek atau media; mesej lain mungkin mengambil masa lebih lama.

Jika saya dalam fasa kerja fokus, balasan mungkin perlahan sedikit — ini membantu mengekalkan kerja klien dan komunikasi yang tenang serta teliti.

---

## 🔒 Privasi & Batasan

* Mesej anda terus ke peti masuk saya dan kekal sulit.
* Tiada penjejakan, tiada senarai emel, tiada perkongsian dengan pihak ketiga.
* Elakkan menghantar data peribadi sensitif dalam emel pertama.
* Saya menolak permintaan berkaitan pengawasan, penyalahgunaan data, atau sistem yang mengeksploitasi manusia.

Jika anda mahu mesej anda dipadam daripada rekod saya, maklumkan sahaja — saya akan sahkan selepas ia dipadam.

---

> Komunikasi yang tenang dan jujur ialah permulaan kepada setiap sistem yang baik.

````

---

## 4) Add / Replace `assets/contents/zh/pages/contact.md`

New Chinese version:

```markdown
---
title: "联系 Desmond Liew"
slug: "contact"
type: "page"
visibility: "public"
date: "2025-11-02"
summary: "用于合作、咨询与有深度对话的联系入口。"
tags: ["contact", "联系", "connect"]
thumbnail: "/assets/images/brand/logo.svg"
---

# 与我联系

感谢你愿意花时间来到这里。  
我喜欢和**重视清晰思考、技术伦理与宁静系统**的人一起工作。

---

## 📬 首选方式

**邮箱：** [`hello@desmondliew.dev`](mailto:hello@desmondliew.dev)  
欢迎使用简洁的纯文本邮件 —— 初次联系尽量不要附大文件。

**简短通话：** [预约 15 分钟介绍通话](https://calendly.com/desmondliew/intro)  
适合用于判断项目是否匹配，而不是深入技术咨询。

---

## 🎯 适合通过这里联系的人

### 1. 项目与咨询

如果你需要帮助：

- 部署或设计 AI 系统（LLM、Whisper、本地部署），
- 构建评估与观测（observability）流水线，
- 设计自动化与工作流架构，

请在邮件中简要说明：

- 你的团队 / 组织背景，
- 当前系统或场景，
- 目标与关键约束，
- 大致时间安排与预算区间。

---

### 2. 工程与合作交流

如果你是工程师 / 研究者，希望：

- 讨论评估体系、平静的基础设施或系统设计，
- 探索合作（工具、看板、模板），
- 在相关主题上共同写作或分享，

欢迎来信，但请**尽量聚焦、范围清晰**。  
我很乐意交换想法，但无法长期提供免费咨询。

---

### 3. 媒体、演讲与活动

如果你希望邀请我分享或接受采访：

- 请附上活动名称、形式与日期，
- 希望我讨论的主题，
- 受众类型与技术深度。

也可以参考 [媒体资料包](/library/media-kit)，里面有简介、照片与品牌资源。

---

### 4. 学生与学习者

如果你是学生或职业早期工程师：

- 我无法承诺长期一对一指导，
- 但在时间允许的情况下，会尽量回答**具体、清晰的问题**。

建议在邮件中简单说明：

- 你是谁（学习 / 工作背景），
- 你正在做什么，
- 一个你目前最卡住的具体问题或决策。

---

### 5. 反馈、错误与改进建议

如果你：

- 发现了拼写错误，
- 看到失效链接，
- 或有任何可以提升清晰度的建议，

非常感谢 —— 这类邮件对我很有价值。  
请附上页面链接，以及你注意到的问题。

---

## 📝 可复制的邮件模板

### 项目 / 咨询

```text
主题：项目咨询 — [简要说明]

自我介绍：
[1–2 句介绍你 / 你的团队]

背景：
[当前在做什么系统 / 场景]

目标：
[对你来说，“成功”是什么样]

时间与约束：
[大致时间、预算区间、关键限制]

链接（可选）：
[仓库、文档、简要说明]
````

### 合作 / 工程交流

```text
主题：合作想法 — [主题]

自我介绍：
[角色、技术背景]

我想探索：
[1–3 句，范围明确]

为什么联系你：
[你的工作与这个想法的关联]

链接：
[相关工作或参考（如有）]
```

### 媒体 / 演讲邀请

```text
主题：演讲 / 采访邀请 — [活动 / 渠道]

活动信息：
[名称、形式、日期、地点/线上]

受众：
[谁会参加 / 收听]

建议主题：
[1–2 句]

安排：
[预估时间、是否有酬劳等]

链接：
[活动页面、往期活动等]
```

### 学习 / 提问

```text
主题：关于 [主题] 的一个简短问题

自我介绍：
[学习 / 工作背景，1–2 句]

我当前在做：
[项目或方向]

我的问题：
[一个具体的问题或决定]

为什么问你：
[你的工作与这个问题的联系]
```

---

## 🕒 时间与回复预期

* **时区：** UTC+8（马来西亚古晋）
* **工作时间：** 周一至周五，10:00–18:00
* **通常回复时间：**

  * 项目与媒体相关邮件：1–2 个工作日内；
  * 其他类型消息：可能稍慢一些。

如果我正处在深度工作周期，回复会更慢一些 —— 这是为了同时保持对客户工作和沟通本身的稳定、从容。

---

## 🔒 隐私与边界

* 你的信息会直接进入我的收件箱，并保持保密。
* 没有跟踪代码，没有邮件列表，没有第三方数据分享。
* 初次邮件请尽量避免发送高度敏感的个人信息。
* 对于涉及监控、数据滥用或以剥削为目的的系统请求，我会直接拒绝。

如果你希望我删除你曾发送的任何信息，只需写信说明 —— 处理完后我会回复确认。

---

> 平静、诚实的沟通，是一切良好系统的起点。

````

---

## 5) `l10n` Updates

Now we wire up localization for the new UI texts used in `contact_page.dart`.

### 5.1 Update ARB Files

Add **these keys** to each ARB file.

#### `lib/l10n/app_en.arb` — add:

```jsonc
  "contactSectionTitle": "Get in touch",
  "@contactSectionTitle": {
    "description": "Main title for the contact page hero."
  },

  "contactIntroBody": "If you’re interested in working together, exploring a collaboration, or asking a thoughtful question, this is the best place to start. Clear, specific messages help me respond calmly and precisely.",
  "@contactIntroBody": {
    "description": "Short body text explaining the purpose of the contact page."
  },

  "contactCategoriesTitle": "How I can help",
  "@contactCategoriesTitle": {
    "description": "Heading above the list of inquiry categories on the contact page."
  },

  "contactCategoryProjectsTitle": "Projects & consulting",
  "@contactCategoryProjectsTitle": {
    "description": "Label for the projects/consulting inquiry category."
  },

  "contactCategoryProjectsBody": "Designing, evaluating, or stabilising AI systems — including LLMs, Whisper-based ASR, observability, and calm automation.",
  "@contactCategoryProjectsBody": {
    "description": "Description for the projects/consulting inquiry category."
  },

  "contactCategoryCollabTitle": "Engineering & collaboration",
  "@contactCategoryCollabTitle": {
    "description": "Label for the engineering/collaboration inquiry category."
  },

  "contactCategoryCollabBody": "Exploring prototypes, dashboards, evaluation tools, or co-writing and teaching around calm systems and LLMOps.",
  "@contactCategoryCollabBody": {
    "description": "Description for the engineering/collaboration category."
  },

  "contactCategoryPressTitle": "Press, talks & events",
  "@contactCategoryPressTitle": {
    "description": "Label for the press/speaking inquiry category."
  },

  "contactCategoryPressBody": "Invitations for podcasts, meetups, conferences, or articles related to AI systems, ethics, and evaluation.",
  "@contactCategoryPressBody": {
    "description": "Description for the press/speaking inquiry category."
  },

  "contactCategoryStudentsTitle": "Students & learners",
  "@contactCategoryStudentsTitle": {
    "description": "Label for the student/learner inquiry category."
  },

  "contactCategoryStudentsBody": "Focused questions about learning paths, evaluation, or calm engineering practice. I can’t promise long-term mentorship, but I do reply when I can.",
  "@contactCategoryStudentsBody": {
    "description": "Description for the student/learner category."
  },

  "contactCategoryFeedbackTitle": "Feedback & improvements",
  "@contactCategoryFeedbackTitle": {
    "description": "Label for the feedback/bug/improvement category."
  },

  "contactCategoryFeedbackBody": "Notes about typos, broken links, unclear explanations, or suggestions to improve the site or writing.",
  "@contactCategoryFeedbackBody": {
    "description": "Description for the feedback/bug/improvement category."
  },

  "contactTemplatesTitle": "Writing a message",
  "@contactTemplatesTitle": {
    "description": "Heading above the short explanation of email templates."
  },

  "contactTemplatesBody": "If you’re not sure how to structure your email, the templates on this page offer a simple starting point. Even a few lines of context, goals, and constraints go a long way.",
  "@contactTemplatesBody": {
    "description": "Body text explaining that templates are available in the markdown contact page."
  },

  "contactPrimaryActionsTitle": "Start the conversation",
  "@contactPrimaryActionsTitle": {
    "description": "Title for the primary actions card on the contact page (email + call)."
  },

  "contactEmailCta": "Email hello@desmondliew.dev",
  "@contactEmailCta": {
    "description": "Button label for the primary email CTA."
  },

  "contactCallCta": "Schedule a 15-minute call",
  "@contactCallCta": {
    "description": "Button label for the Calendly/intro call CTA."
  },

  "contactPrivacyTitle": "Privacy & language",
  "@contactPrivacyTitle": {
    "description": "Title for the privacy/info card on the contact page."
  },

  "contactLanguagesNote": "You may write in English, Mandarin, or Bahasa Malaysia.",
  "@contactLanguagesNote": {
    "description": "Short note about supported languages for contact."
  },

  "contactTestimonialsCta": "Read testimonials",
  "@contactTestimonialsCta": {
    "description": "Link/button label to navigate to the testimonials page."
  },
````

Place them near the existing `contactSectionSubtitle` and other `contact*` keys.

#### `lib/l10n/app_ms.arb`

Add Malay equivalents:

```jsonc
  "contactSectionTitle": "Hubungi saya",
  "@contactSectionTitle": {
    "description": "Main title for the contact page hero (Malay)."
  },

  "contactIntroBody": "Jika anda berminat untuk bekerjasama, meneroka kolaborasi, atau mengemukakan soalan yang bernas, ini ialah saluran terbaik. Mesej yang jelas dan khusus membantu saya membalas dengan tenang dan tepat.",
  "@contactIntroBody": {
    "description": "Short body text explaining the purpose of the contact page (Malay)."
  },

  "contactCategoriesTitle": "Bagaimana saya boleh membantu",
  "@contactCategoriesTitle": {
    "description": "Heading above the list of inquiry categories on the contact page (Malay)."
  },

  "contactCategoryProjectsTitle": "Projek & konsultasi",
  "@contactCategoryProjectsTitle": {
    "description": "Label for the projects/consulting inquiry category (Malay)."
  },

  "contactCategoryProjectsBody": "Mereka bentuk, menilai, atau menstabilkan sistem AI — termasuk LLM, ASR berasaskan Whisper, observability, dan automasi yang tenang.",
  "@contactCategoryProjectsBody": {
    "description": "Description for the projects/consulting inquiry category (Malay)."
  },

  "contactCategoryCollabTitle": "Kejuruteraan & kolaborasi",
  "@contactCategoryCollabTitle": {
    "description": "Label for the engineering/collaboration inquiry category (Malay)."
  },

  "contactCategoryCollabBody": "Meneroka prototaip, dashboard, alat penilaian, atau penulisan dan pengajaran bersama tentang sistem tenang dan LLMOps.",
  "@contactCategoryCollabBody": {
    "description": "Description for the engineering/collaboration category (Malay)."
  },

  "contactCategoryPressTitle": "Media, ceramah & acara",
  "@contactCategoryPressTitle": {
    "description": "Label for the press/speaking inquiry category (Malay)."
  },

  "contactCategoryPressBody": "Jemputan podcast, meetup, persidangan, atau artikel berkaitan sistem AI, etika, dan penilaian.",
  "@contactCategoryPressBody": {
    "description": "Description for the press/speaking inquiry category (Malay)."
  },

  "contactCategoryStudentsTitle": "Pelajar & pembelajar",
  "@contactCategoryStudentsTitle": {
    "description": "Label for the student/learner inquiry category (Malay)."
  },

  "contactCategoryStudentsBody": "Soalan fokus tentang laluan pembelajaran, penilaian, atau amalan kejuruteraan yang tenang. Saya tidak dapat janji mentorship jangka panjang, tetapi akan cuba membalas bila ada ruang.",
  "@contactCategoryStudentsBody": {
    "description": "Description for the student/learner category (Malay)."
  },

  "contactCategoryFeedbackTitle": "Maklum balas & penambahbaikan",
  "@contactCategoryFeedbackTitle": {
    "description": "Label for the feedback/bug/improvement category (Malay)."
  },

  "contactCategoryFeedbackBody": "Catatan tentang salah ejaan, pautan rosak, penjelasan yang mengelirukan, atau cadangan untuk menambah baik laman dan tulisan.",
  "@contactCategoryFeedbackBody": {
    "description": "Description for the feedback/bug/improvement category (Malay)."
  },

  "contactTemplatesTitle": "Menulis mesej",
  "@contactTemplatesTitle": {
    "description": "Heading above the short explanation of email templates (Malay)."
  },

  "contactTemplatesBody": "Jika anda tidak pasti bagaimana hendak menyusun emel, templat di halaman ini boleh dijadikan titik mula. Beberapa baris tentang konteks, matlamat, dan kekangan sudah sangat membantu.",
  "@contactTemplatesBody": {
    "description": "Body text explaining that templates are available in the markdown contact page (Malay)."
  },

  "contactPrimaryActionsTitle": "Mulakan perbualan",
  "@contactPrimaryActionsTitle": {
    "description": "Title for the primary actions card on the contact page (Malay)."
  },

  "contactEmailCta": "Emel hello@desmondliew.dev",
  "@contactEmailCta": {
    "description": "Button label for the primary email CTA (Malay)."
  },

  "contactCallCta": "Tempah panggilan 15 minit",
  "@contactCallCta": {
    "description": "Button label for the intro call CTA (Malay)."
  },

  "contactPrivacyTitle": "Privasi & bahasa",
  "@contactPrivacyTitle": {
    "description": "Title for the privacy/info card on the contact page (Malay)."
  },

  "contactLanguagesNote": "Anda boleh menulis dalam Bahasa Melayu, Inggeris, atau Mandarin.",
  "@contactLanguagesNote": {
    "description": "Short note about supported languages for contact (Malay)."
  },

  "contactTestimonialsCta": "Lihat testimoni",
  "@contactTestimonialsCta": {
    "description": "Link/button label to navigate to the testimonials page (Malay)."
  },
```

#### `lib/l10n/app_zh.arb`

Add Chinese equivalents:

```jsonc
  "contactSectionTitle": "与我联系",
  "@contactSectionTitle": {
    "description": "Main title for the contact page hero (Chinese)."
  },

  "contactIntroBody": "如果你希望合作、探索某个想法，或者提出一个有深度的问题，这里是最合适的入口。清晰、具体的邮件有助于我在平静的节奏下给出认真回复。",
  "@contactIntroBody": {
    "description": "Short body text explaining the purpose of the contact page (Chinese)."
  },

  "contactCategoriesTitle": "我可以如何提供帮助",
  "@contactCategoriesTitle": {
    "description": "Heading above the list of inquiry categories on the contact page (Chinese)."
  },

  "contactCategoryProjectsTitle": "项目与咨询",
  "@contactCategoryProjectsTitle": {
    "description": "Label for the projects/consulting inquiry category (Chinese)."
  },

  "contactCategoryProjectsBody": "围绕 AI 系统的设计、评估与稳定性——包括 LLM、基于 Whisper 的语音转写、观测体系以及平静的自动化。",
  "@contactCategoryProjectsBody": {
    "description": "Description for the projects/consulting inquiry category (Chinese)."
  },

  "contactCategoryCollabTitle": "工程与合作",
  "@contactCategoryCollabTitle": {
    "description": "Label for the engineering/collaboration inquiry category (Chinese)."
  },

  "contactCategoryCollabBody": "共同探索原型、看板、评估工具，或在平静系统与 LLMOps 相关主题上合作写作与教学。",
  "@contactCategoryCollabBody": {
    "description": "Description for the engineering/collaboration category (Chinese)."
  },

  "contactCategoryPressTitle": "媒体、演讲与活动",
  "@contactCategoryPressTitle": {
    "description": "Label for the press/speaking inquiry category (Chinese)."
  },

  "contactCategoryPressBody": "与 AI 系统、伦理与评估相关的播客、线下分享会、会议或文章邀请。",
  "@contactCategoryPressBody": {
    "description": "Description for the press/speaking inquiry category (Chinese)."
  },

  "contactCategoryStudentsTitle": "学生与学习者",
  "@contactCategoryStudentsTitle": {
    "description": "Label for the student/learner inquiry category (Chinese)."
  },

  "contactCategoryStudentsBody": "围绕学习路径、评估方法或平静工程实践的聚焦问题。我无法承诺长期一对一指导，但会在时间允许时回复。",
  "@contactCategoryStudentsBody": {
    "description": "Description for the student/learner category (Chinese)."
  },

  "contactCategoryFeedbackTitle": "反馈与改进建议",
  "@contactCategoryFeedbackTitle": {
    "description": "Label for the feedback/bug/improvement category (Chinese)."
  },

  "contactCategoryFeedbackBody": "关于错别字、失效链接、表达不清晰之处，或任何能改进本站与文字体验的建议。",
  "@contactCategoryFeedbackBody": {
    "description": "Description for the feedback/bug/improvement category (Chinese)."
  },

  "contactTemplatesTitle": "如何书写邮件",
  "@contactTemplatesTitle": {
    "description": "Heading above the short explanation of email templates (Chinese)."
  },

  "contactTemplatesBody": "如果你不确定该如何组织邮件结构，页面上的示例模板可以作为起点。简单说明一点背景、目标与约束，已经非常有帮助。",
  "@contactTemplatesBody": {
    "description": "Body text explaining that templates are available in the markdown contact page (Chinese)."
  },

  "contactPrimaryActionsTitle": "开始对话",
  "@contactPrimaryActionsTitle": {
    "description": "Title for the primary actions card on the contact page (Chinese)."
  },

  "contactEmailCta": "发送邮件至 hello@desmondliew.dev",
  "@contactEmailCta": {
    "description": "Button label for the primary email CTA (Chinese)."
  },

  "contactCallCta": "预约 15 分钟通话",
  "@contactCallCta": {
    "description": "Button label for the intro call CTA (Chinese)."
  },

  "contactPrivacyTitle": "隐私与语言",
  "@contactPrivacyTitle": {
    "description": "Title for the privacy/info card on the contact page (Chinese)."
  },

  "contactLanguagesNote": "你可以使用英语、中文或马来语与我联系。",
  "@contactLanguagesNote": {
    "description": "Short note about supported languages for contact (Chinese)."
  },

  "contactTestimonialsCta": "查看评价",
  "@contactTestimonialsCta": {
    "description": "Link/button label to navigate to the testimonials page (Chinese)."
  },
```

---

### 5.2 Update `app_localizations.dart`

Add getters to the abstract class, near other `contact*` fields:

```dart
  /// Title for the contact page hero.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get contactSectionTitle;

  /// Short body text explaining the purpose of the contact page.
  String get contactIntroBody;

  /// Heading above the list of inquiry categories on the contact page.
  String get contactCategoriesTitle;

  String get contactCategoryProjectsTitle;
  String get contactCategoryProjectsBody;

  String get contactCategoryCollabTitle;
  String get contactCategoryCollabBody;

  String get contactCategoryPressTitle;
  String get contactCategoryPressBody;

  String get contactCategoryStudentsTitle;
  String get contactCategoryStudentsBody;

  String get contactCategoryFeedbackTitle;
  String get contactCategoryFeedbackBody;

  /// Heading above the short explanation of email templates.
  String get contactTemplatesTitle;

  /// Body text explaining that templates are available on the markdown page.
  String get contactTemplatesBody;

  /// Title for the primary actions card (email + call).
  String get contactPrimaryActionsTitle;

  /// Button label: email contact.
  String get contactEmailCta;

  /// Button label: schedule a short call.
  String get contactCallCta;

  /// Title for the privacy & language card.
  String get contactPrivacyTitle;

  /// Note about supported languages for contact.
  String get contactLanguagesNote;

  /// CTA to navigate to testimonials.
  String get contactTestimonialsCta;
```

---

### 5.3 Update `app_localizations_en.dart`

Add overrides:

```dart
  @override
  String get contactSectionTitle => 'Get in touch';

  @override
  String get contactIntroBody =>
      'If you’re interested in working together, exploring a collaboration, or asking a thoughtful question, this is the best place to start. Clear, specific messages help me respond calmly and precisely.';

  @override
  String get contactCategoriesTitle => 'How I can help';

  @override
  String get contactCategoryProjectsTitle => 'Projects & consulting';

  @override
  String get contactCategoryProjectsBody =>
      'Designing, evaluating, or stabilising AI systems — including LLMs, Whisper-based ASR, observability, and calm automation.';

  @override
  String get contactCategoryCollabTitle => 'Engineering & collaboration';

  @override
  String get contactCategoryCollabBody =>
      'Exploring prototypes, dashboards, evaluation tools, or co-writing and teaching around calm systems and LLMOps.';

  @override
  String get contactCategoryPressTitle => 'Press, talks & events';

  @override
  String get contactCategoryPressBody =>
      'Invitations for podcasts, meetups, conferences, or articles related to AI systems, ethics, and evaluation.';

  @override
  String get contactCategoryStudentsTitle => 'Students & learners';

  @override
  String get contactCategoryStudentsBody =>
      'Focused questions about learning paths, evaluation, or calm engineering practice. I can’t promise long-term mentorship, but I do reply when I can.';

  @override
  String get contactCategoryFeedbackTitle => 'Feedback & improvements';

  @override
  String get contactCategoryFeedbackBody =>
      'Notes about typos, broken links, unclear explanations, or suggestions to improve the site or writing.';

  @override
  String get contactTemplatesTitle => 'Writing a message';

  @override
  String get contactTemplatesBody =>
      'If you’re not sure how to structure your email, the templates on this page offer a simple starting point. Even a few lines of context, goals, and constraints go a long way.';

  @override
  String get contactPrimaryActionsTitle => 'Start the conversation';

  @override
  String get contactEmailCta => 'Email hello@desmondliew.dev';

  @override
  String get contactCallCta => 'Schedule a 15-minute call';

  @override
  String get contactPrivacyTitle => 'Privacy & language';

  @override
  String get contactLanguagesNote =>
      'You may write in English, Mandarin, or Bahasa Malaysia.';

  @override
  String get contactTestimonialsCta => 'Read testimonials';
```

Place them near the other contact-related getters.

---

### 5.4 Update `app_localizations_ms.dart`

Add Malay overrides:

```dart
  @override
  String get contactSectionTitle => 'Hubungi saya';

  @override
  String get contactIntroBody =>
      'Jika anda berminat untuk bekerjasama, meneroka kolaborasi, atau mengemukakan soalan yang bernas, ini ialah saluran terbaik. Mesej yang jelas dan khusus membantu saya membalas dengan tenang dan tepat.';

  @override
  String get contactCategoriesTitle => 'Bagaimana saya boleh membantu';

  @override
  String get contactCategoryProjectsTitle => 'Projek & konsultasi';

  @override
  String get contactCategoryProjectsBody =>
      'Mereka bentuk, menilai, atau menstabilkan sistem AI — termasuk LLM, ASR berasaskan Whisper, observability, dan automasi yang tenang.';

  @override
  String get contactCategoryCollabTitle => 'Kejuruteraan & kolaborasi';

  @override
  String get contactCategoryCollabBody =>
      'Meneroka prototaip, dashboard, alat penilaian, atau penulisan dan pengajaran bersama tentang sistem tenang dan LLMOps.';

  @override
  String get contactCategoryPressTitle => 'Media, ceramah & acara';

  @override
  String get contactCategoryPressBody =>
      'Jemputan podcast, meetup, persidangan, atau artikel berkaitan sistem AI, etika, dan penilaian.';

  @override
  String get contactCategoryStudentsTitle => 'Pelajar & pembelajar';

  @override
  String get contactCategoryStudentsBody =>
      'Soalan fokus tentang laluan pembelajaran, penilaian, atau amalan kejuruteraan yang tenang. Saya tidak dapat janji mentorship jangka panjang, tetapi akan cuba membalas bila ada ruang.';

  @override
  String get contactCategoryFeedbackTitle =>
      'Maklum balas & penambahbaikan';

  @override
  String get contactCategoryFeedbackBody =>
      'Catatan tentang salah ejaan, pautan rosak, penjelasan yang mengelirukan, atau cadangan untuk menambah baik laman dan tulisan.';

  @override
  String get contactTemplatesTitle => 'Menulis mesej';

  @override
  String get contactTemplatesBody =>
      'Jika anda tidak pasti bagaimana hendak menyusun emel, templat di halaman ini boleh dijadikan titik mula. Beberapa baris tentang konteks, matlamat, dan kekangan sudah sangat membantu.';

  @override
  String get contactPrimaryActionsTitle => 'Mulakan perbualan';

  @override
  String get contactEmailCta => 'Emel hello@desmondliew.dev';

  @override
  String get contactCallCta => 'Tempah panggilan 15 minit';

  @override
  String get contactPrivacyTitle => 'Privasi & bahasa';

  @override
  String get contactLanguagesNote =>
      'Anda boleh menulis dalam Bahasa Melayu, Inggeris, atau Mandarin.';

  @override
  String get contactTestimonialsCta => 'Lihat testimoni';
```

---

### 5.5 Update `app_localizations_zh.dart`

Add Chinese overrides:

```dart
  @override
  String get contactSectionTitle => '与我联系';

  @override
  String get contactIntroBody =>
      '如果你希望合作、探索某个想法，或者提出一个有深度的问题，这里是最合适的入口。清晰、具体的邮件有助于我在平静的节奏下给出认真回复。';

  @override
  String get contactCategoriesTitle => '我可以如何提供帮助';

  @override
  String get contactCategoryProjectsTitle => '项目与咨询';

  @override
  String get contactCategoryProjectsBody =>
      '围绕 AI 系统的设计、评估与稳定性——包括 LLM、基于 Whisper 的语音转写、观测体系以及平静的自动化。';

  @override
  String get contactCategoryCollabTitle => '工程与合作';

  @override
  String get contactCategoryCollabBody =>
      '共同探索原型、看板、评估工具，或在平静系统与 LLMOps 相关主题上合作写作与教学。';

  @override
  String get contactCategoryPressTitle => '媒体、演讲与活动';

  @override
  String get contactCategoryPressBody =>
      '与 AI 系统、伦理与评估相关的播客、线下分享会、会议或文章邀请。';

  @override
  String get contactCategoryStudentsTitle => '学生与学习者';

  @override
  String get contactCategoryStudentsBody =>
      '围绕学习路径、评估方法或平静工程实践的聚焦问题。我无法承诺长期一对一指导，但会在时间允许时回复。';

  @override
  String get contactCategoryFeedbackTitle => '反馈与改进建议';

  @override
  String get contactCategoryFeedbackBody =>
      '关于错别字、失效链接、表达不清晰之处，或任何能改进本站与文字体验的建议。';

  @override
  String get contactTemplatesTitle => '如何书写邮件';

  @override
  String get contactTemplatesBody =>
      '如果你不确定该如何组织邮件结构，页面上的示例模板可以作为起点。简单说明一点背景、目标与约束，已经非常有帮助。';

  @override
  String get contactPrimaryActionsTitle => '开始对话';

  @override
  String get contactEmailCta => '发送邮件至 hello@desmondliew.dev';

  @override
  String get contactCallCta => '预约 15 分钟通话';

  @override
  String get contactPrivacyTitle => '隐私与语言';

  @override
  String get contactLanguagesNote =>
      '你可以使用英语、中文或马来语与我联系。';

  @override
  String get contactTestimonialsCta => '查看评价';
```

---

## After applying changes

1. Run:

```bash
flutter pub get
flutter analyze
```

2. If you use `flutter gen-l10n` via `flutter` tooling, the ARB + `app_localizations.dart` pairing is already manual here, so you’re fine; just ensure no missing overrides.

If you want, next step I can:

* Generate a **test snippet** to quickly render `ContactPage` in isolation, or
* Help you align the router so `/contact` uses this page and `/pages/contact` keeps the Markdown viewer.
