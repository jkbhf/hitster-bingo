import 'package:flutter/material.dart';

enum BingoFieldType { title, exactYear, artist, decade, nearYear }

String displayName(BingoFieldType type) {
  switch (type) {
    case BingoFieldType.title:
      return "Titel des Songs";

    case BingoFieldType.exactYear:
      return "Genaues Jahr";

    case BingoFieldType.artist:
      return "Interpret";

    case BingoFieldType.decade:
      return "Jahrzehnt";

    case BingoFieldType.nearYear:
      return "±3 Jahre";
  }
}

Color getTypeColor(BingoFieldType type) {
  switch (type) {
    case BingoFieldType.title:
      return const Color(0xFF40aa5b); // neon green

    case BingoFieldType.exactYear:
      return const Color(0xFFFF62D4); // pink

    case BingoFieldType.artist:
      return const Color(0xFFe6ef3b); // yellow

    case BingoFieldType.decade:
      return const Color(0xFF9466c8); // purple

    case BingoFieldType.nearYear:
      return const Color(0xFF39c0f1); // cyan
  }
}

IconData getIcon(BingoFieldType type) {
  switch (type) {
    case BingoFieldType.title:
      return Icons.music_note_rounded;

    case BingoFieldType.exactYear:
      return Icons.calendar_today;

    case BingoFieldType.artist:
      return Icons.person;

    case BingoFieldType.decade:
      return Icons.history;

    case BingoFieldType.nearYear:
      return Icons.timelapse;
  }
}
