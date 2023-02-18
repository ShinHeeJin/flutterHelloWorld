import 'package:first/models/webtoon.dart';
import 'package:first/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:first/widgets/my_webtoon_widget.dart';

class TodayToonsHomeScreen extends StatelessWidget {
  TodayToonsHomeScreen({super.key});

  final Future<List<WebToonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          title: const Text("오늘의 웹툰", style: TextStyle(fontSize: 20)),
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(height: 50),
                  Expanded(child: makeWebToonListView(snapshot)),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  ListView makeWebToonListView(AsyncSnapshot<List<WebToonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) =>
          WebToonWidget(webtoon: snapshot.data![index]),
      separatorBuilder: (context, index) => const SizedBox(width: 15),
    );
  }
}
