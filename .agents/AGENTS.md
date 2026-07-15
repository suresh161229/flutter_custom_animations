# Global Engineering Rules

1. Never duplicate AnimationController logic.
2. Always reuse the animation core.
3. Every milestone must compile successfully before proceeding.
4. Run flutter analyze after each milestone and fix all issues.
5. Add widget tests for every public component.
6. Keep the public API minimal; expose only what consumers need.
7. Document all public classes and methods with DartDoc comments.
8. Follow Effective Dart style guidelines.
9. Optimize for performance by minimizing unnecessary rebuilds and disposing controllers correctly.
10. Preserve backward compatibility for future versions where possible.
11. Use const constructors wherever applicable.
12. Ensure all examples in the example app are runnable without modification.
13. Keep each feature modular so new animation types can be added without changing existing APIs.
14. Do not proceed to the next milestone until the current one is complete, tested, and verified.
