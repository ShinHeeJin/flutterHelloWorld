import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(children: [
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hey, Selena",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Welcom back",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 18),
                    ),
                  ],
                )
              ],
            )
          ]),
        ),
        backgroundColor: Color(0xFF181818),
      ),
    );
  }
}
