---
title: The Two Curves
type: essay
status: draft-v1-en
created: 2026-04-06
translated: 2026-04-16
tags:
  - AI
  - verification
  - personal-essay
---

# The Two Curves

Have you ever handed something off to someone else for six months, then one day had to do it yourself again — and realized your hands had forgotten how?

That morning I was staring at a failing point the AI had flagged. I froze. Was this an RTL bug or a bench issue? The AI was confident: RTL bug. But something in my gut said bench. I took a sip of coffee that somehow had no taste, and opened the waveform manually to check.

This was the kind of thing I'd been doing every day for the past year. But now — which signal should I be looking at? I clicked through them one by one, rusty, until my eyes caught it. Just as I suspected: the bench was driving an illegal signal. It was a bench problem.

Per the usual routine, I fed the correct conclusion back to the AI. Updated its memory so it wouldn't get this wrong next time.

The AI replied: "Updated." And that was that. I trusted it would make a better call next time. Everything was working as designed.

But my eyes stayed on that word — "Updated." During that whole process of pulling up waveforms, how long had I hesitated?

It had been so long since I'd traced signals myself. It took me the entire morning to find what, six months ago, would've taken me the time it takes to brew a pour-over. And if I had taken the AI's wrong answer as correct — the AI can't be held responsible. A person has to be. I have to be.

The thought that I'd nearly sent the wrong root cause to the designer turned the tasteless coffee in my mouth bitter. I'm a verification engineer. If I can't even tell the difference between a symptom and a root cause before passing it along, then I'm not doing my job. Then there's no reason for me to exist in this role.

If the story ended here, the conclusion would be simple — AI is replacing me, just like Oracle laid off twenty thousand people last week. But something that happened last month stopped me from thinking that way entirely.

---

I'd just taken over verification for a new block. My manager told me: "Get all coverage to 100%." My mind went blank. There was a complex predictor inside this block — how was I supposed to hit 100%? While my brain was still buffering, I drifted over to the company's AI tool and asked: if you needed to hit the overflow condition on this predictor, how would you do it?

I watched the terminal blink as lines of text streamed out, and the only thought in my head was *wow*. A test pattern I hadn't even begun to formulate — it had already built one. And it actually matched the microarchitecture. I understood what it did. But did I have the same idea myself? "No." My brain was very sure about that.

But wait.

Thirty minutes earlier, this same AI had called a bench issue an RTL bug. I didn't trust it, pulled up the waveform myself, and was right. That moment when I frowned at the result — it wasn't knowledge, it wasn't a rule. It was a kind of instinct I can't quite articulate: this result smells wrong.

I can't do what the AI does. The AI can't do what I do. How can both of these be true at the same time?

---

I thought about it for a long time. The closest I got was this: the AI exhausts every possible path within known rules. On that predictor problem, its search space was vastly larger than what my brain could cover. But exhaustive search requires the rules to be complete. That morning's bench issue? The rules weren't complete — the spec didn't clearly define what was legal under that boundary condition. The AI had nothing to search over, so it guessed wrong. And I smelled that something was off.

That ability to smell when something is off — some people call it judgment, some call it taste. Whatever you call it, it's something that grew out of pulling thousands of waveforms over thousands of hours.

The problem is, I haven't pulled waveforms myself in six months.

**The capacity for exhaustive search grows with data. Taste atrophies without practice.** These two curves will cross someday.

I took another sip of coffee. This time I could taste it — bitter.
