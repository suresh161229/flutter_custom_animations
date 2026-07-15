import 'package:flutter/material.dart';

import 'styles.dart';

class DemoScaffold extends StatefulWidget {
  final String title;
  final Widget child;

  const DemoScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<DemoScaffold> createState() => _DemoScaffoldState();
}

class _DemoScaffoldState extends State<DemoScaffold> {
  Key _key = UniqueKey();

  void _replay() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _replay,
            tooltip: 'Replay Animation',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        key: _key, // Changing the key forces the child subtree to rebuild, re-triggering animations
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: widget.child,
        ),
      ),
    );
  }
}

class DemoBox extends StatelessWidget {
  final String label;
  final Color? color;
  
  const DemoBox({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color ?? AppStyles.primary,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: (color ?? AppStyles.primary).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
