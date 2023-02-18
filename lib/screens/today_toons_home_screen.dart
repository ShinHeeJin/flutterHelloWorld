import 'package:flutter/material.dart';

class TodayToonsHomeScreen extends StatefulWidget {
  const TodayToonsHomeScreen({super.key});

  @override
  State<TodayToonsHomeScreen> createState() => _TodayToonsHomeScreenState();
}

class _TodayToonsHomeScreenState extends State<TodayToonsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
