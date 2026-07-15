# Migration Guide

This guide helps you transition from boilerplate-heavy traditional Flutter animations to the clean `flutter_custom_animations` syntax.

## Migrating `AnimationController`

### Traditional Way
```dart
class _MyState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: Text("Hello"),
    );
  }
}
```

### With `flutter_custom_animations`
You no longer need to convert your `StatelessWidget` to a `StatefulWidget`, and you don't need `SingleTickerProviderStateMixin`.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("Hello")
        .fade(begin: 0, end: 1)
        .animate(duration: const Duration(seconds: 1));
  }
}
```

## Migrating PageRoutes

### Traditional Way
```dart
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const DetailPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  ),
);
```

### With `flutter_custom_animations`
```dart
Navigator.push(context, FadeRoute(page: const DetailPage()));
```

*Note: For Navigator 2.0 (Router API), simply use `FadePage(child: const DetailPage())` in your page list.*
