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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            Image(image: const AssetImage('assets/logo.png'), fit: BoxFit.contain),

            SizedBox(height: 24),

            Center(child: AspectRatio(aspectRatio: 1.0, child: BingoBoard())),
          ],
        ),
      ),
    );
  }
}
