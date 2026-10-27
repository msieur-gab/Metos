# Decisions

Newest last. Each entry: what was decided, why, and what was rejected.

## 2026-10-27

**Dusk OS is a reference and a later target, not the base.** Dusk is a 32-bit Forth OS with no networking, concurrency or crypto. It fits a bare-metal Pi Zero 2W (the Pi 1–3 target), not the Orange Pi's H618. metos borrows its ethos (operators, not users; small enough to understand) and may run on it later in Forth.

**Name: metos.** From *mētis*, Greek for practical, cunning know-how, + OS. Rejected *xero* (Greek *xērós* means "dry").

**Engine: JS offline PWA to start, C as the target, Forth also a target.** JS gives a head start and runs on any browser; the engine is written to port (whole-number scores, word lists, no libraries). First device: laptop.

**Seed topics:** water, wild edible plants, vegetable growing, fire and shelter.

**Files: one flat folder, structure inside each file.** Entries get copied one at a time; a category in a folder path is lost on the first copy. Many topics belong to several categories (nettle is food, medicine and fibre). Tags in the file instead. Folders may exist for browsing but never carry meaning.

**Header: plain `key: value` lines, not YAML.** Easy to parse in any language, including Forth. Keys: title, aka, tags, warn, see, source.

**Markdown over plain text.** Markdown can carry drawings (ASCII diagrams in code blocks, images) and sections; plain `.txt` still loads.

**Abstain below a threshold, ask when two entries tie.** A named subject must score at least 10; two named entries within 3 points get "which one do you mean?".

**Lives in `msieur-gab/experiments`, folder `metos/`, branch `metos`.**

**Runtime layers recorded** (see `roadmap.md`): files themselves → browser page → portable binary → ESP32 beacon → bootable/Forth.

**SVG is portable as text but not as a picture.** It needs a large renderer that microcontrollers and Dusk don't have. If kept, limit to a subset (line, polyline, polygon, rect, circle, ellipse, text).

**Pictures as text: the `pic` block.** A photo is converted into a palette (up to 16 colours) plus one character per pixel, characters ordered by brightness so the raw text reads as ASCII art. Chosen over ASCII-only, Braille and PBM because one block serves every target: colour in browsers, half-blocks in terminals, raw text anywhere, trivial to paint from C or Forth. Tested with a dandelion: recognisable from 48 px wide (≈2.5 KB); 96 px (≈10 KB) is the sweet spot. Pictures must not be abstract: you should recognise the plant.

**A picture in the summary is the entry's portrait** and shows on every card for that entry. Pixels are excluded from search; the caption is searchable.

**No stock images in the repo.** The test dandelion looked like a stock illustration and was not committed.

**Guided editor for writing entries by hand.** Chosen over a plain text template in the app. Includes editing existing entries, a "try a question" box that checks the entry can be found, saving into the kb folder on desktop Chrome (refreshing `kb.js`), and `kb/_template.md` for any text editor. Files starting with `_` are never entries.

**Typeface: Departure Mono, everywhere.** A pixel monospace (SIL OFL), matching the pixel pictures and the terminal spirit. Embedded as a data URI so it loads from `file://`. Sizes snapped to its 11 px grid (11, 16.5, 22).

**Project memory lives in the repo** (`CLAUDE.md`, `docs/`) so any Claude instance can pick up the context.

**USB stick: redbean app with a plain-file fallback.** Gab chose this from four options (plain stick, redbean app, C terminal program, bootable stick). `metos.com` is redbean with `server/init.lua` inside. It serves the stick's own folder, reads `kb/` live, saves entries from the editor onto the stick in any browser, and refreshes `kb.js` and `CONTENTS.md` so opening `index.html` without the program still works. Only the computer itself may save; other devices can read. The C terminal program comes next as the no-browser layer.

**redbean built from source** (Cosmopolitan 4.0.2) as one file for x86-64 and 64-bit ARM, because an x86-only build refuses to start on Apple Silicon and ARM Linux. On Apple Silicon the first run needs Apple's command line tools.

