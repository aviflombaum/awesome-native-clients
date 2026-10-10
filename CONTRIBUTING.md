# Contributing

Thanks for helping make desktop software lighter.

## Add a client

1. Add an entry to `data/clients.json`. The fields are documented in [`data/SCHEMA.md`](data/SCHEMA.md).
2. Save a screenshot from the project's own repo or website to `assets/screenshots/<slug>.png` or `.jpg`. Keep it 1600px wide or less and under 600 KB. Record where it came from in `screenshot.source_url`.
3. If the project publishes performance numbers (memory, startup, download size), add them to `claims` with a link and a short quote. Never estimate.
4. Run `ruby scripts/build-readme.rb` and commit both the data and the regenerated `README.md`.

## Add or fix a baseline

The "before" column comes from `data/baselines.json`, keyed by the official app. Every number needs a public source and a date. Official engineering blogs, issue trackers and reputable reviews beat forum anecdotes.

## What belongs here

- An open source alternative to an app or site people already use.
- Lighter than the official app: native UI, a system WebView instead of bundled Chromium, or a terminal UI.
- A public repo with real activity. Concepts and empty repos can wait.

## What does not

- Themes, mods or patches for the official app.
- Closed source apps (they may get their own section later).
- Numbers without a source.
