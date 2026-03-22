SwiftUI-Modular-Navigation

A demo project accompanying my [blog post](https://lukejones1.github.io/posts/swiftui-navigation-modular-routers/) on SwiftUI navigation in a modular app. 


## Architecture

**Vertical feature-based modularisation** — each feature is a separate Swift package with its own destinations, views, and view models. No feature module imports another.

### Modules

| Package | Role |
|---------|------|
| `Navigation` | Generic `Router`, `AppDestination`, `DeepLinkParser` |
| `Home` | Tab — list → detail push, item actions sheet |
| `Profile` | Tab — static screen, edit sheet, history push |
| `Account` | Tab — security settings push, logout confirmation sheet |
| `Onboarding` | Separate flow — experiment-based branching (videoFirst, signUpFirst, minimal) |
| `UserSettings` | Modal sheet presented from any tab |

### Key Concepts

- **Router per module** — each feature owns a `Router<PushDestination, SheetDestination>` typed to its own destinations
- **AppCoordinator** — the only app-level coordinator, handles cross-module orchestration (logout, deep links, onboarding gate)
- **OnboardingCoordinator** — demonstrates when a module earns its own coordinator (experiment-based branching flow)
- **Composition root** — the app target wires `@ViewBuilder` closures so modules can navigate without importing each other
- **No AnyView** — flow views use generics with `@ViewBuilder` factories for type-safe view construction
- **Deep linking** — URL → `AppDestination` → AppCoordinator dispatches to the correct tab/router

### Deep Link Scheme

`swiftuimodularnavigation://`

| URL | Behaviour |
|-----|-----------|
| `swiftuimodularnavigation:///home` | Switch to Home tab |
| `swiftuimodularnavigation:///home/item/{UUID}` | Switch to Home tab, push detail |
| `swiftuimodularnavigation:///profile` | Switch to Profile tab |
| `swiftuimodularnavigation:///account` | Switch to Account tab |
| `swiftuimodularnavigation:///settings` | Present Settings sheet |

### Testing

- `NavigationTests` — Router state tests, DeepLinkParser tests
- `CoordinatorDemoTests` — AppCoordinator orchestration tests (logout resets all routers, deep links dispatch correctly)
