import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hitster/widgets/bingo_board.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 24),

              Image.asset('assets/logo.png', fit: BoxFit.contain),

              const SizedBox(height: 24),

              Center(child: AspectRatio(aspectRatio: 1.0, child: BingoBoard())),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  border: Border.all(color: Colors.white24, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ValueListenableBuilder<TextEditingValue>(
                      valueListenable: controller,
                      builder: (context, value, child) {
                        final textLength = value.text.length;

                        double fontSize = 120;

                        if (textLength == 0) {
                          fontSize = 42;
                        }

                        if (textLength > 0 && textLength <= 6) {
                          fontSize = 120;
                        }

                        if (textLength > 6) {
                          fontSize = 100;
                        }

                        if (textLength > 9) {
                          fontSize = 58;
                        }

                        return SizedBox(
                          height: 170,
                          child: TextField(
                            controller: controller,
                            maxLines: 2,
                            minLines: 1,
                            expands: false,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.patrickHand(
                              color: Colors.white,
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Write something...',
                              hintStyle: TextStyle(color: Colors.white38),
                              border: InputBorder.none,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
