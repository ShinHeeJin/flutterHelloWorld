import 'package:first/models/webtoon.dart';
import 'package:first/screens/web_toon_detail_screen.dart';
import 'package:flutter/material.dart';

class WebToonWidget extends StatelessWidget {
  const WebToonWidget({
    super.key,
    required this.webtoon,
  });

  final WebToonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebToonDetailScreen(webtoon: webtoon),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
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
          const SizedBox(height: 10),
          Text(
            webtoon.title,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
