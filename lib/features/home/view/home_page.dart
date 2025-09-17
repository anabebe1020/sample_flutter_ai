import 'package:flutter/material.dart';
import 'package:flutter_ai/features/sample/view/recommend_feature_page.dart';
import 'package:flutter_ai/features/sample/view/recommend_stream_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecommendScreen(),
                ),
              );
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.stream),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const StreamScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(child: const Text('Welcome to the Home Page!')),
    );
  }
}
