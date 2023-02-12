import 'package:first/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Welcom back",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text(
                'Total Balance',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '\$5 194 382',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                    bgColor: Color(0xFFF1B33B),
                    textColor: Colors.black,
                    text: 'Transfer',
                  ),
                  Button(
                    bgColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                    text: 'Request',
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Wallets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "view all",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2123),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Euro",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text(
                                "6 428",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "EUR",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 2.2,
                        child: Transform.translate(
                          offset: const Offset(10, 15),
                          child: const Icon(
                            Icons.euro_outlined,
                            color: Colors.white,
                            size: 98,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
