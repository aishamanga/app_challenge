import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nav_bar_task/quizPage.dart';

final indexProvider = StateProvider<int>((ref) => 0);
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: [
          quizPage(),
          Text("Text 2"),
          Text("Text 3"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          ref.watch(indexProvider.state).state = index;
        },
        currentIndex: ref.watch(indexProvider),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
