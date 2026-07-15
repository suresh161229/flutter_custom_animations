# custom_animation

[![Pub Version](https://img.shields.io/pub/v/custom_animation?color=blue)](https://pub.dev/packages/custom_animation)
[![Flutter Build](https://github.com/SureshBabu/custom_animation/actions/workflows/flutter.yml/badge.svg)](https://github.com/SureshBabu/custom_animation/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A reusable, production-ready Flutter animation framework providing customizable animation effects, animated widgets, page transitions, complex builders, and extremely convenient widget extensions.

## Introduction

`custom_animation` removes the boilerplate from Flutter animations. Instead of manually managing `AnimationController`s, `Tween`s, and `SingleTickerProviderStateMixin`s, you can add high-quality, performant animations to your apps using dead-simple widget extensions and pre-built animated widgets.

## Features

* **Animation Core:** Built on a highly optimized internal core handling controllers and lifecycles automatically.
* **Animation Effects:** Fade, Slide, Scale, Rotation, Bounce, Shake, Pulse, Flip, Blur, Zoom.
* **Animated Widgets:** Pre-built `AnimatedButton`, `AnimatedCard`, `AnimatedDialog`, `AnimatedContainer`, `AnimatedList`, `CustomAnimatedGrid`, and more.
* **Navigation Transitions:** Beautiful page transitions like `FadeRoute`, `SlideRoute`, `HeroRoute`, `SharedAxisRoute`, and more.
* **Animation Builders:** `SequenceBuilder`, `StaggerBuilder`, `ChainBuilder`, and `ParallelBuilder` to create incredibly complex chained animations with ease.
* **Widget Extensions:** Simply add `.animate()`, `.fadeIn()`, or `.slideIn()` to ANY Flutter widget to instantly animate it!

## Why custom_animation?

Traditional Flutter animations require significant boilerplate, making UI code verbose and harder to read. `custom_animation` drastically simplifies this by allowing declarative animations directly in the widget tree, reducing boilerplate by up to 80% while retaining full control over durations, curves, and sequences.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  custom_animation: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Basic Usage

The easiest way to animate any widget is using our **Widget Extensions**:

```dart
import 'package:custom_animation/custom_animation.dart';

// Just append `.fadeIn()` to any widget!
Text('Hello World').fadeIn(
  duration: const Duration(seconds: 1),
  curve: Curves.easeOut,
);
```

You can even chain them:

```dart
Container(width: 100, height: 100, color: Colors.blue)
  .fadeIn(delay: const Duration(milliseconds: 200))
  .scaleIn(duration: const Duration(milliseconds: 500));
```

## Animated Widgets

Need a button that scales down on press? Just use `AnimatedButton`:

```dart
AnimatedButton(
  onPressed: () => print('Tapped!'),
  child: const Text('Tap Me'),
);
```

## Animation Builders

For complex, staggered lists, use the `CustomAnimatedList`:

```dart
CustomAnimatedList(
  itemCount: 20,
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item \$index'));
  },
  duration: const Duration(milliseconds: 300),
  staggerDuration: const Duration(milliseconds: 50),
  effects: const [FadeEffect(), SlideEffect(begin: Offset(0, 50))],
);
```

## Navigation Transitions

Make your page routing beautiful:

```dart
Navigator.push(
  context,
  SharedAxisRoute(
    page: const DetailsScreen(),
    transitionType: SharedAxisTransitionType.horizontal,
  ),
);
```

## Architecture Overview

The framework is divided into:
1. `core`: Internal handlers for AnimationControllers.
2. `effects`: Definitions for different animation types (Fade, Slide, Scale).
3. `widgets`: Smart widgets that automatically consume effects.
4. `transitions`: Page route transitions.
5. `builders`: Orchestrators for staggering and sequencing.
6. `extensions`: Syntactic sugar for rapid development.

## Best Practices

* Use const constructors wherever possible.
* Prefer Widget Extensions (`.fadeIn()`) for simple animations to keep the widget tree clean.
* Use `CustomAnimatedList` instead of manually staggering children in a `ListView`.
* Keep animation durations under 500ms for a snappy user experience.

## Example Application

Check out the `example/` folder in the repository for a comprehensive showcase of every single feature, effect, and widget available in the framework.

## Roadmap

* Add 3D card flipping widgets.
* Support for implicit layout animations.
* Integration with Rive animations.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on our GitHub repository. Make sure to run `flutter analyze` and `flutter test` before submitting.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
