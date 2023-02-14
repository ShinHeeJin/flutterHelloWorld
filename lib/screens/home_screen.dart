import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
      ]),
    );
  }
}
