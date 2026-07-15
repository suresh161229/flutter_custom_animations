import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

class DemoItem {
  final String title;
  final String subtitle;
  final WidgetBuilder builder;

  const DemoItem({
    required this.title,
    required this.subtitle,
    required this.builder,
  });
}

class CategoryScreen extends StatelessWidget {
  final String title;
  final List<DemoItem> demos;

  const CategoryScreen({super.key, required this.title, required this.demos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title).fade().scale().animate(),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: CustomAnimatedList(
        effects: const [
          FadeEffect(begin: 0, end: 1),
          SlideEffect(begin: Offset(0, 0.2), end: Offset.zero),
          ScaleEffect(begin: 0.9, end: 1),
        ],
        staggerDuration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(16),
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final item = demos[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SharedAxisRoute(
                    page: item.builder(context),
                    type: SharedAxis.x,
                  ),
                );
              },
              child: AnimatedCard(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.subtitle,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.white30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