**Handoff to Claude Code on the desktop** for real-hardware tests: `HANDOFF.md`.

**The portrait moves to the end of the entry, in a `## picture` section** (supersedes "a picture in the summary is the entry's portrait"). Gab, after adding a picture to the dandelion: "the engine let me add the generated image to the correct md file, but in the wrong place". A 96 px block is about four times longer than the entry's text and buried it. The picture still shows on every card for that entry; the terminal shows it when it opens the entry. Rejected: a separate file in `kb/img/` with a reference, because an entry copied on its own would lose its picture, and a page opened from `file://` cannot read a text file next to it without packing it into `kb.js`. The editor reads older entries with the picture in the summary and moves it to the end when saving.

**96 px stays the default picture width.** Rejected: 48 or 64 px to keep files small. Gab: "i think 96px is much more legible and preserve the shape of the object, below people might not recognise what it is".

**Grey tone, and tap a picture to see its characters.** The picture tool has a Tone choice: Colour, or evenly spaced greys from black to white (2 greys dithered gives black and white dots). In a card, tapping a picture switches between its pixels and its raw characters, as a screen with no graphics shows it. It came from Gab's realisation: "it was not about adding a color parameter, is that on this device or browser it keep using the bitmap rather than the generated ascii or dither". Open: on the dark page the characters read as a negative; whether the text view, or the whole page, gets a light mode is not decided.

**metos moves to its own repo, `msieur-gab/metos`** (supersedes "lives in `msieur-gab/experiments`, folder `metos/`, branch `metos`"). Gab: "it will be nice actually to create a specific project folder for it, rather than running it inside experiment". The history of the `metos/` folder came along (git subtree split); the `metos` branch of experiments stays as it was. Rejected: a second local checkout of experiments, which kept the code one folder down, beside the other experiments.

**Text stays; pictures support it, several per entry.** Gab considered a picture-first metos (if knowledge and language are lost, the visual proof is what lets someone tell one plant from another) and settled on the balance of old botanical books: a drawing with two or three views to tell plants apart, and text carrying the knowledge. So: several pictures per entry (views such as whole plant, leaf, flower, root, fruit), especially where lookalikes are dangerous. Not hundreds of pictures, not a visual-only system.

**Scope widens beyond plants:** trees, fruits, roots, everything in nature people need to recognise.

**Idea to explore: a season calendar from observation.** Knowing the season from what you see and feel, without a date. Two references: the Chinese 24 solar terms (二十四节气), named for weather and nature, each split into three pentads (72 in all) mostly named after nature observations, written for the North China Plain climate, UNESCO intangible heritage since 2016; and the German phenological calendar (DWD data), ten seasons each started by an indicator plant (hazel flowering starts Vorfrühling, forsythia Erstfrühling, apple blossom Vollfrühling, elder flowering Frühsommer, lime flowering Hochsommer, first early apples Spätsommer, elderberries ripe Frühherbst, acorns ripe Vollherbst, oak leaves colouring Spätherbst, oak leaf fall Winter).

**2026-10-27: usability over retro style.** Gab explored a text-only interface and three retro looks (early desktop, text terminal, teletext), applied to the real app on the branches `style-teletext` and `style-terminal`. Conclusion: in a browser, imitating an old system's look adds no robustness, and both style branches shrank body text to 11 px, which hurts reading on a phone. Kept from the exploration, in `main`: the sticky top menu, the topic shortcuts in the bottom bar just above the ask field (always in reach), and an Invert switch remembered on the device. `skin.css` stays as an empty style layer. The two style branches remain as references, not to be merged. Worth keeping in mind for later: a four-tone high-contrast option (sun, e-ink), teletext's big title and full-width warning band, and that what carries over to C and Forth is the order on screen (warning, picture, text, sections, related, source), not a look. Next: a readability and usability pass judged against real conditions (sun, one hand, cold fingers, old phone, stress).
