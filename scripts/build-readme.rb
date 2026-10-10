#!/usr/bin/env ruby
# Builds README.md from data/clients.json and data/baselines.json.
#
#   ruby scripts/build-readme.rb          # write README.md
#   ruby scripts/build-readme.rb --merge  # first merge data/raw/group-*.json into data/clients.json

require "json"

ROOT = File.expand_path("..", __dir__)
CLIENTS_PATH = File.join(ROOT, "data/clients.json")
BASELINES_PATH = File.join(ROOT, "data/baselines.json")

if ARGV.include?("--merge")
  merged = Dir[File.join(ROOT, "data/raw/group-*.json")].flat_map { |f| JSON.parse(File.read(f)) }.sort_by { _1["id"] }
  File.write(CLIENTS_PATH, JSON.pretty_generate(merged) + "\n")
  warn "Merged #{merged.size} clients into data/clients.json"
end

clients = JSON.parse(File.read(CLIENTS_PATH)).select { _1["repo_exists"] }
baselines = File.exist?(BASELINES_PATH) ? JSON.parse(File.read(BASELINES_PATH)) : {}

CATEGORIES = {
  "messaging" => ["Messaging, Social and Communities", "Chat apps are the worst offenders: a full Chromium per workspace, open all day. These talk to the same service with a fraction of the weight."],
  "media"     => ["Music, Video and Streaming", "Your music player should not need more memory than the game you are playing while it runs."],
  "email-ai"  => ["Email and AI Workflows", "Native mail and agent front ends for people who live in their inbox or their terminal."],
  "devtools"  => ["Editors, Terminals and Developer Tools", "Not always a client for the same service, but a faster replacement for the same job."]
}

TIERS = {
  "native"   => ["🟢", "Native", "Native UI and no bundled browser. AppKit/SwiftUI, Qt, or a GPU-rendered toolkit talking to the service directly."],
  "hybrid"   => ["🟡", "Hybrid", "Native or Rust shell, but some UI or playback still runs in the system WebView. No bundled Chromium."],
  "xplat"    => ["🔵", "Cross-platform", "Flutter or similar. Lighter than Electron, not Mac-native."],
  "terminal" => ["⌨️", "Terminal", "TUI. Runs in your terminal, near-zero overhead."]
}

def tier(type)
  case type
  when /\Anative/ then "native"
  when "hybrid-webview", "tauri" then "hybrid"
  when "flutter" then "xplat"
  when "tui" then "terminal"
  else "native"
  end
end

TYPE_LABELS = {
  "native-protocol" => "Native rewrite", "native-swiftui" => "SwiftUI", "native-appkit" => "AppKit",
  "native-qt" => "Qt", "native-gpu" => "GPU-rendered", "hybrid-webview" => "Native shell + WebView",
  "tauri" => "Tauri", "flutter" => "Flutter", "tui" => "Terminal UI"
}

def anchor(text)
  text.downcase.gsub(/[^\p{Word}\- ]/, "").strip.tr(" ", "-")
end

def badges(c)
  repo = c["repo"]
  [
    "![stars](https://img.shields.io/github/stars/#{repo}?style=flat-square&label=%E2%98%85&color=444)",
    "![last commit](https://img.shields.io/github/last-commit/#{repo}?style=flat-square&label=updated&color=444)",
    ("![license](https://img.shields.io/badge/license-#{c['license'].gsub('-', '--')}-444?style=flat-square)" if c["license"])
  ].compact.join(" ")
end

def macos_req(c)
  parts = []
  parts << "macOS #{c['macos_min']}+" if c["macos_min"]
  parts << "Apple Silicon only" if c["apple_silicon_only"]
  parts.empty? ? "Not stated" : parts.join(", ")
end

def claim_cell(claims, metrics)
  hits = claims.select { |cl| metrics.include?(cl["metric"]) }
  return "Not published" if hits.empty?
  hits.map do |cl|
    platform = cl["platform"] && !cl["platform"].to_s.match?(/macos/i) ? " (#{cl['platform']})" : ""
    "[#{cl['value']}](#{cl['source']})#{platform}"
  end.join("<br>")
end

