import 'package:api_task/screens/comments_data.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(child: FetchComments())
        ],
      ),
    );
  }
}
