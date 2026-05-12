import 'package:hitster/models/bingo_field_type.dart';

class BingoField {
  final BingoFieldType type;
  bool isChecked;

  BingoField({required this.type, this.isChecked = false});

  Map<String, dynamic> toJson() {
    return {'type': type.index, 'isChecked': isChecked};
  }

  factory BingoField.fromJson(Map<String, dynamic> json) {
    return BingoField(type: BingoFieldType.values[json['type']], isChecked: json['isChecked']);
  }
}
