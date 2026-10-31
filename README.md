# Ismaili 101 — SwiftUI app

An educational iOS app (iOS 16+, SwiftUI, MVVM) with five tabs: Learn, Imams, Impact, Jeopardy and Explore.

## Run it

**Option A — XcodeGen (one command)**
```bash
brew install xcodegen
cd Ismaili101
xcodegen generate
open Ismaili101.xcodeproj
```

**Option B — plain Xcode**
1. Xcode → New Project → iOS App, name it `Ismaili101`, Interface: SwiftUI, minimum iOS 16.
2. Delete the generated `ContentView.swift` and `Ismaili101App.swift`.
3. Drag the `Ismaili101/` folder from this zip into the project ("Create groups", add to target).
4. Run on a simulator or device.

## Structure

```
Ismaili101/
├── App/          Ismaili101App.swift (entry + TabView), Theme.swift (colours, haptics, card style)
├── Models/       Models.swift — Codable structs for every content type
├── Data/         Chapters (1–10), PhilosophyChapters (11–14), ChapterLessons, QuizBank1–3 (25 Qs/chapter),
│                 DailyData (28-day path), Imams, Impact, Jeopardy, TrueFalse, Q&A
├── ViewModels/   ProgressStore (UserDefaults persistence) + one view model per tab
└── Views/
    ├── Learn/    Today card + 28-day Daily Path, 14 chapters, "Go deeper" lessons, flip cards, 5-question rounds with mastery
    ├── Imams/    Era filters, timeline cards with cool fact, empire/state, residence, "Meanwhile in the world"
    ├── Impact/   Animated metric counters, agency cards with detail sheets
    ├── Games/    Play hub: Match Up, True or False Blitz (60s), Imam Timeline
    ├── Jeopardy/ 5×5 board, streak multiplier (x1.5 at 2, x2 at 4), haptics, explanations
    └── Explore/  Searchable accordion Q&A with suggestion chips
```

Content lives in `Data/*.swift` as plain Swift arrays. All models are `Codable`, so you can move any dataset to a bundled JSON file or a server later without changing the views.

## Content notes — please read before publishing

Some details in the original brief were outdated or inaccurate and were corrected:

- **Present Imam:** Aga Khan IV passed away on 4 Feb 2025. The 50th and present Imam is **Prince Rahim Aga Khan V**. The app reflects this.
- **"Imam Nizar al-Mustansir billah (36th)"** mixed up two people. The app lists **Imam Nizar (19th)** and **Imam Mustansir bi'llah II (32nd, Anjudan revival)** separately.
- **Aga Khan IV and the Olympic Order:** he did ski for Iran at the 1964 Winter Olympics, but I couldn't confirm an Olympic Order award, so that claim was dropped.
- **Aga Khan III:** he presided over the League of Nations *Assembly* in 1937.
- **Impact metrics:** the brief's "2M+ students / 10M+ patients / 100+ sites" weren't sourced. The app uses published figures instead (30+ countries, ~96,000 employees, 1,000+ programmes from the AKDN site; 2.2M annual patients from AKU). Each tile shows its source; update `ImpactData.swift` as figures change.

The theological and ethical answers (especially the philosophy chapters, neurodivergence and evolution) are written in general, introductory terms and **do not speak for the Imamat**. Have all content reviewed by community educators (e.g. your local ITREB) before release.

## Sources and review

Every chapter and section ends with a tappable **Sources** list, and **Learn → ⓘ → About & Sources** collects them all with a note that the app is independent and not an official publication. Data lives in `Data/Sources.swift`.

## Simulator screenshots

`.github/workflows/screenshots.yml` builds the app for an iPhone simulator, opens each screen with the `-screen <name>` launch argument, captures light and dark screenshots, and pushes them to the `screenshots` branch.

## Ideas for next steps
- Move datasets to JSON in the bundle, or load from a CMS.
- Add an "AI Q&A" backend to Explore (the search is currently local keyword matching).
- Add a MapKit view of AKDN countries to the Impact tab.
- App icon and accent colour in an asset catalog.
