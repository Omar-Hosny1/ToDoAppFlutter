// ignore_for_file: unnecessary_this

import 'package:flutter/cupertino.dart';

class TodoItem with ChangeNotifier {
  final String text;
  final String id;
  bool isCompeleted;

  TodoItem({
    required this.id,
    required this.text,
    this.isCompeleted = false,
  });

  void toggleFavorite() {
    isCompeleted = !isCompeleted;
    notifyListeners();
  }
}
