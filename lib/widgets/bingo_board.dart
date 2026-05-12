import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hitster/models/bingo_field.dart';
import 'package:hitster/models/bingo_field_type.dart';
import 'package:hitster/widgets/bingo_field_widget.dart';

class BingoBoard extends StatefulWidget {
  const BingoBoard({super.key});

  @override
  State<BingoBoard> createState() => _BingoBoardState();
}

class _BingoBoardState extends State<BingoBoard> {
  late final List<BingoField> fields = List.generate(
    25,
    (index) => BingoField(type: BingoFieldType.values[Random().nextInt(BingoFieldType.values.length)]),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 8, spreadRadius: 2),
          BoxShadow(color: Colors.white.withValues(alpha: 0.05), blurRadius: 16, spreadRadius: 4),
        ],
      ),
      child: GridView.builder(
        itemCount: fields.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final field = fields[index];

          return BingoFieldWidget(
            field: field,
            onTap: () {
              setState(() {
                field.isChecked = !field.isChecked;
              });
            },
          );
        },
      ),
    );
  }
}
