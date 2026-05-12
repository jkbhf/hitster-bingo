import 'package:flutter/material.dart';
import 'package:hitster/models/bingo_field.dart';
import 'package:hitster/models/bingo_field_type.dart';
import 'package:hitster/widgets/bingo_field_widget.dart';

class BingoBoard extends StatefulWidget {
  const BingoBoard({super.key});

  @override
  State<BingoBoard> createState() => BingoBoardState();
}

class BingoBoardState extends State<BingoBoard> {
  late List<BingoField> fields = generateBoard();

  List<BingoField> generateBoard() {
    while (true) {
      final pool = <BingoFieldType>[];

      // Each type exactly 5 times
      for (final type in BingoFieldType.values) {
        for (int i = 0; i < 5; i++) {
          pool.add(type);
        }
      }

      pool.shuffle();

      if (isValid(pool)) {
        return pool.map((type) => BingoField(type: type)).toList();
      }
    }
  }

  bool isValid(List<BingoFieldType> grid) {
    // Check rows
    for (int row = 0; row < 5; row++) {
      final rowValues = grid.skip(row * 5).take(5).toList();

      // At least 4 unique types
      if (rowValues.toSet().length < 4) {
        return false;
      }

      // No 3 identical in a row
      for (int i = 0; i < 3; i++) {
        if (rowValues[i] == rowValues[i + 1] && rowValues[i] == rowValues[i + 2]) {
          return false;
        }
      }
    }

    // Check columns
    for (int col = 0; col < 5; col++) {
      final colValues = <BingoFieldType>[];

      for (int row = 0; row < 5; row++) {
        colValues.add(grid[row * 5 + col]);
      }

      // At least 4 unique types
      if (colValues.toSet().length < 4) {
        return false;
      }

      // No 3 identical in a column
      for (int i = 0; i < 3; i++) {
        if (colValues[i] == colValues[i + 1] && colValues[i] == colValues[i + 2]) {
          return false;
        }
      }
    }

    return true;
  }

  void resetBoard() {
    setState(() {
      fields = generateBoard();
    });
  }

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
