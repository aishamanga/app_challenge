import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: const [
        // list tile with name
        Positioned(
            top: 10,
            left: 10,
            right: 10,
            height: 50,
            child: TopBarWidget(name: 'Aisha Manga')),
        // buttons with options
        Positioned(left: 10, right: 10, bottom: 10, child: _ButtonOptions())
      ],
    );
  }
}

class TopBarWidget extends ConsumerWidget {
  const TopBarWidget({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // welcome message with name
        Text("Welcome back, $name "),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
      ],
    );
  }
}

class _ButtonOptions extends ConsumerWidget {
  const _ButtonOptions();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Join a quiz')),
            ElevatedButton(
                onPressed: () {}, child: const Text('Create new quiz'))
          ],
        ),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Statistics')),
            ElevatedButton(onPressed: () {}, child: const Text('View Catalog')),
          ],
        )
      ],
    );
  }
}
