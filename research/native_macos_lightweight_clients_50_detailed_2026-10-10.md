# 50 Native and Lightweight macOS App Alternatives

**GitHub research catalog · October 10, 2026**  
**Scope:** 50 public GitHub repositories covering alternate clients for existing services and leaner replacements for desktop software.  
**Focus:** macOS compatibility, architecture (Swift, Rust, C++, Qt, terminal), usability, maintenance signals and practical tradeoffs.

> This is a curated **research directory**, not a tested speed benchmark or a certification that all 50 are production-ready. Individual authors' performance claims are identified as such. Repository metadata and selected READMEs were checked on October 10, 2026; figures will change. A recent code push is **not** a release, and open source code is **not** a security audit.

## Executive summary

The most interesting recent trend is developers building original desktop clients against the same online services rather than wrapping their existing websites. **Spotifast** and **ZapFast** (Rust/egui) and **Make Slack Great Again** (C++ custom engine) exemplify genuinely browser-free approaches. **Swiftcord** and **SakuraCord** highlight Apple's native SwiftUI route. **Kaset**, **WhatsApp Desk** and **Yaak** illustrate intermediate approaches that keep WebKit/web frontends but avoid shipping Electron's bundled Chromium.

**Best projects to inspect first:** [Spotifast](https://github.com/crmne/spotifast), [ZapFast](https://github.com/crmne/zapfast), [Make Slack Great Again](https://github.com/punarinta/make-slack-great-again), [Swiftcord](https://github.com/SwiftcordApp/Swiftcord), [Kaset](https://github.com/sozercan/kaset), [Ice Cubes](https://github.com/Dimillian/IceCubesApp), [Ghostty](https://github.com/ghostty-org/ghostty), [Zed](https://github.com/zed-industries/zed), [TablePro](https://github.com/TableProApp/TablePro), and [Tusk](https://github.com/alpcanaydin/tusk).

**Three categories should not be conflated:**

1. **Native reimplementation of the original service:** independent client UI/protocol integration, e.g. Spotifast, ZapFast, msga. Best match to the original search.
2. **Lightweight hybrid or native-webview client:** removes bundled Electron runtime or uses native chrome around web-backed content, e.g. WhatsApp Desk, Kaset, Yaak. Useful but not a complete native rewrite.
3. **Adjacent productivity replacements:** replaces a tool or workflow rather than preserving the same backend/service, e.g. Ghostty for terminal use, Zed for editing, GitUp for Git or FSNotes for personal notes.

### Interpretation guide

- **Last pushed:** last `pushed_at` date from the GitHub repository API. It does *not* tell you when a stable build shipped or whether the main application code changed.
- **Stars:** approximate GitHub stars from this snapshot. Not a quality, security or performance score.
- **License:** GitHub's detected SPDX value when available; where unknown, the README may be more informative. A public repository is not automatically open-source licensed.
- **Readiness:** editorial characterization informed by maintainer README wording, community size, and current code activity; **not** a hands-on functional test.
- **Native:** the UI is rendered by AppKit/SwiftUI/Qt or a compiled GPU/UI engine without a hosted website being the app. Qt is not Apple-native in the strictest sense, but does avoid Electron. TUI means terminal interface.
- **Service risk:** unofficial clients can lose access or break after API changes, authentication changes, DRM changes or service policy enforcement. Consider account security and terms of service.

## Quick index

### Messaging, social and communities

Direct service or protocol clients. Several are native redraws; others are Qt or terminal interfaces.

| # | Project | Original service/tool | Implementation | Stars* | Last push |
|---:|---|---|---|---:|---|
| 1 | [ZapFast](https://github.com/crmne/zapfast) | WhatsApp desktop | Rust · egui · whatsapp-rust | 1,753 | 2026-10-10 |
| 2 | [Make Slack Great Again (msga)](https://github.com/punarinta/make-slack-great-again) | Slack desktop | C++20 · custom renderer · native OS adapters | 145 | 2026-10-10 |
| 3 | [Swiftcord](https://github.com/SwiftcordApp/Swiftcord) | Discord desktop | Swift · SwiftUI | 2,733 | 2026-10-02 |
| 4 | [SakuraCord](https://github.com/SakuraCordApp/SakuraCord) | Discord desktop | Swift · SwiftUI · AppKit | 136 | 2026-10-10 |
| 5 | [WhatsApp Desk](https://github.com/vianziro/Whatsapp-Dekstop) | WhatsApp desktop | Go · system WebKit/WebView | 220 | 2026-10-04 |
| 6 | [Discordo](https://github.com/ayn2op/discordo) | Discord desktop | Go · terminal UI | 5,822 | 2026-10-09 |
| 7 | [Ice Cubes](https://github.com/Dimillian/IceCubesApp) | Mastodon website and desktop experience | Swift · SwiftUI | 7,081 | 2026-10-08 |
| 8 | [Mactrix](https://github.com/viktorstrate/mactrix) | Matrix / Element | SwiftUI · matrix-rust-sdk | 252 | 2026-10-10 |
| 9 | [Nheko](https://github.com/Nheko-Reborn/nheko) | Matrix / Element | C++20 · Qt | 2,507 | 2026-09-11 |
| 10 | [Hacker News](https://github.com/IronsideXXVI/Hacker-News) | Hacker News website | Swift · SwiftUI | 429 | 2026-07-23 |
| 11 | [Chatterino](https://github.com/Chatterino/chatterino2) | Twitch chat | C++ · Qt | 2,570 | 2026-10-10 |

### Music, video and streaming

Original streaming services as well as self-hosted music/video ecosystems.

| # | Project | Original service/tool | Implementation | Stars* | Last push |
|---:|---|---|---|---:|---|
| 12 | [Spotifast](https://github.com/crmne/spotifast) | Spotify desktop | Rust · egui · librespot | 7,055 | 2026-10-10 |
| 13 | [Psst](https://github.com/jpochyla/psst) | Spotify desktop | Rust · custom GUI | 9,486 | 2026-08-18 |
| 14 | [Spotify-Qt](https://github.com/kraxarn/spotify-qt) | Spotify desktop | C++ · Qt; separate backend | 1,489 | 2026-10-05 |
| 15 | [Spotifust](https://github.com/gefydev/spotifust) | Spotify desktop | Rust · iced | 39 | 2026-10-08 |
| 16 | [ncspot](https://github.com/hrkfdn/ncspot) | Spotify desktop | Rust · ncurses · librespot | 6,791 | 2026-10-09 |
| 17 | [spotify_player](https://github.com/aome510/spotify-player) | Spotify desktop | Rust · terminal UI · Spotify APIs | 7,270 | 2026-09-19 |
| 18 | [Spotiglass](https://github.com/isaaclins/spotiglass) | Spotify desktop | SwiftUI · Spotify Web API · Web Playback SDK | 9 | 2026-10-07 |
| 19 | [Kaset](https://github.com/sozercan/kaset) | YouTube and YouTube Music website | Swift · SwiftUI · web-assisted playback | 2,378 | 2026-10-03 |
| 20 | [SmartTube](https://github.com/milika/SmartTubeIOS) | YouTube | Swift · SwiftUI · native video APIs | 396 | 2026-10-10 |
| 21 | [Yattee](https://github.com/yattee/yattee) | YouTube/video website | Swift · SwiftUI; Invidious/Piped/self-hosted integrations | 3,736 | 2026-08-23 |
| 22 | [NativeYoutube](https://github.com/Aayush9029/NativeYoutube) | YouTube website | Swift · menu bar app · YouTube Data API | 535 | 2026-09-19 |
| 23 | [YouTube X](https://github.com/fizzygx/Youtube-X) | YouTube website | SwiftUI · WKWebView · yt-dlp/ffmpeg | 56 | 2026-08-20 |
| 24 | [HyperTube Music](https://github.com/hyper-tube/app) | YouTube Music website | C++20 · Qt Quick | 10 | 2026-10-09 |
| 25 | [Riff](https://github.com/thisizmvk/Riff) | YouTube Music website | SwiftUI · InnerTube · hidden WKWebView for audio | 2 | 2026-06-20 |
| 26 | [Kumone](https://github.com/missuo/kumone) | NetEase Cloud Music desktop | Swift · SwiftUI · native service API | 1,128 | 2026-10-08 |
| 27 | [MeloX](https://github.com/youshen2/MeloX) | NetEase Cloud Music desktop | Swift · SwiftUI | 326 | 2026-09-05 |
| 28 | [Moonfin](https://github.com/Moonfin-Client/Moonfin-Core) | Jellyfin / Emby clients | Dart · Flutter | 815 | 2026-10-10 |
| 29 | [Amperfy](https://github.com/BLeeEZ/amperfy) | Ampache / Subsonic web media libraries | Swift · Apple media APIs | 1,793 | 2026-08-13 |
| 30 | [Jellia](https://github.com/cjbars/jellia) | Jellyfin music UI | SwiftUI · AVFoundation | 4 | 2026-09-10 |
| 31 | [Jellybeam](https://github.com/packetinspector/jellybeam-macos) | Jellyfin desktop UI | Rust · GPUI · libmpv · SQLite cache | 2 | 2026-10-02 |

### Email and AI workflows

Native macOS experiences in place of webmail or terminal-driven tool interfaces.

| # | Project | Original service/tool | Implementation | Stars* | Last push |
|---:|---|---|---|---:|---|
| 32 | [Postie](https://github.com/igorkulman/Postie) | Gmail in browser | SwiftUI · Gmail API · SQLite cache | 6 | 2026-10-09 |
| 33 | [Brev](https://github.com/henrikogaard/brev) | Email desktop clients and webmail | Swift · SwiftUI · IMAP/SMTP | 3 | 2026-10-10 |
| 34 | [PowerUserMail](https://github.com/isaaclins/powerusermail) | Superhuman-style email workflow | Swift · SwiftUI · command palette | 6 | 2026-10-07 |
| 35 | [Clarc](https://github.com/ttnear/Clarc) | Claude Code terminal workflows | SwiftUI · subprocess of official Claude CLI | 368 | 2026-08-20 |

### Editors, terminals and developer tools

Adjacent examples of desktop bloat reduction; these often replace a tool or workflow rather than access the identical hosted account.

| # | Project | Original service/tool | Implementation | Stars* | Last push |
|---:|---|---|---|---:|---|
| 36 | [Zed](https://github.com/zed-industries/zed) | VS Code / Atom / Cursor editing workflow | Rust · GPU-rendered custom UI | 91,539 | 2026-10-10 |
| 37 | [CodeEdit](https://github.com/CodeEditApp/CodeEdit) | VS Code / lightweight IDE | Swift · native Apple frameworks | 23,065 | 2026-08-18 |
| 38 | [Lapce](https://github.com/lapce/lapce) | VS Code / general code editors | Rust · Floem · wgpu | 38,902 | 2026-10-09 |
| 39 | [Ghostty](https://github.com/ghostty-org/ghostty) | Hyper/Warp-style terminal apps | Zig · native macOS UI · GPU acceleration | 62,031 | 2026-10-10 |
| 40 | [kitty](https://github.com/kovidgoyal/kitty) | Hyper terminal | Python/C · GPU acceleration | 35,222 | 2026-10-10 |
| 41 | [Alacritty](https://github.com/alacritty/alacritty) | Hyper terminal | Rust · OpenGL | 65,924 | 2026-10-05 |
| 42 | [GitUp](https://github.com/git-up/GitUp) | GitKraken / GitHub Desktop | Objective-C · native macOS UI | 12,133 | 2026-10-08 |
| 43 | [GitButler](https://github.com/gitbutlerapp/gitbutler) | GitKraken / GitHub Desktop | Rust · Tauri · Svelte | 21,794 | 2026-10-10 |
| 44 | [Lazygit](https://github.com/jesseduffield/lazygit) | GitKraken / GitHub Desktop | Go · terminal UI | 83,082 | 2026-10-10 |
| 45 | [GitUI](https://github.com/gitui-org/gitui) | GitKraken / GitHub Desktop | Rust · terminal UI | 22,554 | 2026-10-06 |
| 46 | [Yaak](https://github.com/mountain-loop/yaak) | Postman / Insomnia | Rust · Tauri · React | 19,299 | 2026-10-07 |
| 47 | [TablePro](https://github.com/TableProApp/TablePro) | TablePlus / DBeaver database clients | Swift · native desktop frameworks | 6,225 | 2026-10-10 |
| 48 | [Tusk](https://github.com/alpcanaydin/tusk) | DBeaver / TablePlus database clients | Rust · GPUI · GPU virtualized grids | 375 | 2026-10-05 |
| 49 | [FSNotes](https://github.com/glushchenko/fsnotes) | Electron notes / knowledge apps | Swift · native Apple UI · plain Markdown | 7,522 | 2026-10-09 |
| 50 | [NetNewsWire](https://github.com/Ranchero-Software/NetNewsWire) | Feedly/browser RSS reader | Swift · native Apple UI | 10,459 | 2026-10-10 |

---

# Detailed project profiles

Each entry includes its original-service relationship, implementation, observable GitHub signals, a feature summary and candid limitations. Project links lead to the source; README links let you verify the claims directly.

## Messaging, social and communities

### 1. ZapFast

**Repository:** [crmne/zapfast](https://github.com/crmne/zapfast) · [README](https://github.com/crmne/zapfast#readme) · [Releases](https://github.com/crmne/zapfast/releases)  
**Alternative to:** WhatsApp desktop  
**Implementation:** Rust · egui · whatsapp-rust  
**Type:** Native/protocol · **Readiness:** Actively developed  
**GitHub snapshot:** 1,753 stars · last pushed **2026-10-10** · license signal: **MIT**

**What it does:** WhatsApp companion-device client pairing to an existing account; communicates using a Rust WhatsApp protocol implementation instead of embedding WhatsApp Web. Offers regular chat features and a desktop UI.

**Why it matters:** A direct example of stripping away a browser runtime while continuing to use the original service. The README describes a subsecond startup and around 200 MB idle RAM in a **Linux** benchmark, not a verified macOS measurement.

**Tradeoffs / things to verify:** Unofficial protocol support can break when WhatsApp changes its service. Compare features against the official client, particularly calls, device pairing, encryption behavior and enterprise workflows.

### 2. Make Slack Great Again (msga)

**Repository:** [punarinta/make-slack-great-again](https://github.com/punarinta/make-slack-great-again) · [README](https://github.com/punarinta/make-slack-great-again#readme) · [Releases](https://github.com/punarinta/make-slack-great-again/releases)  
**Alternative to:** Slack desktop  
**Implementation:** C++20 · custom renderer · native OS adapters  
**Type:** Native/protocol · **Readiness:** Actively developed  
**GitHub snapshot:** 145 stars · last pushed **2026-10-10** · license signal: **GPL-3.0**

**What it does:** Reimplements channels, direct messages, threads, reactions, file handling and notifications against Slack, with a lean, custom C++ networking and rendering stack.

**Why it matters:** Unusually ambitious architecture: its README says **no Electron, no webview and no GUI toolkit**. It uses AppKit on macOS and platform-specific networking; Claude Code sessions can also appear in the workspace rail.

**Tradeoffs / things to verify:** Not a Qt app, despite an earlier summary calling it one. README documents macOS 14+ and Apple Silicon; the downloaded app was not notarized at the time checked. Evaluate workspace auth, security and feature parity.

### 3. Swiftcord

**Repository:** [SwiftcordApp/Swiftcord](https://github.com/SwiftcordApp/Swiftcord) · [README](https://github.com/SwiftcordApp/Swiftcord#readme) · [Releases](https://github.com/SwiftcordApp/Swiftcord/releases)  
**Alternative to:** Discord desktop  
**Implementation:** Swift · SwiftUI  
**Type:** Native/SwiftUI · **Readiness:** Active  
**GitHub snapshot:** 2,733 stars · last pushed **2026-10-02** · license signal: **Unspecified in API**

**What it does:** A fully native Discord desktop UI built around SwiftUI, with macOS-style navigation, messages and rich content.

**Why it matters:** A prominent native-macOS alternative to a web-technology-heavy official app; specifically aims to feel like macOS rather than a browser shell.

**Tradeoffs / things to verify:** README specifies Apple Silicon and macOS 26+ for current release. The repository points to a legacy codebase on a different branch; confirm current feature support and Discord account-policy implications.

### 4. SakuraCord

**Repository:** [SakuraCordApp/SakuraCord](https://github.com/SakuraCordApp/SakuraCord) · [README](https://github.com/SakuraCordApp/SakuraCord#readme) · [Releases](https://github.com/SakuraCordApp/SakuraCord/releases)  
**Alternative to:** Discord desktop  
**Implementation:** Swift · SwiftUI · AppKit  
**Type:** Native/SwiftUI · **Readiness:** Young / active  
**GitHub snapshot:** 136 stars · last pushed **2026-10-10** · license signal: **GPL-3.0**

**What it does:** A newer Discord client with an intentionally Mac-specific visual design, sidebar and message UI.

**Why it matters:** Especially interesting as a modern SwiftUI desktop experiment with rapid ongoing changes and a public roadmap.

**Tradeoffs / things to verify:** The README currently advertises a **macOS 27** requirement, which makes this an experimental/future-facing option rather than a drop-in replacement for most Macs; check the actual release target.

### 5. WhatsApp Desk

**Repository:** [vianziro/Whatsapp-Dekstop](https://github.com/vianziro/Whatsapp-Dekstop) · [README](https://github.com/vianziro/Whatsapp-Dekstop#readme) · [Releases](https://github.com/vianziro/Whatsapp-Dekstop/releases)  
**Alternative to:** WhatsApp desktop  
**Implementation:** Go · system WebKit/WebView  
**Type:** Thin webview · **Readiness:** New / active  
**GitHub snapshot:** 220 stars · last pushed **2026-10-04** · license signal: **MIT**

**What it does:** Uses the operating system web engine to host WhatsApp Web, with a very small app shell and native packaging. macOS uses WebKit rather than a bundled Chromium runtime.

**Why it matters:** A pragmatic middle ground: less packaging and runtime overhead than Electron without rebuilding the underlying messaging protocol and UI.

**Tradeoffs / things to verify:** It remains WhatsApp Web inside an OS webview: **not a native UI rewrite**. Its privacy and performance claims are developer-reported; feature parity depends on WhatsApp Web.

### 6. Discordo

**Repository:** [ayn2op/discordo](https://github.com/ayn2op/discordo) · [README](https://github.com/ayn2op/discordo#readme) · [Releases](https://github.com/ayn2op/discordo/releases)  
**Alternative to:** Discord desktop  
**Implementation:** Go · terminal UI  
**Type:** Terminal client · **Readiness:** Established / active  
**GitHub snapshot:** 5,822 stars · last pushed **2026-10-09** · license signal: **GPL-3.0**

**What it does:** Feature-oriented Discord client for the terminal, offering text-based navigation and several authentication approaches. Builds exist for macOS, Linux and Windows.

**Why it matters:** Avoids graphics and browser overhead entirely; compelling for developers who spend most of the day in a terminal.

**Tradeoffs / things to verify:** Not a graphical Mac app. Evaluate authentication methods carefully and review Discord rules for unofficial clients and user-token handling before use.

### 7. Ice Cubes

**Repository:** [Dimillian/IceCubesApp](https://github.com/Dimillian/IceCubesApp) · [README](https://github.com/Dimillian/IceCubesApp#readme) · [Releases](https://github.com/Dimillian/IceCubesApp/releases)  
**Alternative to:** Mastodon website and desktop experience  
**Implementation:** Swift · SwiftUI  
**Type:** Native/SwiftUI · **Readiness:** Established / active  
**GitHub snapshot:** 7,081 stars · last pushed **2026-10-08** · license signal: **AGPL-3.0**

**What it does:** Multiplatform Mastodon application with timelines, posting, media, list and tag support; it has an explicit macOS/iPadOS sidebar layout.

**Why it matters:** Strong case study in using shared SwiftUI code across Apple devices while preserving a Mac-oriented interface.

**Tradeoffs / things to verify:** Mastodon is an open protocol/service, not a proprietary-client rewrite. This is a well-established native **alternative client**, not a lighter fork of the official Mastodon app.

### 8. Mactrix

**Repository:** [viktorstrate/mactrix](https://github.com/viktorstrate/mactrix) · [README](https://github.com/viktorstrate/mactrix#readme) · [Releases](https://github.com/viktorstrate/mactrix/releases)  
**Alternative to:** Matrix / Element  
**Implementation:** SwiftUI · matrix-rust-sdk  
**Type:** Native/SwiftUI · **Readiness:** Early development  
**GitHub snapshot:** 252 stars · last pushed **2026-10-10** · license signal: **GPL-3.0**

**What it does:** A native Matrix client for macOS, with SwiftUI presentation and Rust Matrix SDK underneath for protocol and encryption support.

**Why it matters:** Combines an Apple-native interface with a mature open-protocol library, a reusable pattern for chat client rewrites.

**Tradeoffs / things to verify:** README states it is early development with incomplete features and no regular auto-updated public release. Build from CI artifacts or Xcode; requires macOS 15.7+.

### 9. Nheko

**Repository:** [Nheko-Reborn/nheko](https://github.com/Nheko-Reborn/nheko) · [README](https://github.com/Nheko-Reborn/nheko#readme) · [Releases](https://github.com/Nheko-Reborn/nheko/releases)  
**Alternative to:** Matrix / Element  
**Implementation:** C++20 · Qt  
**Type:** Native/Qt · **Readiness:** Established / active  
**GitHub snapshot:** 2,507 stars · last pushed **2026-09-11** · license signal: **GPL-3.0**

**What it does:** Full desktop Matrix client that aims to feel like a mainstream chat application, using Qt/C++ rather than a hosted web app.

**Why it matters:** A useful comparison to Element: it serves the same Matrix ecosystem with an independent cross-platform desktop implementation.

**Tradeoffs / things to verify:** The project explicitly says its end-to-end encryption implementation has **not been audited**. Read its security and installation notes before relying on it for high-stakes private conversations.

### 10. Hacker News

**Repository:** [IronsideXXVI/Hacker-News](https://github.com/IronsideXXVI/Hacker-News) · [README](https://github.com/IronsideXXVI/Hacker-News#readme) · [Releases](https://github.com/IronsideXXVI/Hacker-News/releases)  
**Alternative to:** Hacker News website  
**Implementation:** Swift · SwiftUI  
**Type:** Native/SwiftUI · **Readiness:** Active / modest community  
**GitHub snapshot:** 429 stars · last pushed **2026-07-23** · license signal: **MIT**

**What it does:** Native macOS reader for Hacker News, replacing the browser tab with a dedicated app.

**Why it matters:** A compact illustration of SwiftUI as a way to make reading and navigation feel at home on macOS.

**Tradeoffs / things to verify:** A site reader, not a full proprietary-service rewrite. Commenting/login capabilities and degree of API coverage need a release-level check.

### 11. Chatterino

**Repository:** [Chatterino/chatterino2](https://github.com/Chatterino/chatterino2) · [README](https://github.com/Chatterino/chatterino2#readme) · [Releases](https://github.com/Chatterino/chatterino2/releases)  
**Alternative to:** Twitch chat  
**Implementation:** C++ · Qt  
**Type:** Native/Qt · **Readiness:** Established / active  
**GitHub snapshot:** 2,570 stars · last pushed **2026-10-10** · license signal: **MIT**

**What it does:** Dedicated Twitch chat client with a keyboard-friendly, multi-channel desktop interface, distributed for macOS and other platforms.

**Why it matters:** Moves one particularly resource-intensive use of Twitch out of a browser; a strong example of purpose-built native client software.

**Tradeoffs / things to verify:** **Chat only**: it is not a complete Twitch livestream watching client. Pair it with a video player or the Twitch website.

## Music, video and streaming

### 12. Spotifast

**Repository:** [crmne/spotifast](https://github.com/crmne/spotifast) · [README](https://github.com/crmne/spotifast#readme) · [Releases](https://github.com/crmne/spotifast/releases)  
**Alternative to:** Spotify desktop  
**Implementation:** Rust · egui · librespot  
**Type:** Native/protocol · **Readiness:** Popular / active  
**GitHub snapshot:** 7,055 stars · last pushed **2026-10-10** · license signal: **MIT**

**What it does:** Spotify client with library browsing, playlists, search, podcasts, playback and Spotify Connect integration, built without a browser runtime.

**Why it matters:** One of the clearest examples of this trend. Project reports typical 100–250 MB RAM and subsecond startup; the common Rust/egui foundation is shared with ZapFast.

**Tradeoffs / things to verify:** **Spotify Premium is required for actual playback.** Free accounts can browse and search. Memory numbers are author-reported and will vary by machine and workload; unofficial access can face service API changes.

### 13. Psst

**Repository:** [jpochyla/psst](https://github.com/jpochyla/psst) · [README](https://github.com/jpochyla/psst#readme) · [Releases](https://github.com/jpochyla/psst/releases)  
**Alternative to:** Spotify desktop  
**Implementation:** Rust · custom GUI  
**Type:** Native/protocol · **Readiness:** Popular / experimental  
**GitHub snapshot:** 9,486 stars · last pushed **2026-08-18** · license signal: **MIT**

**What it does:** Cross-platform native GUI Spotify client built in Rust, aiming for speed and a compact binary.

**Why it matters:** An early influential example of rebuilding the Spotify interface rather than theming the bundled Spotify app.

**Tradeoffs / things to verify:** README still warns of missing features/stability. **Premium required**; after Spotify developer-access changes in February 2026, a user-supplied Spotify Developer Client ID is needed for Web API features such as search/library/playlists.

### 14. Spotify-Qt

**Repository:** [kraxarn/spotify-qt](https://github.com/kraxarn/spotify-qt) · [README](https://github.com/kraxarn/spotify-qt#readme) · [Releases](https://github.com/kraxarn/spotify-qt/releases)  
**Alternative to:** Spotify desktop  
**Implementation:** C++ · Qt; separate backend  
**Type:** Native/Qt · **Readiness:** Established / active  
**GitHub snapshot:** 1,489 stars · last pushed **2026-10-05** · license signal: **GPL-3.0**

**What it does:** Lightweight Qt interface for interacting with Spotify. Playback integration depends on the configured compatible backend and Spotify APIs.

**Why it matters:** Separates the native front end from playback plumbing, allowing a traditional Qt desktop experience.

**Tradeoffs / things to verify:** It is **not necessarily a self-contained streaming replacement**. Check backend requirements, authorization and features; no generic RAM claim is justified by the GitHub metadata.

### 15. Spotifust

**Repository:** [gefydev/spotifust](https://github.com/gefydev/spotifust) · [README](https://github.com/gefydev/spotifust#readme) · [Releases](https://github.com/gefydev/spotifust/releases)  
**Alternative to:** Spotify desktop  
**Implementation:** Rust · iced  
**Type:** Native/protocol · **Readiness:** Early / active  
**GitHub snapshot:** 39 stars · last pushed **2026-10-08** · license signal: **GPL-3.0**

**What it does:** Cross-platform Spotify client rewritten in Rust with the iced GUI framework; the repository includes architectural and build documentation.

**Why it matters:** A useful contrast to egui-based Spotifast: different Rust UI framework and tradeoffs around layout and rendering.

**Tradeoffs / things to verify:** Tiny community and early maturity; README outlines development and some installer/build paths. Verify that macOS packaging and the features you need are working before migrating.

### 16. ncspot

**Repository:** [hrkfdn/ncspot](https://github.com/hrkfdn/ncspot) · [README](https://github.com/hrkfdn/ncspot#readme) · [Releases](https://github.com/hrkfdn/ncspot/releases)  
**Alternative to:** Spotify desktop  
**Implementation:** Rust · ncurses · librespot  
**Type:** Terminal client · **Readiness:** Established / active  
**GitHub snapshot:** 6,791 stars · last pushed **2026-10-09** · license signal: **BSD-2-Clause**

**What it does:** Terminal-based Spotify music player designed for text navigation and audio playback with librespot.

**Why it matters:** Especially appealing to keyboard-first developers; no browser or desktop windowing stack is necessary.

**Tradeoffs / things to verify:** **Requires Spotify Premium** per README. It intentionally trades graphical music discovery for a terminal interface.

### 17. spotify_player

**Repository:** [aome510/spotify-player](https://github.com/aome510/spotify-player) · [README](https://github.com/aome510/spotify-player#readme) · [Releases](https://github.com/aome510/spotify-player/releases)  
**Alternative to:** Spotify desktop  
**Implementation:** Rust · terminal UI · Spotify APIs  
**Type:** Terminal client · **Readiness:** Established / active  
**GitHub snapshot:** 7,270 stars · last pushed **2026-09-19** · license signal: **MIT**

**What it does:** Full-featured, configurable Spotify player with terminal UI, audio streaming, Spotify Connect, keyboard commands, notifications and daemon mode.

**Why it matters:** Powerful for terminal-centered workflows; can also run as a remote/daemon controller rather than a conventional desktop window.

**Tradeoffs / things to verify:** Read its authentication and custom-client-ID notes carefully. Not a GUI replacement and some service operations can depend on Spotify API access or Premium.

### 18. Spotiglass

**Repository:** [isaaclins/spotiglass](https://github.com/isaaclins/spotiglass) · [README](https://github.com/isaaclins/spotiglass#readme) · [Releases](https://github.com/isaaclins/spotiglass/releases)  
**Alternative to:** Spotify desktop  
**Implementation:** SwiftUI · Spotify Web API · Web Playback SDK  
**Type:** Hybrid/native shell · **Readiness:** Early / experimental  
**GitHub snapshot:** 9 stars · last pushed **2026-10-07** · license signal: **Unclear (NOASSERTION)**

**What it does:** Experimental Apple-native Spotify interface using SwiftUI for UI and Spotify Web Playback for music integration.

**Why it matters:** Interesting if you specifically want an Apple-style interface rather than egui/Qt.

**Tradeoffs / things to verify:** The **Web Playback SDK** means it is not an end-to-end native audio protocol rewrite; the small repo and unclear license detection warrant caution.

### 19. Kaset

**Repository:** [sozercan/kaset](https://github.com/sozercan/kaset) · [README](https://github.com/sozercan/kaset#readme) · [Releases](https://github.com/sozercan/kaset/releases)  
**Alternative to:** YouTube and YouTube Music website  
**Implementation:** Swift · SwiftUI · web-assisted playback  
**Type:** Hybrid/native shell · **Readiness:** Popular / active  
**GitHub snapshot:** 2,378 stars · last pushed **2026-10-03** · license signal: **MIT**

**What it does:** Mac-focused YouTube Music and video app with native SwiftUI navigation, media controls and integration with existing YouTube accounts and Premium media.

**Why it matters:** A strong blend of native desktop ergonomics and service compatibility, including YouTube Music and regular YouTube in one application.

**Tradeoffs / things to verify:** For protected music playback, web/DRM plumbing can still be involved. **Not equivalent to a completely browser-free playback engine**; check DRM/Premium and account requirements.

### 20. SmartTube

**Repository:** [milika/SmartTubeIOS](https://github.com/milika/SmartTubeIOS) · [README](https://github.com/milika/SmartTubeIOS#readme) · [Releases](https://github.com/milika/SmartTubeIOS/releases)  
**Alternative to:** YouTube  
**Implementation:** Swift · SwiftUI · native video APIs  
**Type:** Native/SwiftUI · **Readiness:** Active / growing  
**GitHub snapshot:** 396 stars · last pushed **2026-10-10** · license signal: **GPL-3.0**

**What it does:** YouTube client for Mac and other Apple devices, with SponsorBlock, DeArrow, Google sign-in and high-resolution playback advertised in the README.

**Why it matters:** A meaningful example of moving video UI/player controls into SwiftUI rather than using a full browser shell.

**Tradeoffs / things to verify:** macOS 14+ is documented; features and distribution differ by Apple platform. Some YouTube access and playback functions depend on third-party extraction/Google behavior.

### 21. Yattee

**Repository:** [yattee/yattee](https://github.com/yattee/yattee) · [README](https://github.com/yattee/yattee#readme) · [Releases](https://github.com/yattee/yattee/releases)  
**Alternative to:** YouTube/video website  
**Implementation:** Swift · SwiftUI; Invidious/Piped/self-hosted integrations  
**Type:** Native/SwiftUI · **Readiness:** Established / evolving  
**GitHub snapshot:** 3,736 stars · last pushed **2026-08-23** · license signal: **AGPL-3.0**

**What it does:** Privacy-focused video player for iOS, tvOS and macOS. Yattee 2 is under active development alongside an optional self-hosted yt-dlp-powered server.

**Why it matters:** A notable native frontend to online video that can favor privacy, alternative backends and cross-device use.

**Tradeoffs / things to verify:** Version 2 was still in beta when checked; confirm Mac build distribution, backend/server configuration and which providers it can actually play.

### 22. NativeYoutube

**Repository:** [Aayush9029/NativeYoutube](https://github.com/Aayush9029/NativeYoutube) · [README](https://github.com/Aayush9029/NativeYoutube#readme) · [Releases](https://github.com/Aayush9029/NativeYoutube/releases)  
**Alternative to:** YouTube website  
**Implementation:** Swift · menu bar app · YouTube Data API  
**Type:** Native/SwiftUI · **Readiness:** Alpha / active  
**GitHub snapshot:** 535 stars · last pushed **2026-09-19** · license signal: **MIT**

**What it does:** Small menu bar YouTube client for quick playback, browsing/search and user-provided playlists.

**Why it matters:** A narrower but practical answer to browser overload: access YouTube without opening another full browser tab.

**Tradeoffs / things to verify:** The README requires **macOS 14+ and your own YouTube Data API key**. It is a menu bar utility, not a full replacement for YouTube.com.

### 23. YouTube X

**Repository:** [fizzygx/Youtube-X](https://github.com/fizzygx/Youtube-X) · [README](https://github.com/fizzygx/Youtube-X#readme) · [Releases](https://github.com/fizzygx/Youtube-X/releases)  
**Alternative to:** YouTube website  
**Implementation:** SwiftUI · WKWebView · yt-dlp/ffmpeg  
**Type:** Thin webview · **Readiness:** Young / active  
**GitHub snapshot:** 56 stars · last pushed **2026-08-20** · license signal: **Unspecified in API**

**What it does:** Native-style Mac YouTube application with download/offline features, SponsorBlock and media player workflows.

**Why it matters:** Good example of a small native shell plus system webview and local media tools, potentially avoiding Electron packaging.

**Tradeoffs / things to verify:** **Not a pure native video/UI rewrite**: it uses WKWebView. Check platform media policies, extraction reliability and distribution; some capabilities depend on yt-dlp/ffmpeg.

### 24. HyperTube Music

**Repository:** [hyper-tube/app](https://github.com/hyper-tube/app) · [README](https://github.com/hyper-tube/app#readme) · [Releases](https://github.com/hyper-tube/app/releases)  
**Alternative to:** YouTube Music website  
**Implementation:** C++20 · Qt Quick  
**Type:** Native/Qt · **Readiness:** Very early / active  
**GitHub snapshot:** 10 stars · last pushed **2026-10-09** · license signal: **GPL-3.0**

**What it does:** Ambitious native desktop YouTube Music client that lists search, library, playlist editing, podcasts, downloads, offline mode and advanced playback features.

**Why it matters:** Its C++/Qt Quick stack is explicitly designed without Electron or a bundled browser runtime; cross-platform targets include macOS.

**Tradeoffs / things to verify:** **Treat the extensive README feature list as claims, not independently verified capabilities.** Only a small number of stars and a recent start date; test auth/DRM and builds directly.

### 25. Riff

**Repository:** [thisizmvk/Riff](https://github.com/thisizmvk/Riff) · [README](https://github.com/thisizmvk/Riff#readme) · [Releases](https://github.com/thisizmvk/Riff/releases)  
**Alternative to:** YouTube Music website  
**Implementation:** SwiftUI · InnerTube · hidden WKWebView for audio  
**Type:** Hybrid/native shell · **Readiness:** Prototype / early  
**GitHub snapshot:** 2 stars · last pushed **2026-06-20** · license signal: **AGPL-3.0**

**What it does:** Experimental YouTube Music client with native SwiftUI browse/search/player UI and a hidden WebKit component dedicated to audio.

**Why it matters:** An architecturally interesting division: render the application in native code but delegate protected playback to the engine capable of it.

**Tradeoffs / things to verify:** The roadmap includes explicitly future features; do **not** interpret them as shipped. Minimal GitHub adoption, and backend/API changes may break it.

### 26. Kumone

**Repository:** [missuo/kumone](https://github.com/missuo/kumone) · [README](https://github.com/missuo/kumone#readme) · [Releases](https://github.com/missuo/kumone/releases)  
**Alternative to:** NetEase Cloud Music desktop  
**Implementation:** Swift · SwiftUI · native service API  
**Type:** Native/SwiftUI · **Readiness:** Growing / active  
**GitHub snapshot:** 1,128 stars · last pushed **2026-10-08** · license signal: **LGPL-3.0**

**What it does:** Mac-native third-party client for NetEase Cloud Music with QR login, library browsing, recommendations, lyrics and account-specific views.

**Why it matters:** A compelling regional example of building a first-class Mac interface over the actual music service instead of using a webview.

**Tradeoffs / things to verify:** Depends on an unofficial integration with NetEase APIs. macOS 15+ is documented; account region and music licensing can affect playback.

### 27. MeloX

**Repository:** [youshen2/MeloX](https://github.com/youshen2/MeloX) · [README](https://github.com/youshen2/MeloX#readme) · [Releases](https://github.com/youshen2/MeloX/releases)  
**Alternative to:** NetEase Cloud Music desktop  
**Implementation:** Swift · SwiftUI  
**Type:** Native/SwiftUI · **Readiness:** Developing / active  
**GitHub snapshot:** 326 stars · last pushed **2026-09-05** · license signal: **GPL-3.0**

**What it does:** Alternative NetEase Cloud Music app with wide-screen Mac navigation, playback queues, synced lyrics and iOS/Mac features.

**Why it matters:** An interesting comparison to Kumone: similar backend, different approach to UI polish and cross-platform Apple code sharing.

**Tradeoffs / things to verify:** README warns that service changes can break integration, and some Apple Watch features remain in development. Unofficial-client terms and music rights remain relevant.

### 28. Moonfin

**Repository:** [Moonfin-Client/Moonfin-Core](https://github.com/Moonfin-Client/Moonfin-Core) · [README](https://github.com/Moonfin-Client/Moonfin-Core#readme) · [Releases](https://github.com/Moonfin-Client/Moonfin-Core/releases)  
**Alternative to:** Jellyfin / Emby clients  
**Implementation:** Dart · Flutter  
**Type:** Cross-platform Flutter · **Readiness:** Active / growing  
**GitHub snapshot:** 815 stars · last pushed **2026-10-10** · license signal: **GPL-2.0**

**What it does:** Cross-platform media client for Jellyfin/Emby servers with unified desktop, mobile, TV and web codebase.

**Why it matters:** Illustrates how to provide a polished independent frontend for an existing self-hosted media service across many devices.

**Tradeoffs / things to verify:** **Flutter, not native AppKit/SwiftUI**, so it is an adjacent lightweight-client candidate, not a direct instance of the native rewrite trend.

### 29. Amperfy

**Repository:** [BLeeEZ/amperfy](https://github.com/BLeeEZ/amperfy) · [README](https://github.com/BLeeEZ/amperfy#readme) · [Releases](https://github.com/BLeeEZ/amperfy/releases)  
**Alternative to:** Ampache / Subsonic web media libraries  
**Implementation:** Swift · Apple media APIs  
**Type:** Native/Swift · **Readiness:** Established / active  
**GitHub snapshot:** 1,793 stars · last pushed **2026-08-13** · license signal: **GPL-3.0**

**What it does:** Apple-platform streaming music client with accounts, offline mode, gapless playback, podcasts, radio and media integrations for self-hosted libraries.

**Why it matters:** Good reference implementation for what a modern native music client can offer with open server protocols.

**Tradeoffs / things to verify:** Requires an **Ampache/Subsonic-compatible server**. It does not stream Spotify or Apple Music accounts directly.

### 30. Jellia

**Repository:** [cjbars/jellia](https://github.com/cjbars/jellia) · [README](https://github.com/cjbars/jellia#readme) · [Releases](https://github.com/cjbars/jellia/releases)  
**Alternative to:** Jellyfin music UI  
**Implementation:** SwiftUI · AVFoundation  
**Type:** Native/SwiftUI · **Readiness:** Very early / active  
**GitHub snapshot:** 4 stars · last pushed **2026-09-10** · license signal: **MIT**

**What it does:** Jellyfin music client with library, search, playlist, audio playback, Now Playing controls and Keychain storage described in the README.

**Why it matters:** A focused native music frontend for an existing media server rather than another generic cross-platform client.

**Tradeoffs / things to verify:** Requires **macOS 26+** and a Jellyfin server. README labels some illustrations as **mockups**, so inspect releases and verify real workflows before relying on them.

### 31. Jellybeam

**Repository:** [packetinspector/jellybeam-macos](https://github.com/packetinspector/jellybeam-macos) · [README](https://github.com/packetinspector/jellybeam-macos#readme) · [Releases](https://github.com/packetinspector/jellybeam-macos/releases)  
**Alternative to:** Jellyfin desktop UI  
**Implementation:** Rust · GPUI · libmpv · SQLite cache  
**Type:** Native/GPU-rendered · **Readiness:** Very early / active  
**GitHub snapshot:** 2 stars · last pushed **2026-10-02** · license signal: **GPL-3.0**

**What it does:** Apple Silicon Jellyfin client with GPU-rendered Rust UI, libmpv playback and a local SQLite index for faster library browsing.

**Why it matters:** One of the more technically distinctive new projects: no WebKit/Chromium/Flutter shell, and client-side architecture tailored to large media libraries.

**Tradeoffs / things to verify:** Requires a Jellyfin server and Apple Silicon; README claims macOS 11+ support. Performance claims need independent testing, and the repository has almost no adoption yet.

## Email and AI workflows

### 32. Postie

**Repository:** [igorkulman/Postie](https://github.com/igorkulman/Postie) · [README](https://github.com/igorkulman/Postie#readme) · [Releases](https://github.com/igorkulman/Postie/releases)  
**Alternative to:** Gmail in browser  
**Implementation:** SwiftUI · Gmail API · SQLite cache  
**Type:** Native/SwiftUI · **Readiness:** New / active  
**GitHub snapshot:** 6 stars · last pushed **2026-10-09** · license signal: **MIT**

**What it does:** Small macOS Gmail client with Google sign-in, multi-account inbox, composition/replies, attachment handling, Gmail search and local message caching.

**Why it matters:** Exactly the kind of focused rewrite at issue: native mail UX rather than a heavyweight cross-service dashboard.

**Tradeoffs / things to verify:** Tiny user base. Review Google OAuth app verification, permissions/scopes and the project status before connecting production mailboxes.

### 33. Brev

**Repository:** [henrikogaard/brev](https://github.com/henrikogaard/brev) · [README](https://github.com/henrikogaard/brev#readme) · [Releases](https://github.com/henrikogaard/brev/releases)  
**Alternative to:** Email desktop clients and webmail  
**Implementation:** Swift · SwiftUI · IMAP/SMTP  
**Type:** Native/SwiftUI · **Readiness:** **Pre-alpha; unreleased**  
**GitHub snapshot:** 3 stars · last pushed **2026-10-10** · license signal: **MIT**

**What it does:** Native Mac/iOS email client pursuing standards-based mail, offline-first behavior, multiaccount support and extensive themes.

**Why it matters:** Interesting goal: a standalone email product with local data and no telemetry rather than yet another webmail shell.

**Tradeoffs / things to verify:** **Not released and not ready for daily use** according to its own README. Real-provider QA and interoperability remain in progress; features described are not a promise of current completion.

### 34. PowerUserMail

**Repository:** [isaaclins/powerusermail](https://github.com/isaaclins/powerusermail) · [README](https://github.com/isaaclins/powerusermail#readme) · [Releases](https://github.com/isaaclins/powerusermail/releases)  
**Alternative to:** Superhuman-style email workflow  
**Implementation:** Swift · SwiftUI · command palette  
**Type:** Native/SwiftUI · **Readiness:** New / experimental  
**GitHub snapshot:** 6 stars · last pushed **2026-10-07** · license signal: **GPL-3.0**

**What it does:** Keyboard-first mail interface with Cmd+K command palette, shortcuts, conversation-centric presentation, and account support described for Gmail, Outlook and IMAP.

**Why it matters:** An open-source attempt to bring low-latency, keyboard-focused premium mail UX into a native app.

**Tradeoffs / things to verify:** Screenshots are created from a **demo mailbox**, not proof that every production mail integration works. Verify real account connectivity and message safety before use.

### 35. Clarc

**Repository:** [ttnear/Clarc](https://github.com/ttnear/Clarc) · [README](https://github.com/ttnear/Clarc#readme) · [Releases](https://github.com/ttnear/Clarc/releases)  
**Alternative to:** Claude Code terminal workflows  
**Implementation:** SwiftUI · subprocess of official Claude CLI  
**Type:** Native/SwiftUI · **Readiness:** Active / niche  
**GitHub snapshot:** 368 stars · last pushed **2026-08-20** · license signal: **README: Apache-2.0 (API unknown)**

**What it does:** Native graphical client for Claude Code with streaming conversation, repository browser, diff-aware permission prompts, projects and Git status.

**Why it matters:** Smart architecture: keeps the existing `claude` binary and agent ecosystem but swaps the operator interface for a Mac-native window.

**Tradeoffs / things to verify:** Not a Claude.ai desktop replacement and not an independent model client. **Claude Code CLI remains a prerequisite**, with its own licensing, login and usage charges.

## Editors, terminals and developer tools

### 36. Zed

**Repository:** [zed-industries/zed](https://github.com/zed-industries/zed) · [README](https://github.com/zed-industries/zed#readme) · [Releases](https://github.com/zed-industries/zed/releases)  
**Alternative to:** VS Code / Atom / Cursor editing workflow  
**Implementation:** Rust · GPU-rendered custom UI  
**Type:** Native/GPU-rendered · **Readiness:** Mature / very popular  
**GitHub snapshot:** 91,539 stars · last pushed **2026-10-10** · license signal: **README: GPL-3.0-or-later + Apache parts**

**What it does:** High-performance desktop code editor with collaborative and modern language tooling.

**Why it matters:** One of the flagship non-Electron editor architectures, built by veterans of Atom and Tree-sitter with a heavy emphasis on responsiveness.

**Tradeoffs / things to verify:** Feature and extension compatibility is not the same as VS Code. Source license is mixed; README describes primarily GPLv3-or-later with marked Apache-2.0 components.

### 37. CodeEdit

**Repository:** [CodeEditApp/CodeEdit](https://github.com/CodeEditApp/CodeEdit) · [README](https://github.com/CodeEditApp/CodeEdit#readme) · [Releases](https://github.com/CodeEditApp/CodeEdit/releases)  
**Alternative to:** VS Code / lightweight IDE  
**Implementation:** Swift · native Apple frameworks  
**Type:** Native/Swift · **Readiness:** Large community / evolving  
**GitHub snapshot:** 23,065 stars · last pushed **2026-08-18** · license signal: **MIT**

**What it does:** Mac-specific code editor with syntax highlighting, project navigation, completions and planned/implemented IDE integrations.

**Why it matters:** Best example on this list of unapologetically Mac-only app design rather than cross-platform portability.

**Tradeoffs / things to verify:** Do not assume parity with the mature VS Code extension ecosystem, debuggers and remote development. Check features against current release builds.

### 38. Lapce

**Repository:** [lapce/lapce](https://github.com/lapce/lapce) · [README](https://github.com/lapce/lapce#readme) · [Releases](https://github.com/lapce/lapce/releases)  
**Alternative to:** VS Code / general code editors  
**Implementation:** Rust · Floem · wgpu  
**Type:** Native/GPU-rendered · **Readiness:** Large community / active  
**GitHub snapshot:** 38,902 stars · last pushed **2026-10-09** · license signal: **Apache-2.0**

**What it does:** Rust editor designed for fast editing with language-server support, modal editing and built-in remote development concepts.

**Why it matters:** Another performance-oriented approach to code editing with its own UI toolkit and GPU renderer.

**Tradeoffs / things to verify:** Different plugin system and UX from VS Code, so evaluate extension coverage and debug/test workflows before switching.

### 39. Ghostty

**Repository:** [ghostty-org/ghostty](https://github.com/ghostty-org/ghostty) · [README](https://github.com/ghostty-org/ghostty#readme) · [Releases](https://github.com/ghostty-org/ghostty/releases)  
**Alternative to:** Hyper/Warp-style terminal apps  
**Implementation:** Zig · native macOS UI · GPU acceleration  
**Type:** Native/GPU-rendered · **Readiness:** Mature / popular  
**GitHub snapshot:** 62,031 stars · last pushed **2026-10-10** · license signal: **MIT**

**What it does:** Native terminal emulator built for high performance, good terminal standards support and platform-integrated windows. Also exposes an embeddable libghostty library.

**Why it matters:** A canonical example of creating a modern desktop app with a low-overhead native interface and reusable core library.

**Tradeoffs / things to verify:** Not a shell, remote coding service or AI agent by itself. Compare your personal terminal workflows (tabs, splits, SSH, keybindings) before changing.

### 40. kitty

**Repository:** [kovidgoyal/kitty](https://github.com/kovidgoyal/kitty) · [README](https://github.com/kovidgoyal/kitty#readme) · [Releases](https://github.com/kovidgoyal/kitty/releases)  
**Alternative to:** Hyper terminal  
**Implementation:** Python/C · GPU acceleration  
**Type:** Native/GPU-rendered · **Readiness:** Mature / popular  
**GitHub snapshot:** 35,222 stars · last pushed **2026-10-10** · license signal: **GPL-3.0**

**What it does:** GPU-accelerated terminal with rich typography and keyboard-driven workflows.

**Why it matters:** Proves that serious terminal features do not require an Electron stack.

**Tradeoffs / things to verify:** Some tooling and settings differ from macOS Terminal/iTerm2; configure shortcuts and remote integrations deliberately.

### 41. Alacritty

**Repository:** [alacritty/alacritty](https://github.com/alacritty/alacritty) · [README](https://github.com/alacritty/alacritty#readme) · [Releases](https://github.com/alacritty/alacritty/releases)  
**Alternative to:** Hyper terminal  
**Implementation:** Rust · OpenGL  
**Type:** Native/GPU-rendered · **Readiness:** Mature / popular  
**GitHub snapshot:** 65,924 stars · last pushed **2026-10-05** · license signal: **Apache-2.0**

**What it does:** Minimalist cross-platform terminal emulator built around GPU-assisted text rendering and configuration.

**Why it matters:** A classic performance-first answer to terminal overhead; delegates many workflow features to companion tools.

**Tradeoffs / things to verify:** README still labels it beta. You may need tmux/zellij or other tools to replace richer terminal app features.

### 42. GitUp

**Repository:** [git-up/GitUp](https://github.com/git-up/GitUp) · [README](https://github.com/git-up/GitUp#readme) · [Releases](https://github.com/git-up/GitUp/releases)  
**Alternative to:** GitKraken / GitHub Desktop  
**Implementation:** Objective-C · native macOS UI  
**Type:** Native/AppKit · **Readiness:** Mature / active  
**GitHub snapshot:** 12,133 stars · last pushed **2026-10-08** · license signal: **GPL-3.0**

**What it does:** Graph-focused Git desktop client that makes repository history, branching and staging more visible.

**Why it matters:** A longstanding example of a fast native Mac developer tool made specifically for local Git.

**Tradeoffs / things to verify:** Not a full substitute for hosted pull request reviews, GitHub issue tracking or collaborative GitHub Desktop features.

### 43. GitButler

**Repository:** [gitbutlerapp/gitbutler](https://github.com/gitbutlerapp/gitbutler) · [README](https://github.com/gitbutlerapp/gitbutler#readme) · [Releases](https://github.com/gitbutlerapp/gitbutler/releases)  
**Alternative to:** GitKraken / GitHub Desktop  
**Implementation:** Rust · Tauri · Svelte  
**Type:** Tauri hybrid · **Readiness:** Mature / active  
**GitHub snapshot:** 21,794 stars · last pushed **2026-10-10** · license signal: **License requires reading repo**

**What it does:** Git-based version control interface oriented around modern branch, change and AI-assisted workflows. Desktop app plus CLI.

**Why it matters:** An important contrast: can be lighter than Electron and offer deeper Git functionality while still using a web frontend.

**Tradeoffs / things to verify:** **Not a wholly native UI rewrite.** Examine the repository license and current paid/cloud offerings; API did not expose a simple single SPDX license.

### 44. Lazygit

**Repository:** [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit) · [README](https://github.com/jesseduffield/lazygit#readme) · [Releases](https://github.com/jesseduffield/lazygit/releases)  
**Alternative to:** GitKraken / GitHub Desktop  
**Implementation:** Go · terminal UI  
**Type:** Terminal client · **Readiness:** Mature / popular  
**GitHub snapshot:** 83,082 stars · last pushed **2026-10-10** · license signal: **MIT**

**What it does:** Extensive interactive Git interface in the terminal: hunks, branches, history, cherry-pick, rebase, conflicts and worktrees.

**Why it matters:** Perhaps the best-known example of a power-user TUI displacing an expensive GUI workflow.

**Tradeoffs / things to verify:** Terminal-first by design; lacks hosted service dashboards and graphical PR features from commercial products.

### 45. GitUI

**Repository:** [gitui-org/gitui](https://github.com/gitui-org/gitui) · [README](https://github.com/gitui-org/gitui#readme) · [Releases](https://github.com/gitui-org/gitui/releases)  
**Alternative to:** GitKraken / GitHub Desktop  
**Implementation:** Rust · terminal UI  
**Type:** Terminal client · **Readiness:** Mature / active  
**GitHub snapshot:** 22,554 stars · last pushed **2026-10-06** · license signal: **MIT**

**What it does:** Fast interactive terminal interface for Git staging, commits, diffs and repository exploration.

**Why it matters:** A compact Rust competitor to desktop Git GUIs and a useful comparison to Go-based Lazygit.

**Tradeoffs / things to verify:** Not a hosted code review solution; feature coverage and keyboard conventions differ from Lazygit.

### 46. Yaak

**Repository:** [mountain-loop/yaak](https://github.com/mountain-loop/yaak) · [README](https://github.com/mountain-loop/yaak#readme) · [Releases](https://github.com/mountain-loop/yaak/releases)  
**Alternative to:** Postman / Insomnia  
**Implementation:** Rust · Tauri · React  
**Type:** Tauri hybrid · **Readiness:** Mature / active  
**GitHub snapshot:** 19,299 stars · last pushed **2026-10-07** · license signal: **MIT**

**What it does:** Desktop API client for REST, GraphQL, WebSocket, SSE and gRPC calls, with project organization and privacy-oriented workflows.

**Why it matters:** A lightweight alternative to heavy API tooling and one of the strongest Tauri desktop products on this list.

**Tradeoffs / things to verify:** **Not a fully native widget tree**: Tauri retains a web-based frontend. The project has optional commercial licensing/services; verify free-tier needs.

### 47. TablePro

**Repository:** [TableProApp/TablePro](https://github.com/TableProApp/TablePro) · [README](https://github.com/TableProApp/TablePro#readme) · [Releases](https://github.com/TableProApp/TablePro/releases)  
**Alternative to:** TablePlus / DBeaver database clients  
**Implementation:** Swift · native desktop frameworks  
**Type:** Native/Swift · **Readiness:** Growing / active  
**GitHub snapshot:** 6,225 stars · last pushed **2026-10-10** · license signal: **AGPL-3.0**

**What it does:** Fast native database client targeting macOS and multiple database engines, with query editing and table/data inspection.

**Why it matters:** A direct attempt to offer TablePlus-like usability with open source licensing and a native interface.

**Tradeoffs / things to verify:** Check the database compatibility list and which features are available free versus paid. Its AGPL licensing matters when modifying/distributing the software.

### 48. Tusk

**Repository:** [alpcanaydin/tusk](https://github.com/alpcanaydin/tusk) · [README](https://github.com/alpcanaydin/tusk#readme) · [Releases](https://github.com/alpcanaydin/tusk/releases)  
**Alternative to:** DBeaver / TablePlus database clients  
**Implementation:** Rust · GPUI · GPU virtualized grids  
**Type:** Native/GPU-rendered · **Readiness:** Young / active  
**GitHub snapshot:** 375 stars · last pushed **2026-10-05** · license signal: **MIT**

**What it does:** Keyboard-driven desktop database client supporting many database families, query editing, large virtualized data grids and an AI assistant.

**Why it matters:** A compelling application of the GPUI rendering stack beyond code editors; repository says no Electron or webview.

**Tradeoffs / things to verify:** The README advertises support for 20 databases; independently validate each connector and edit behavior, particularly before using production databases.

### 49. FSNotes

**Repository:** [glushchenko/fsnotes](https://github.com/glushchenko/fsnotes) · [README](https://github.com/glushchenko/fsnotes#readme) · [Releases](https://github.com/glushchenko/fsnotes/releases)  
**Alternative to:** Electron notes / knowledge apps  
**Implementation:** Swift · native Apple UI · plain Markdown  
**Type:** Native/Swift · **Readiness:** Mature / active  
**GitHub snapshot:** 7,522 stars · last pushed **2026-10-09** · license signal: **MIT**

**What it does:** Local-first notes and writing app that stores notes in portable Markdown/plain text, supports fast search, folders, links and sync through file providers.

**Why it matters:** A mature, Mac-oriented alternative to a heavy note-taking workspace when the priority is owning files and writing quickly.

**Tradeoffs / things to verify:** Not feature-equivalent to Notion: no database/block collaboration model. Store/distribution and pricing may differ between GitHub source and App Store builds.

### 50. NetNewsWire

**Repository:** [Ranchero-Software/NetNewsWire](https://github.com/Ranchero-Software/NetNewsWire) · [README](https://github.com/Ranchero-Software/NetNewsWire#readme) · [Releases](https://github.com/Ranchero-Software/NetNewsWire/releases)  
**Alternative to:** Feedly/browser RSS reader  
**Implementation:** Swift · native Apple UI  
**Type:** Native/Swift · **Readiness:** Mature / active  
**GitHub snapshot:** 10,459 stars · last pushed **2026-10-10** · license signal: **MIT**

**What it does:** Open-source RSS/Atom/JSON Feed reader for macOS and iOS with a dedicated, focused native reading experience.

**Why it matters:** Shows how a straightforward native app can displace a high-overhead browser-based information-consumption habit.

**Tradeoffs / things to verify:** RSS is not a substitute for every feature of a commercial feed intelligence service; source feeds and sync account requirements vary.

---

## Selection guide: what to install or examine first

| Your goal | Best starting point | Why / warning |
|---|---|---|
| Keep Spotify account and reduce desktop overhead | **Spotifast** | Rust/egui; streaming needs Spotify Premium; author-reported resource gains. |
| Keep WhatsApp but avoid its browser-based desktop footprint | **ZapFast** | Direct Rust companion-device client; verify service compatibility and feature gaps. |
| Replace Slack Electron completely | **Make Slack Great Again** | Pure C++/custom renderer; check workspace-specific authentication, macOS support and notarization. |
| Replace Discord's desktop UI on Apple Silicon | **Swiftcord** | Native SwiftUI; current release targets macOS 26+. |
| Track a newer experimental Discord UI | **SakuraCord** | SwiftUI, but current README's macOS 27 target is a major constraint. |
| Use YouTube Music in a native-feeling Mac app | **Kaset** | More established than small prototypes; playback may still use web/DRM machinery. |
| Browse YouTube with a native multi-device client | **SmartTube** or **Yattee** | Different account/backends and Mac distribution; validate your use case. |
| Replace full browser Gmail workflow | **Postie** | Small focused native client; early project and OAuth permissions require scrutiny. |
| Replace Electron-style terminals | **Ghostty** | Highly established, platform-integrated, GPU accelerated. |
| Replace VS Code/Atom style Electron editors | **Zed** or **CodeEdit** | Zed is the cross-platform performance leader; CodeEdit is Mac-only/native. |
| Replace an oversized database GUI | **TablePro** or **Tusk** | Swift native vs Rust/GPUI; verify DB drivers and safety. |
| Replace Postman / Insomnia | **Yaak** | Tauri, not a completely native widget UI. |
| Replace GitKraken on a Mac | **GitUp** or **Lazygit** | Native AppKit-like GUI vs terminal UI. |
| Keep text notes portable rather than in a block database | **FSNotes** | Markdown files, local-first; not a full Notion clone. |

### A practical evaluation checklist

For each candidate you seriously consider installing, verify the following:

- [ ] **Works on your macOS version and architecture** (Apple Silicon vs Intel; macOS 14/15/26/27 restrictions).
- [ ] **Has a trustworthy downloadable build**, recent tagged release, or reproducible build instructions; repo `pushed_at` alone is insufficient.
- [ ] **Authenticates safely** without requesting a raw account token in an unsafe place; review official OAuth and/or device-pairing models.
- [ ] **Retains the features you rely on**: voice calls, screen sharing, notifications, file upload, offline playback, drag-and-drop, multiple accounts, keyboard controls.
- [ ] **Actually saves resources**, measured on your Mac with comparable workload. Record cold start, idle RAM, active RAM, CPU, energy impact, and disk size.
- [ ] **Handles credentials and local state safely**: Keychain usage, local caches, encryption, auto-updates, signing/notarization.
- [ ] **Respects service rules and compatibility expectations**, particularly Spotify, Discord, WhatsApp and DRM-protected video/music.
- [ ] **Has a clear license**. Some public/source-available repositories do not expose a straightforward SPDX license.

### Suggested benchmark method

Use identical accounts, similar library sizes and comparable open views. Launch each app fresh, wait for initial sync, then measure cold-launch time, idle RAM, CPU at rest and resource use under an active workload. On macOS, Activity Monitor's **Memory**, **CPU** and **Energy** views are good starting points; `ps` and `time` can provide repeatable command-line snapshots. Run trials more than once. Avoid comparing an app that has a full offline cache with one doing its initial sync.

### Limitations of this directory

This list deliberately mixes **35 service clients** with **15 app/workflow alternatives**, matching the original conversation's 50 projects. Not every project is mature, wholly native, or a feature-complete drop-in replacement. Some (Brev, Riff, Jellia, Jellybeam) are very early; others (Ghostty, Zed, Lazygit) are mature and widely used. There were **no independent end-to-end macOS performance, security or stability tests** conducted for this document. Performance descriptions are labeled as maintainer claims where applicable.

**Source:** linked GitHub repository metadata and README pages, reviewed October 10, 2026.  
**Catalog preparation:** summarized and categorized for research, not affiliated with the repository maintainers.
