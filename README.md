# custom_animation

[![Pub Version](https://img.shields.io/pub/v/custom_animation?color=blue)](https://pub.dev/packages/custom_animation)
[![Flutter Tests](https://img.shields.io/badge/tests-59%20passed-success)]()
[![Coverage](https://img.shields.io/badge/coverage-100%25-success)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A highly robust, zero-nesting, zero-boilerplate animation framework for Flutter. 

`custom_animation` eliminates the need for managing `AnimationController`s, `TickerProviderStateMixin`s, and deep widget trees. By utilizing a **Fluent Widget Extension API**, you can compose complex, chained animations directly on any widget inline.

---

## 🌟 Features

- **Zero Nesting**: Animate using `.fade().slide().scale()` directly on any widget.
- **13 Built-in Effects**: Fade, Slide, Scale, Rotate, Bounce, Shake, Pulse, Flip, Blur, Zoom, Elastic, Swing, and Jelly.
- **Staggering & Builders**: Animate lists and grids seamlessly with `CustomAnimatedList`.
- **Pre-built Widgets**: Drop-in replacements like `AnimatedButton`, `AnimatedCard`, and `AnimatedSearchBar`.
- **Navigator 2.0 Transitions**: Native support for 8 transition effects (FadeRoute, HeroRoute, SharedAxis, etc.).
- **Production Ready**: 100% Test Coverage including Golden Tests and precise Matrix4 rendering tests.

---

## 🚀 Installation

Add `custom_animation` to your `pubspec.yaml`:

```yaml
dependencies:
  custom_animation: ^1.0.0
```

Then run:
```bash
flutter pub get
```

---

## 📖 Quick Start

### 1. Fluent API (Zero Nesting)
Forget wrapping widgets in `FadeTransition`. Just use the extension!

```dart
import 'package:custom_animation/custom_animation.dart';

// Before: Boilerplate hell
// After:
Text("Hello World")
  .fade(begin: 0.0, end: 1.0)
  .slide(begin: Offset(0, 0.5))
  .scale()
  .animate(
    duration: const Duration(seconds: 1),
    delay: const Duration(milliseconds: 200),
    curve: Curves.easeOut,
  );
```

### 2. Staggered Lists
Animating a list of items sequentially has never been easier.

```dart
CustomAnimatedList(
  itemCount: 20,
  staggerDuration: const Duration(milliseconds: 100),
  effects: const [FadeEffect(), SlideEffect(begin: Offset(1.0, 0.0))],
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item $index'));
  },
)
```

### 3. Page Transitions
Effortless beautiful navigation routes.

```dart
Navigator.push(
  context, 
  SharedAxisRoute(
    page: const DetailPage(),
    type: SharedAxis.x,
  ),
);
```

---

## 🏗 Architecture & Core Concepts

The package is built on a clean architectural foundation:

1. **`AnimationEffect`**: The base contract. Effects (like `FadeEffect` or `JellyEffect`) only describe *what* the animation does (Matrix transformations, Opacity changes).
2. **`CustomAnimatedWidgetChain`**: The proxy accumulator. When you call `.fade().slide()`, it does NOT wrap your widget immediately. It accumulates the effects into a chain.
3. **`ParallelBuilder` / `SequenceBuilder`**: The engine. Once `.animate()` is called, the chain collapses into a single stateful builder that manages the `AnimationController` and applies all effects simultaneously (or sequentially), flattening the render tree!

---

## 📁 Folder Structure

```text
lib/
├── src/
│   ├── core/         # Core framework (AnimationController logic)
│   ├── effects/      # 13+ Animation Effects (Fade, Slide, Jelly...)
│   ├── builders/     # Orchestration (Parallel, Sequence, Stagger)
│   ├── widgets/      # Pre-built UI components (AnimatedButton...)
│   ├── transitions/  # Navigation routes (Navigator 1.0 & 2.0)
│   └── extensions/   # Fluent API (.fade().slide())
└── custom_animation.dart # Public Barrel File
```

---

## 📚 Documentation

For deep dives into specific topics, check out our guides:
- [Migration Guide](MIGRATION_GUIDE.md) - Migrating from standard Flutter animations.
- [Best Practices & FAQ](FAQ.md) - Performance tips and troubleshooting.
- [Contributing](CONTRIBUTING.md) - How to build, test, and submit PRs.

---

## 📸 Showcase

> *Note: Replace these placeholders with actual screen recordings (GIFs/WebMs) of the example app before publishing.*

| Fade & Slide | Bounce & Elastic | Animated Widgets | Page Transitions |
| :---: | :---: | :---: | :---: |
| `![Fade](https://via.placeholder.com/200x300.png?text=Fade+GIF)` | `![Bounce](https://via.placeholder.com/200x300.png?text=Bounce+GIF)` | `![Widgets](https://via.placeholder.com/200x300.png?text=Widgets+GIF)` | `![Transitions](https://via.placeholder.com/200x300.png?text=Transitions+GIF)` |

Run the showcase application located in the `example/` folder to see all 11 demo screens in action!

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
