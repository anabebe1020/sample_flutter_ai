import 'package:flutter/material.dart';
import 'package:flutter_ai/features/sample/view/recommend_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RecommendScreen()),
          );
        },
      ),
      body: Center(child: const Text('Welcome to the Home Page!')),
    );
  }
}
