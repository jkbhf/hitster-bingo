import 'package:hitster/models/bingo_field_type.dart';

class BingoField {
  final BingoFieldType type;
  bool isChecked;

  BingoField({required this.type, this.isChecked = false});
}
