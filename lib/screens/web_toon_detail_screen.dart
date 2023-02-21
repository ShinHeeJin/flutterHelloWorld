import 'package:first/models/webtoon.dart';
import 'package:first/models/webtoon_detail.dart';
import 'package:first/models/webtoon_senario.dart';
import 'package:first/services/api_service.dart';
import 'package:first/widgets/webtoon_senario_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebToonDetailScreen extends StatefulWidget {
  final WebToonModel webtoon;
  const WebToonDetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<WebToonDetailScreen> createState() => _WebToonDetailScreenState();
}

class _WebToonDetailScreenState extends State<WebToonDetailScreen> {
  late Future<WebtoonDetailModel> webtoonDetail;
  late Future<List<WebtoonSenarioModel>> webtoonSenarios;
  late SharedPreferences pref;
  bool isLiked = false;

  Future initPref() async {
    pref = await SharedPreferences.getInstance();

    final likedToons = pref.getStringList("likedToons");
    if (likedToons != null) {
      if (likedToons.contains(widget.webtoon.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await pref.setStringList("likedToons", []);
    }
  }

  void onHeartTap() async {
    final likedToons = pref.getStringList("likedToons");
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.webtoon.id);
      } else {
        likedToons.add(widget.webtoon.id);
      }
      await pref.setStringList("likedToons", likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webtoonDetail = ApiService.getWebtoonDetailById(widget.webtoon.id);
    webtoonSenarios = ApiService.getWebtoonSenariosById(widget.webtoon.id);
    initPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          widget.webtoon.title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: onHeartTap,
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border_outlined,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: widget.webtoon.id,
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
                        child: Image.network(widget.webtoon.thumb),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: webtoonDetail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${snapshot.data!.genre} / ${snapshot.data!.age}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    }
                    return const Text("...");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                FutureBuilder(
                  future: webtoonSenarios,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (var senario in snapshot.data!)
                            SenarioWidget(
                              webtoon: widget.webtoon,
                              senario: senario,
                            )
                        ],
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
