import 'package:flutter/material.dart';
import 'package:hitster/models/bingo_field.dart';
import 'package:hitster/models/bingo_field_type.dart';

class BingoFieldWidget extends StatelessWidget {
  final BingoField field;
  final VoidCallback onTap;

  const BingoFieldWidget({super.key, required this.field, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = getTypeColor(field.type);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: color,
          gradient: RadialGradient(
            colors: [Colors.white.withAlpha(225), color, color.withValues(alpha: 0.95)],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),

        child: field.isChecked ? const Center(child: Icon(Icons.close, color: Colors.white, size: 64)) : null,
      ),
    );
  }
}
