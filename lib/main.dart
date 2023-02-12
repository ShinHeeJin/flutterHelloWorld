import 'package:first/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
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
            ),
            const SizedBox(
              height: 120,
            ),
            Text(
              'Total Balance',
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '\$5 194 382',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Button(
                    bgColor: Color(0xFFF1B33B),
                    textColor: Colors.black,
                    text: 'Transfer'),
                Button(
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                    text: 'Request'),
              ],
            )
          ]),
        ),
        backgroundColor: const Color(0xFF181818),
      ),
    );
  }
}
