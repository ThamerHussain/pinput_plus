pinput_plus
===========

A Flutter package providing a highly customizable PIN/OTP input widget.

This package is a maintained fork inspired by the original pinput package, with updates and fixes tailored for our use case.

Features
--------
- Separator customization
- Animated decoration switching
- Form validation
- SMS autofill (iOS/Android)
- Custom cursor with animation
- Clipboard detection
- Obscuring character/widget
- Haptic feedback
- Works with native or custom keyboards

Separator customization
-----------------------
Pinput Plus offers flexible control over separators between fields via `separator` and `separatorPositions`:

- **`separator`**: a builder `Widget? Function(int index)` that returns a widget inserted between fields at the given insertion `index`.
- **`separatorPositions`**: optional list of insertion positions. By default, a separator is inserted between every adjacent field.

Examples:

```dart
Pinput(
  length: 6,
  // Insert a fixed gap between every field
  separator: (index) => const SizedBox(width: 12),
)
```

```dart
Pinput(
  length: 6,
  // Group as 3-3 with a styled vertical divider in the middle
  separatorPositions: const [3],
  separator: (index) => Container(
    width: 1,
    height: 24,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    color: Colors.grey.shade400,
  ),
)
```

```dart
Pinput(
  length: 6,
  // Return different separators by index for fine-grained control
  separator: (index) {
    if (index == 3) {
      return const SizedBox(width: 20);
    }
    return const SizedBox(width: 8);
  },
)
```

Installation
------------
```yaml
dependencies:
  pinput_plus: ^1.0.0
```

Usage
-----
```dart
import 'package:flutter/material.dart';
import 'package:pinput_plus/new_pinput.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Center(
      child: Pinput(
        length: 6,
        controller: controller,
        onCompleted: (code) => debugPrint('Code: $code'),
      ),
    );
  }
}
```

Example App
-----------
See the `example/` directory for a minimal Flutter app demonstrating usage.

License
-------
MIT. See `LICENSE`.

Acknowledgements
----------------
Based on and inspired by the original pinput / new_pinput packages and contributors.


