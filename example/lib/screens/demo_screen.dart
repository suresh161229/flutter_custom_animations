import 'package:flutter/material.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

class DemoScreen extends StatelessWidget {
  final String title;
  final String description;
  final String codeSnippet;
  final Widget demoWidget;

  const DemoScreen({
    super.key,
    required this.title,
    required this.description,
    required this.codeSnippet,
    required this.demoWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title).fade().slide(begin: const Offset(0, -0.5)).animate(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade900, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 3, child: Center(child: demoWidget)),
              Expanded(
                flex: 4,
                child:
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                        border: Border(
                          top: BorderSide(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                                description,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              )
                              .fade()
                              .slide(begin: const Offset(0, 0.2))
                              .animate(
                                delay: const Duration(milliseconds: 100),
                              ),
                          const SizedBox(height: 24),
                          const Text(
                                'Implementation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              .fade()
                              .slide(begin: const Offset(0, 0.2))
                              .animate(
                                delay: const Duration(milliseconds: 200),
                              ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: SingleChildScrollView(
                                    child: Text(
                                      codeSnippet,
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        color: Colors.greenAccent,
                                        fontSize: 13,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                )
                                .fade()
                                .scale(begin: 0.95)
                                .animate(
                                  delay: const Duration(milliseconds: 300),
                                ),
                          ),
                        ],
                      ),
                    ).fade().slide(begin: const Offset(0, 0.5)).animate(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
