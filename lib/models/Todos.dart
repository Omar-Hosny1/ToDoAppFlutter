import 'package:flutter/cupertino.dart';

import './Todo.dart';

class TodosProvider with ChangeNotifier {
  final List<TodoItem> _items = [];

  List<TodoItem> get items {
    return [..._items];
  }

  onAddTodo({required TodoItem item}) {
    _items.add(item);
    notifyListeners();
  }

  onRemoveTodo({required String id}) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
