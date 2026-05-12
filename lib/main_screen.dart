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
  final GlobalKey<BingoBoardState> boardKey = GlobalKey<BingoBoardState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                const SizedBox(height: 24),

                Row(
                  children: [
                    Image.asset('assets/logo.png', fit: BoxFit.contain, height: 70),

                    const Spacer(),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFFFA3E8).withOpacity(0.6)),
                        gradient: const LinearGradient(colors: [Color(0xFF1A0B16), Color(0xFF24121F)]),
                        boxShadow: [BoxShadow(color: const Color(0xFFFFA3E8).withOpacity(0.12), blurRadius: 8)],
                      ),
                      child: IconButton(
                        onPressed: () {
                          boardKey.currentState?.resetBoard();
                        },
                        icon: const Icon(Icons.refresh_rounded, color: Color(0xFFFFA3E8)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Center(
                  child: AspectRatio(aspectRatio: 1.0, child: BingoBoard(key: boardKey)),
                ),

                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [const Color(0xFF1A0B16), const Color(0xFF24121F), const Color(0xFF12070F)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFFFA3E8).withOpacity(0.75), width: 2),

                    boxShadow: [
                      BoxShadow(color: const Color(0xFFFFA3E8).withOpacity(0.18), blurRadius: 10, spreadRadius: 0),
                    ],
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
                              cursorColor: const Color(0xFFFFA3E8),

                              style: GoogleFonts.patrickHand(
                                color: Colors.white,
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                shadows: [Shadow(color: const Color(0xFFFFA3E8).withOpacity(0.35), blurRadius: 6)],
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
      ),
    );
  }
}
