import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_custom_animations/flutter_custom_animations.dart';

void main() {
  group('AnimationConfig', () {
    test('uses default values when not specified', () {
      const config = AnimationConfig();

      expect(config.duration, equals(AnimationDuration.normal));
      expect(config.delay, equals(AnimationConstants.defaultDelay));
      expect(config.curve, equals(AnimationCurves.defaultIn));
      expect(config.reverseCurve, isNull);
      expect(config.repeat, isFalse);
      expect(config.reverse, isFalse);
    });

    test('copyWith updates specified values', () {
      const config = AnimationConfig();
      final updated = config.copyWith(
        duration: AnimationDuration.fast,
        repeat: true,
      );

      expect(updated.duration, equals(AnimationDuration.fast));
      expect(updated.repeat, isTrue);
      // Other values remain unchanged
      expect(updated.curve, equals(AnimationCurves.defaultIn));
    });
  });

  group('AnimationConstants', () {
    test('verify presets', () {
      expect(AnimationDuration.fast, equals(const Duration(milliseconds: 200)));
      expect(AnimationCurves.defaultIn, equals(Curves.easeOut));
    });
  });
}
