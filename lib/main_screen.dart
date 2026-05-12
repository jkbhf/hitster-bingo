import 'package:flutter/material.dart';
import 'package:hitster/widgets/bingo_board.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image(
              image: const AssetImage('assets/logo.png'),
              width: size * 0.6,
              height: size * 0.2,
              fit: BoxFit.contain,
            ),

            Center(child: AspectRatio(aspectRatio: 1.0, child: BingoBoard())),
          ],
        ),
      ),
    );
  }
}
