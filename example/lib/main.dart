import 'package:flutter/material.dart';
import 'package:pinput_plus/pinput_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'pinput_plus example', home: const ExamplePage());
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pinput_plus example')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Default (no custom separator)'),
          const SizedBox(height: 8),
          Pinput(
            length: 6,
            controller: controller,
            onCompleted: (code) => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Code: $code'))),
          ),
          const SizedBox(height: 24),
          const Text('Fixed spacing between each field'),
          const SizedBox(height: 8),
          Pinput(
            length: 6,
            separator: (index) => const SizedBox(width: 12),
          ),
          const SizedBox(height: 24),
          const Text('Group 3-3 with a vertical divider'),
          const SizedBox(height: 8),
          Pinput(
            length: 6,
            separatorPositions: const [3],
            separator: (index) => Container(
              width: 1,
              height: 24,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 24),
          const Text('Dynamic separators (larger gap after third)'),
          const SizedBox(height: 8),
          Pinput(
            length: 6,
            separator: (index) {
              if (index == 3) {
                return const SizedBox(width: 20);
              }
              return const SizedBox(width: 8);
            },
          ),
        ],
      ),
    );
  }
}
