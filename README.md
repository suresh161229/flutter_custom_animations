# flutter_custom_animations

[![Pub Version](https://img.shields.io/pub/v/flutter_custom_animations?color=blue)](https://pub.dev/packages/flutter_custom_animations)
[![Flutter Build](https://github.com/suresh161229/flutter_custom_animations/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/suresh161229/flutter_custom_animations/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A reusable, production-ready Flutter animation framework providing customizable animation effects, animated widgets, page transitions, complex builders, and extremely convenient widget extensions.

## Overview

`flutter_custom_animations` removes the boilerplate from Flutter animations. Instead of manually managing `AnimationController`s, `Tween`s, and `SingleTickerProviderStateMixin`s, you can add high-quality, performant animations to your apps using dead-simple widget extensions and pre-built animated widgets.

## Features

- **Animation Core:** Built on a highly optimized internal core handling controllers and lifecycles automatically.
- **Animation Effects:** Fade, Slide, Scale, Rotation, Bounce, Shake, Pulse, Flip, Blur, Zoom.
- **Animated Widgets:** Pre-built `AnimatedButton`, `AnimatedCard`, `AnimatedDialog`, `AnimatedContainer`, `AnimatedList`, `CustomAnimatedGrid`, and more.
- **Navigation Transitions:** Beautiful page transitions like `FadeRoute`, `SlideRoute`, `HeroRoute`, `SharedAxisRoute`, and more.
- **Animation Builders:** `SequenceBuilder`, `StaggerBuilder`, `ChainBuilder`, and `ParallelBuilder` to create incredibly complex chained animations with ease.
- **Widget Extensions:** Simply add `.animate()`, `.fadeIn()`, or `.slideIn()` to ANY Flutter widget to instantly animate it!

## Architecture

The framework is cleanly modularized into:
1. `core`: Internal handlers and lifecycle management for `AnimationControllers`.
2. `effects`: Definitions for different animation types (Fade, Slide, Scale).
3. `widgets`: Smart widgets that automatically consume effects.
4. `transitions`: Ready-to-use page route transitions.
5. `builders`: Orchestrators for staggering and sequencing animations.
6. `extensions`: Syntactic sugar for rapid development without nesting.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_custom_animations: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Import

```dart
import 'package:flutter_custom_animations/flutter_custom_animations.dart';
```

## Quick Start

The absolute easiest way to animate any widget is using our **Widget Extensions**. You don't need to wrap your widget in anything, just call the extension method directly!

### Widget Extensions

```dart
// Just append `.fadeIn()` to any widget!
Text('Hello World').fadeIn(
  duration: const Duration(seconds: 1),
  curve: Curves.easeOut,
);
```

You can chain them seamlessly:

```dart
Container(width: 100, height: 100, color: Colors.blue)
  .fadeIn(delay: const Duration(milliseconds: 200))
  .scaleIn(duration: const Duration(milliseconds: 500));
```

### Animated Widgets

Need a button that scales down beautifully on press? Just use `AnimatedButton`:

```dart
AnimatedButton(
  onPressed: () => print('Tapped!'),
  child: const Text('Tap Me'),
);
```

### Animation Builders

For complex, staggered lists, use the `CustomAnimatedList`:

```dart
CustomAnimatedList(
  itemCount: 20,
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item $index'));
  },
  duration: const Duration(milliseconds: 300),
  staggerDuration: const Duration(milliseconds: 50),
  effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 50))],
);
```

### Transitions

Make your page routing beautiful with zero effort:

```dart
Navigator.push(
  context,
  SharedAxisRoute(
    page: const DetailsScreen(),
    transitionType: SharedAxisTransitionType.horizontal,
  ),
);
```

## API Overview

The `flutter_custom_animations` framework exports highly modular components:
- **Core Widgets:** `CustomAnimatedContainer`, `AnimatedText`, `AnimatedImage`, `AnimatedCard`, `AnimatedDialog`.
- **Form & Input:** `AnimatedButton`, `AnimatedTextField`, `AnimatedSearchBar`, `AnimatedFab`.
- **Layouts:** `CustomAnimatedList`, `CustomAnimatedGrid`, `AnimatedBottomNavigationBar`, `AnimatedDrawer`.
- **Transitions:** `FadeRoute`, `SlideRoute`, `ScaleRoute`, `ZoomRoute`, `SharedAxisRoute`, `HeroRoute`, `CupertinoRoute`, `MaterialMotionRoute`.

## Example Application

Check out the `example/` folder in the repository for a comprehensive showcase of every single feature, effect, and widget available in the framework.
Run it locally to see the animations in action!

*(Screenshots placeholder - to be added)*

## Folder Structure

```
lib/
├── src/
│   ├── builders/     # Complex animation sequencers
│   ├── core/         # State & lifecycle management
│   ├── effects/      # Atomic animation behaviors
│   ├── extensions/   # Syntactic sugar for standard widgets
│   ├── mixins/       # Reusable logic
│   ├── transitions/  # Page route definitions
│   ├── utils/        # Utilities
│   └── widgets/      # Pre-built animated components
└── flutter_custom_animations.dart
```

## Performance & Best Practices

- **Use const constructors** wherever possible to prevent unnecessary rebuilds.
- **Prefer Widget Extensions (`.fadeIn()`)** for simple, one-off animations to keep the widget tree clean and readable.
- **Use `CustomAnimatedList`** instead of manually staggering children in a standard `ListView` for massive performance and syntax benefits.
- **Keep animation durations under 500ms** to maintain a snappy, responsive user experience.

## Contributing

Contributions are completely welcome! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for guidelines on how to get started.
Make sure to run `flutter analyze` and `flutter test` before submitting a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Roadmap

- Add 3D card flipping widgets.
- Support for implicit layout animations.
- Integration with Rive animations.
