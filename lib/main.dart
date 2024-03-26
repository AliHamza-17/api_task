import 'package:api_task/providers/comments_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_task/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommentsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comments Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
