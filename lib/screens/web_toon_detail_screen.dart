import 'package:first/models/webtoon.dart';
import 'package:flutter/material.dart';

class WebToonDetailScreen extends StatelessWidget {
  final WebToonModel webtoon;

  const WebToonDetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Hero(
              tag: webtoon.id,
              child: Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ]),
                child: Image.network(webtoon.thumb),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
