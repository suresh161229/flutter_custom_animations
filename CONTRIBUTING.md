# Contributing to `custom_animation`

We love your input! We want to make contributing to this project as easy and transparent as possible.

## Development Setup

1. **Fork the repo** and clone it locally.
2. Ensure you have the latest stable version of Flutter installed.
3. Run `flutter pub get` in the root directory.
4. Run `flutter pub get` in the `example/` directory.

## Testing Strategy

This package maintains a strictly enforced 100% coverage requirement.
Before submitting a Pull Request, ensure you run the test suite:

```bash
flutter test
```

### Golden Tests
We use visual regression testing (Golden tests). If you modify a visual component (like `AnimatedButton`), you must update the golden snapshots:

```bash
flutter test --update-goldens
```
*Note: Run golden updates on a standardized environment (e.g., macOS or specific CI container) to prevent font-rendering diffs.*

## Versioning Strategy

We follow [SemVer 2.0.0](https://semver.org/).
- **MAJOR** version for incompatible API changes (e.g., renaming an extension method).
- **MINOR** version for adding functionality in a backwards compatible manner (e.g., adding a new effect like `SqueezeEffect`).
- **PATCH** version for backwards compatible bug fixes.

## Pull Request Process

1. Update the `README.md` with details of changes to the interface, if applicable.
2. Update the `CHANGELOG.md` with a summary of your changes under the `[Unreleased]` tag.
3. Ensure the CI pipeline passes (Flutter Analyze, Flutter Test).
4. Request review from a maintainer.
