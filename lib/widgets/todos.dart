import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Todos.dart';
import './todo_item.dart';

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    final todosData = Provider.of<TodosProvider>(context);
    return todosData.items.isEmpty
        ? const Center(
            child: Text(
              "NO ITEMS YET",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return ChangeNotifierProvider.value(
                  value: todosData.items[index],
                  child: ToDoItemWidget(),
                );
              }),
              itemCount: todosData.items.length,
            ),
          );
  }
}
