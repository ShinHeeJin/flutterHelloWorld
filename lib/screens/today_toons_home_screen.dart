import 'package:first/models/webtoon.dart';
import 'package:first/services/api_service.dart';
import 'package:flutter/material.dart';

class TodayToonsHomeScreen extends StatelessWidget {
  TodayToonsHomeScreen({super.key});

  late Future<List<WebToonModel>> webtoons = ApiService().getTodayToons();

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
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Center(
                child: Text("There is data!"),
              );
            }
            return const Center(
              child: Text("Loading ..."),
            );
          },
        ),
      ),
    );
  }
}
