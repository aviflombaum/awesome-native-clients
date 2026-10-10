# Data schema

`data/clients.json` is the source of truth for the README. Each entry:

```jsonc
{
  "id": 1,
  "slug": "zapfast",                       // lowercase, used for screenshot filenames
  "name": "ZapFast",
  "repo": "crmne/zapfast",                 // owner/name on GitHub (verified to exist)
  "repo_exists": true,
  "category": "messaging",                 // messaging | media | email-ai | devtools
  "replaces": "WhatsApp Desktop",          // human label for the official app/site
  "replaces_key": "whatsapp",              // joins to data/baselines.json
  "stack": "Rust · egui · whatsapp-rust",
  "type": "native-protocol",               // native-protocol | native-swiftui | native-appkit | native-qt | native-gpu | hybrid-webview | tauri | flutter | tui
  "readiness": "Actively developed",
  "stars": 1753,
  "last_push": "2026-10-10",
  "license": "MIT",
  "latest_release": { "tag": "v0.4.0", "date": "2026-10-01" },   // or null
  "macos_min": "14",                       // string or null if unknown
  "apple_silicon_only": false,             // or null if unknown
  "screenshot": {
    "file": "assets/screenshots/zapfast.png",
    "source_url": "https://...",           // where it was downloaded from
    "alt": "ZapFast chat list and conversation view"
  },                                       // or null if none found
  "claims": [                              // performance numbers stated by the project (never invented)
    { "metric": "idle_ram", "value": "~200 MB", "platform": "Linux", "source": "https://github.com/crmne/zapfast#readme", "quote": "short verbatim quote" }
  ],
  "ux_wins": ["Subsecond launch", "Native keyboard shortcuts"],   // 1-3 short phrases, from README
  "caveats": ["Unofficial protocol, can break"],                  // 1-3 short phrases
  "compare": false,                        // optional: leave out of the before/after receipts (e.g. a front end that still runs the official tool)
  "one_liner": "Rust WhatsApp client that pairs as a companion device instead of wrapping WhatsApp Web."
}
```

`data/baselines.json` holds the "before" side: the official app each client replaces, its framework, and measured or reported resource numbers with sources.