def short_framework(b)
  return "Website" unless b
  b["framework"].split(/[;(,]/).first.strip.sub("Web app in browser tab", "Browser tab")
end

def metric_label(metric)
  metric.tr("_", " ").capitalize.gsub(/\b(ram|cpu|fps)\b/i) { _1.upcase }
end

def baseline_ram(b)
  return "Not published" unless b && b["reported_ram"]&.any?
  r = b["reported_ram"].first
  "[#{r['value']}](#{r['source']})" + (r["context"] ? "<br><sub>#{r['context']}#{r['date'] ? ", #{r['date']}" : ''}</sub>" : "")
end

def baseline_size(b)
  s = b && b["install_size"]
  s ? "[#{s['value']}](#{s['source']})" : "Not published"
end

MEMORY_METRICS = %w[idle_ram ram memory active_ram playback_ram peak_ram]
SIZE_METRICS = %w[app_size binary_size download_size install_size bundle_size]


out = []
total = clients.size
by_cat = clients.group_by { _1["category"] }

out << <<~MD
  <div align="center">

  # Awesome Native Clients

  **Faster, lighter clients for the apps you love, and the ones you're stuck with.**

  Your chat app ships a whole web browser. So does your music player, your API client, and your editor.
  This is a list of #{total} open source projects that rebuilt them as real desktop apps: native UI, a fraction of the memory, and launch times you don't notice.

  [![Awesome](https://awesome.re/badge-flat2.svg)](https://awesome.re)
  ![clients](https://img.shields.io/badge/clients-#{total}-2ea44f?style=flat-square)
  ![platform](https://img.shields.io/badge/focus-macOS-555?style=flat-square)
  [![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](CONTRIBUTING.md)

  </div>

  ---

  ## Contents

  - [Why this exists](#why-this-exists)
  - [Before and after: the receipts](#before-and-after-the-receipts)
  - [Pick a replacement](#pick-a-replacement)
  - [How to read this list](#how-to-read-this-list)
  #{CATEGORIES.map { |k, (title, _)| "- [#{title}](##{anchor(title)}) (#{by_cat[k]&.size || 0})" }.join("\n")}
  - [Before you switch](#before-you-switch)
  - [Contributing](#contributing)

  ## Why this exists

  Electron made it cheap to ship one codebase everywhere. You pay for that with every app that bundles its own copy of Chromium and Node, keeps a renderer process per window, and feels like a web page wearing a desktop costume.

  A wave of developers is now going the other way: talking to the same services through their own protocols and APIs, and drawing the UI with AppKit, SwiftUI, Qt, or a GPU renderer. The result is the same account and the same data in an app that opens instantly and idles in tens of megabytes instead of gigabytes.

  This list collects them, with a screenshot of each and the numbers the projects themselves publish next to the numbers for the official app.
MD

# Receipts: every client with a published, numeric resource/speed claim
# Design targets and goals are shown on each entry, but only measured numbers count as receipts.
def numeric?(claim) = claim["value"].to_s.match?(/\d/) && !claim["value"].to_s.match?(/qualitative|no number|target|budget/i)

receipts = clients.select { |c| c["compare"] != false && c["claims"]&.any? { numeric?(_1) } }
out << "## Before and after: the receipts\n"
out << "Every number below was published by the project itself or by a credible public source, and links to it. Nothing here was measured by this list. Results vary with account size, open views and platform.\n"
out << "| Stuck with | Before | Switch to | After |"
out << "|---|---|---|---|"
receipts.each do |c|
  b = baselines[c["replaces_key"]]
  official = b ? "**#{b['name']}**<br><sub>#{short_framework(b)}</sub>" : "**#{c['replaces']}**"
  after = c["claims"].select { numeric?(_1) }.map do |cl|
    platform = cl["platform"].to_s.match?(/\A(macos|all|n\/a|)\z/i) ? "" : " <sub>(#{cl['platform']})</sub>"
    "#{metric_label(cl['metric'])}: [**#{cl['value']}**](#{cl['source']})#{platform}"
  end.join("<br>")
  out << "| #{official} | #{b ? baseline_ram(b) : 'Not published'} | #{TIERS[tier(c['type'])][0]} [**#{c['name']}**](##{anchor(c['name'])})<br><sub>#{c['stack']}</sub> | #{after} |"
end
out << ""

# Pick a replacement: grouped by official app
out << "## Pick a replacement\n"
out << "| Stuck with… | It's built on | Native-ish alternatives |"
out << "|---|---|---|"
clients.group_by { _1["replaces_key"] }.sort_by { |k, cs| [-cs.size, k] }.each do |key, cs|
  b = baselines[key]
  name = b ? b["name"] : cs.first["replaces"]
  framework = short_framework(b)
  alts = cs.map { |c| "#{TIERS[tier(c['type'])][0]} [#{c['name']}](##{anchor(c['name'])})" }.join(" · ")
  out << "| **#{name}** | #{framework} | #{alts} |"
end
out << ""

out << "## How to read this list\n"
out << "| Tag | Meaning |"
out << "|---|---|"
TIERS.each_value { |emoji, label, desc| out << "| #{emoji} **#{label}** | #{desc} |" }
out << ""
out << "Each entry has a screenshot from the project's own repo or site, a before/after table against the official app, and the tradeoffs. **Not published** means nobody has put a credible number out yet: a great first contribution.\n"

CATEGORIES.each do |cat, (title, blurb)|
  list = by_cat[cat] or next
  out << "---\n"
  out << "## #{title}\n"
  out << "#{blurb}\n"

  list.each do |c|
    emoji, tier_label, _ = TIERS[tier(c["type"])]
    b = baselines[c["replaces_key"]]
    official = b ? b["name"] : c["replaces"]

    out << "### #{c['name']}\n"
    out << "#{emoji} **#{tier_label}** · #{TYPE_LABELS[c['type']] || c['type']} · replaces **#{official}** · [`#{c['repo']}`](https://github.com/#{c['repo']})\n"
    out << badges(c) + "\n"
    out << "#{c['one_liner']}\n"

    if (s = c["screenshot"])
      out << "<p><a href=\"https://github.com/#{c['repo']}\"><img src=\"#{s['file']}\" alt=\"#{s['alt'].gsub('"', '&quot;')}\" width=\"720\"></a></p>\n"
    end

    out << "| | Before: #{official} | After: #{c['name']} |"
    out << "|---|---|---|"
    out << "| **Built with** | #{short_framework(b)} | #{c['stack']} |"
    out << "| **Download** | #{baseline_size(b)} | #{claim_cell(c['claims'], SIZE_METRICS)} |"
    out << "| **Memory** | #{baseline_ram(b)} | #{claim_cell(c['claims'], MEMORY_METRICS)} |"
    other = c["claims"].reject { (MEMORY_METRICS + SIZE_METRICS).include?(_1["metric"]) }
    other.each do |cl|
      platform = cl["platform"].to_s.match?(/\A(macos|all|n\/a|)\z/i) ? "" : " (#{cl['platform']})"
      out << "| **#{metric_label(cl['metric'])}** | n/a | [#{cl['value']}](#{cl['source']})#{platform} |"
    end
    out << "| **Runs on** | Any Mac | #{macos_req(c)} |"
    out << ""

    out << "**Why switch:** #{c['ux_wins'].join(' · ')}  " if c["ux_wins"]&.any?
    out << "**Watch out:** #{c['caveats'].join(' · ')}  " if c["caveats"]&.any?
    status = [c["readiness"], (c["latest_release"] && "latest release `#{c['latest_release']['tag']}` (#{c['latest_release']['date']})")].compact.join(", ")
    out << "**Status:** #{status}\n"
  end
end

out << <<~MD
  ---

  ## Before you switch

  Most of these are unofficial clients. That is the point, and also the risk.

  - **Accounts can break or get flagged.** Discord, WhatsApp and Spotify do not bless third-party clients. Protocol changes can break them overnight, and user-token logins can violate terms of service.
  - **Feature gaps are real.** Calls, screen sharing, huddles and DRM playback are the usual missing pieces. Check the ones you rely on.
  - **Check the build.** Look for a tagged release and a signed, notarized app. A recent commit is not a release.
  - **Open source is not audited.** Some projects say so directly (Nheko's encryption, for one). Read their security notes before trusting them with sensitive chats or mailboxes.
  - **Measure on your own Mac.** Activity Monitor's Memory and Energy tabs after a fresh launch and initial sync, same account, same views. Then send us the numbers.

  ## Contributing

  The README is generated. Edit `data/clients.json` (schema in [`data/SCHEMA.md`](data/SCHEMA.md)) or `data/baselines.json`, drop a screenshot from the project's repo into `assets/screenshots/`, then run:

  ```sh
  ruby scripts/build-readme.rb
  ```

  Rules of the list:

  1. It must be a real alternative to an app or site people already use, with a public repo.
  2. Screenshots come from the project's own repo or website.
  3. Every number links to where it was published. No source, no number.

  See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

  ## License

  [![CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/)

  The list text and data are CC0. Screenshots belong to their respective projects and are used to illustrate them.

  <sub>Data snapshot: #{Time.now.strftime('%B %-d, %Y')}. Star counts and update dates in badges are live.</sub>
MD

File.write(File.join(ROOT, "README.md"), out.join("\n") + "\n")
warn "Wrote README.md (#{total} clients, #{receipts.size} with published numbers)"
