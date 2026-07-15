# Best Practices, Troubleshooting & FAQ

## Best Practices

### 1. Avoid Deep Nesting
Do not nest multiple `Builder` widgets. Use the Fluent API chaining instead.
**Don't:**
```dart
const DemoBox().fade().animate(child: const DemoBox().slide().animate());
```
**Do:**
```dart
const DemoBox().fade().slide().animate();
```

### 2. Use `const`
Because `flutter_custom_animations` evaluates the widget chain at build time, using `const` on your effects and child widgets allows Flutter to drastically optimize the rendering pipeline.

## FAQ

### 1. Why is my animation not looping?
Make sure you call `.animate(repeat: true)` at the end of your chain. By default, animations play once and stop.

### 2. The Hero animation doesn't look right during a route transition!
When using `HeroRoute`, ensure the destination `Scaffold` or barrier has a transparent or explicit background color. If the transition feels abrupt, verify that the `tag` matches perfectly on both ends.

### 3. How do I trigger animations on scroll?
Currently, `flutter_custom_animations` focuses on entrance and state animations. For scroll-based animations, use `CustomAnimatedList` which automatically staggers the entrance of items as they are lazily built by the `ListView`.

## Troubleshooting

- **Error: `Bad state: No element` in tests**
  - Make sure you wrap your custom effects in an `AnimatedBuilder` inside your tests if you are testing raw `AnimationEffect` classes directly, as they require a valid context.
- **Error: Linter complains about `child` parameter**
  - Flutter's `sort_child_properties_last` rule requires the `child` argument to be placed last. We've designed our widgets (like `AnimatedButton`) to support this natively. If you use the `.animate()` extension, you don't even need to provide a `child` parameter!
